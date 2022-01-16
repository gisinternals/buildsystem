param($installPath, $toolsPath, $package, $project)


# All GdalConfiguration code files (for C# and VB) have been added by nuget because they are ContentFiles.
# Now, try to detect the project language and remove the unnecessary file after the installation.


function RemoveUnnecessaryCodeFile($project)
{
    $projectFullName = $project.FullName
    $codeFile = ""
    $removeCodeFile = ""

    if ($projectFullName -like "*.csproj*")
    {
        $codeFile = "GdalConfiguration.cs"
        $removeCodeFile = "GdalConfiguration.vb"
        Write-Host "Identified as C# project, installing '$codeFile'"
    }

    if ($projectFullName -like "*.vbproj*")
    {
        $codeFile = "GdalConfiguration.vb"
        $removeCodeFile = "GdalConfiguration.cs"
        Write-Host "Identified as VB project, installing '$codeFile'"
    }

    if ($removeCodeFile -eq "")
    {
        Write-Host "Could not find a supported project file (*.csproj, *.vbproj). You will get both code files and have to clean up manually. Sorry :("
    }
    else
    {
        # Delete the unnecessary code file (like *.vb for C# projects)
        #   Remove() would only remove it from the VS project, whereas 
        #   Delete() additionally deletes it from disk as well
        $project.ProjectItems.Item($removeCodeFile).Delete()
    }
}

RemoveUnnecessaryCodeFile -Project ($project)