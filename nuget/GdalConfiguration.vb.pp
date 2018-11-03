'******************************************************************************
'*
'* Name:     GdalConfiguration.cs.pp
'* Project:  GDAL CSharp Interface
'* Purpose:  A static configuration utility class to enable GDAL/OGR.
'* Author:   Felix Obermaier
'*
'******************************************************************************
'* Copyright (c) 2012-2018, Felix Obermaier
'*
'* Permission is hereby granted, free of charge, to any person obtaining a
'* copy of this software and associated documentation files (the "Software"),
'* to deal in the Software without restriction, including without limitation
'* the rights to use, copy, modify, merge, publish, distribute, sublicense,
'* and/or sell copies of the Software, and to permit persons to whom the
'* Software is furnished to do so, subject to the following conditions:
'*
'* The above copyright notice and this permission notice shall be included
'* in all copies or substantial portions of the Software.
'*
'* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
'* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
'* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
'* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
'* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
'* DEALINGS IN THE SOFTWARE.
'*****************************************************************************/

Option Infer On

Imports System
Imports System.IO
Imports System.Reflection
Imports Gdal = OSGeo.GDAL.Gdal
Imports Ogr = OSGeo.OGR.Ogr

Namespace $rootnamespace$
    ''' <summary>
    ''' Configuration class for GDAL/OGR
    ''' </summary>
    Public Partial Shared Class GdalConfiguration
        Private Shared _configuredOgr As Boolean
        Private Shared _configuredGdal As Boolean


        /// <summary>
        /// Construction of Gdal/Ogr
        /// </summary>
        Private Shared Sub New()
            Dim executingAssemblyFile As String = New Uri(Assembly.GetExecutingAssembly().GetName().CodeBase).LocalPath
            Dim executingDirectory As String = Path.GetDirectoryName(executingAssemblyFile)
            If String.IsNullOrEmpty(executingDirectory) Then Throw New InvalidOperationException("cannot get executing directory")
            Dim gdalPath As String = Path.Combine(executingDirectory, "gdal")
            Dim path, nativePath As String

            If IsWindows Then
                nativePath = Path.Combine(gdalPath, GetPlatform())
                path = Environment.GetEnvironmentVariable("PATH")
                path = nativePath & ";" & Path.Combine(nativePath, "plugins") & ";" & path
            Else
                nativePath = gdalPath
                path = Environment.GetEnvironmentVariable("LD_LIBRARY_PATH")
                path = nativePath & ":" & Path.Combine(nativePath, "plugins") & ":" & path
            End If

            ' Prepend native path to environment path, to ensure the
            ' right libs are being used.
            Environment.SetEnvironmentVariable("PATH", path)

            ' Set environment variables
            If IsWindows Then
                Dim gdalData As String = Path.Combine(gdalPath, "data")
                Environment.SetEnvironmentVariable("GDAL_DATA", gdalData)
                Gdal.SetConfigOption("GDAL_DATA", gdalData)
                Dim driverPath As String = Path.Combine(nativePath, "plugins")
                Environment.SetEnvironmentVariable("GDAL_DRIVER_PATH", driverPath)
                Gdal.SetConfigOption("GDAL_DRIVER_PATH", driverPath)
                Environment.SetEnvironmentVariable("GEOTIFF_CSV", gdalData)
                Gdal.SetConfigOption("GEOTIFF_CSV", gdalData)
                Dim projSharePath As String = Path.Combine(gdalPath, "share")
                Environment.SetEnvironmentVariable("PROJ_LIB", projSharePath)
                Gdal.SetConfigOption("PROJ_LIB", projSharePath)
            End If
        End Sub

        ''' <summary>
        ''' Method to ensure the static constructor is being called.
        ''' </summary>
        ''' <remarks>Be sure to call this function before using Gdal/Ogr/Osr</remarks>
        Sub ConfigureOgr()
            If _configuredOgr Then Return
            Ogr.RegisterAll()
            _configuredOgr = True
            PrintDriversOgr()
        End Sub

        ''' <summary>
        ''' Method to ensure the static constructor is being called.
        ''' </summary>
        ''' <remarks>Be sure to call this function before using Gdal/Ogr/Osr</remarks>
        Sub ConfigureGdal()
            If _configuredGdal Then Return
            Gdal.AllRegister()
            _configuredGdal = True
            PrintDriversGdal()
        End Sub

        ''' <summary>
        ''' Function to determine which platform we're on
        ''' </summary>
        Private Function GetPlatform() As String
            If IsWindows Then Return If(IntPtr.Size = 4, "x86", "x64")
            Return If(IntPtr.Size = 4, "i386", "x86_x64")
        End Function

        ''' <summary>
        ''' Gets a value indicating if we are on a windows platform
        ''' </summary>
        Private Shared ReadOnly Property IsWindows As Boolean
            Get
                Return Not (Environment.OSVersion.Platform = PlatformID.Unix OrElse Environment.OSVersion.Platform = PlatformID.MacOSX)
            End Get
        End Property

        Private Shared Sub PrintDriversOgr()
#If DEBUG Then
            Dim num = Ogr.GetDriverCount()
            For i As var = 0 To num - 1
                Dim driver = Ogr.GetDriver(i)
                Console.WriteLine(String.Format("OGR {0}: {1}", i, driver.Name))
            Next
#End If
        End Sub

        Private Shared Sub PrintDriversGdal()
#If DEBUG Then
            Dim num = Gdal.GetDriverCount()
            For i As var = 0 To num - 1
                Dim driver = Gdal.GetDriver(i)
                Console.WriteLine(String.Format("GDAL {0}: {1}-{2}", i, driver.ShortName, driver.LongName))
            Next
#End If
        End Sub
    End Class
End Namespace