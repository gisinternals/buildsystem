# predefined constant values

!IF EXIST(config.opt)
!INCLUDE config.opt 
!ENDIF

!IFDEF CONFIG_OPT
!INCLUDE $(CONFIG_OPT)
!ENDIF

!IFNDEF WIN64
!IF [cl 2>&1|find "x64" >NUL ] == 0
WIN64=YES
!ENDIF
!ENDIF

# identify compiler version
!IFNDEF MSVC_VER
!IF "$(_NMAKE_VER)" == "6.00.8168.0"
MSVC_VER = 1200
CMAKE_GENERATOR = "Visual Studio 6"
CMAKE_BUILDDIR = vc6
!ELSEIF "$(_NMAKE_VER)" == "7.00.9466"
MSVC_VER = 1300
CMAKE_GENERATOR = "Visual Studio 7"
CMAKE_BUILDDIR = vc7
!ELSEIF "$(_NMAKE_VER)" == "7.10.3077"
MSVC_VER = 1310
CMAKE_GENERATOR = "Visual Studio 7 .NET 2003"
CMAKE_BUILDDIR = vc71
!ELSEIF "$(_NMAKE_VER)" == "8.00.50727.42"
MSVC_VER = 1400
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 8 2005 Win64"
CMAKE_BUILDDIR = vc8x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 8 2005"
CMAKE_BUILDDIR = vc8
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "8.00.50727.762"
MSVC_VER = 1400
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 8 2005 Win64"
CMAKE_BUILDDIR = vc8x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 8 2005"
CMAKE_BUILDDIR = vc8
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "9.00.21022.08"
MSVC_VER = 1500
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 9 2008 Win64"
CMAKE_BUILDDIR = vc9x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 9 2008"
CMAKE_BUILDDIR = vc9
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "9.00.30729.01"
MSVC_VER = 1500
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 9 2008 Win64"
CMAKE_BUILDDIR = vc9x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 9 2008"
CMAKE_BUILDDIR = vc9
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "10.00.30128.01"
MSVC_VER = 1600
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 10 Win64"
CMAKE_BUILDDIR = vc10x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 10"
CMAKE_BUILDDIR = vc10
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "10.00.30319.01"
MSVC_VER = 1600
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 10 Win64"
CMAKE_BUILDDIR = vc10x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 10"
CMAKE_BUILDDIR = vc10
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "11.00.50727.1"
MSVC_VER = 1700
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 11 Win64"
CMAKE_BUILDDIR = vc11x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 11"
CMAKE_BUILDDIR = vc11
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "11.00.61030.0"
MSVC_VER = 1700
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 11 Win64"
CMAKE_BUILDDIR = vc11x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 11"
CMAKE_BUILDDIR = vc11
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "12.00.21005.1"
MSVC_VER = 1800
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 12 Win64"
CMAKE_BUILDDIR = vc12x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 12"
CMAKE_BUILDDIR = vc12
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.00.23026.0"
MSVC_VER = 1900
MESON_BACKEND = vs2015
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 14 Win64"
CMAKE_BUILDDIR = vc14x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 14"
CMAKE_BUILDDIR = vc14
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.00.23506.0"
MSVC_VER = 1900
MESON_BACKEND = vs2015
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 14 Win64"
CMAKE_BUILDDIR = vc14x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 14"
CMAKE_BUILDDIR = vc14
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.00.24210.0"
MSVC_VER = 1900
MESON_BACKEND = vs2015
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 14 Win64"
CMAKE_BUILDDIR = vc14x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 14"
CMAKE_BUILDDIR = vc14
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.11.25507.1"
MSVC_VER = 1911
MESON_BACKEND = vs2017
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 15 Win64"
CMAKE_BUILDDIR = vc15x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15"
CMAKE_BUILDDIR = vc15
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.10.25019.0"
MSVC_VER = 1911
MESON_BACKEND = vs2017
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 15 2017 Win64"
CMAKE_BUILDDIR = vc15x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15 2017"
CMAKE_BUILDDIR = vc15
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.15.26726.0"
MSVC_VER = 1911
MESON_BACKEND = vs2017
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 15 2017 Win64"
CMAKE_BUILDDIR = vc15x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15 2017"
CMAKE_BUILDDIR = vc15
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.16.27034.0"
MSVC_VER = 1911
MESON_BACKEND = vs2017
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 15 2017 Win64"
CMAKE_BUILDDIR = vc15x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15 2017"
CMAKE_BUILDDIR = vc15
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.22.27905.0"
MSVC_VER = 1922
MESON_BACKEND = vs2019
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 16 2019" -A x64
CMAKE_BUILDDIR = vc16x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 16 2019" -A Win32
CMAKE_BUILDDIR = vc16
!ENDIF
!ELSE
!ERROR This compiler version $(_NMAKE_VER) is not supported or must be enumerated in the makefile
!ENDIF
!ENDIF

!IFNDEF SERVER_URL
SERVER_URL=http://www.gisinternals.com/sdk
!ENDIF

!IFNDEF SWIG_DIR
SWIG_VER = swigwin-1.3.39
SWIG_SRC = https://sourceforge.net/projects/swig/files/swigwin/swigwin-1.3.39/$(SWIG_VER).zip/download
SWIG_DIR = $(SRC_DIR)\swig
SWIG_EXE = $(BASE_DIR)\$(SWIG_DIR)\$(SWIG_VER)\swig.exe
!ENDIF

!IFNDEF CYGWIN_DIR
CYGWIN_DIR=E:\cygwin
!ENDIF

#specify build targets
MSVCR_DLL = $(OUTPUT_DIR)\build\msvcr.install
SWIG_INSTALL = $(OUTPUT_DIR)\build\$(SWIG_VER).install
ZLIB_LIB = $(OUTPUT_DIR)\lib\zlib.lib
OPENSSL_LIB = $(OUTPUT_DIR)\lib\libssl.lib
CURL_LIB = $(OUTPUT_DIR)\lib\libcurl_imp.lib
CURL_EXE = $(OUTPUT_DIR)\bin\curl.exe
CURL_CA_BUNDLE = $(OUTPUT_DIR)\bin\curl-ca-bundle.crt
LIBPNG_LIB = $(OUTPUT_DIR)\lib\libpng16.lib
JPEG_LIB = $(OUTPUT_DIR)\lib\libjpeg.lib
FREETYPE_LIB = $(OUTPUT_DIR)\lib\freetype.lib
HARFBUZZ_LIB = $(OUTPUT_DIR)\lib\harfbuzz.lib
FREETYPE_1 = $(OUTPUT_DIR)\build\freetype_1.install
FREETYPE_2 = $(OUTPUT_DIR)\build\freetype_2.install
GEOS_LIB = $(OUTPUT_DIR)\lib\geos_c.lib
FRIBIDI_LIB = $(OUTPUT_DIR)\lib\fribidi.lib
LIBICONV_LIB = $(OUTPUT_DIR)\lib\iconv.lib
PGSQL_LIB = $(OUTPUT_DIR)\lib\libpq.lib
PROJ4_LIB = $(OUTPUT_DIR)\lib\proj_4_9.lib
PROJ6_LIB = $(OUTPUT_DIR)\lib\proj_6_2.lib
SQLITE_LIB = $(OUTPUT_DIR)\lib\sqlite3.lib
SPATIALITE_LIB = $(OUTPUT_DIR)\lib\spatialite.lib
FREEXL_LIB = $(OUTPUT_DIR)\lib\freexl.lib
LIBXML2_LIB = $(OUTPUT_DIR)\lib\libxml2.lib
XERCES_LIB = $(OUTPUT_DIR)\lib\xerces-c_3D.lib
LIBEXPAT_LIB = $(OUTPUT_DIR)\lib\expat.lib
PROTOBUF_LIB = $(OUTPUT_DIR)\lib\libprotobuf.lib
PROTOBUF_C_LIB = $(OUTPUT_DIR)\lib\protobuf-c.lib
GDAL_LIB = $(OUTPUT_DIR)\lib\gdal_i.lib
GDAL_OPT = $(OUTPUT_DIR)\build\gdal.opt
GDAL_CSHARP_OPT = $(OUTPUT_DIR)\build\gdal_csharp.opt
GDAL_CSHARP_DLL = $(OUTPUT_DIR)\bin\gdal\csharp\gdal_csharp.dll
MAPSERVER_LIB = $(OUTPUT_DIR)\lib\mapserver.lib
SZIP_LIB = $(OUTPUT_DIR)\lib\szip.lib
HDF4_LIB = $(OUTPUT_DIR)\lib\hdf4.lib

# set up gdal configuration
GDAL_DEPS = $(GDAL_OPT) $(MSVCRT_DLL)

!IFDEF GDAL_GEOS
GDAL_DEPS = $(GDAL_DEPS) $(GEOS_LIB)
!ENDIF

!IFDEF GDAL_POSTGIS
GDAL_DEPS = $(GDAL_DEPS) $(PGSQL_LIB)
!ENDIF

!IFDEF GDAL_PROJ4
GDAL_DEPS = $(GDAL_DEPS) $(PROJ4_LIB)
!ENDIF

!IFDEF GDAL_PROJ6
GDAL_DEPS = $(GDAL_DEPS) $(PROJ6_LIB)
!ENDIF

!IFDEF GDAL_CURL
GDAL_DEPS = $(GDAL_DEPS) $(CURL_LIB)
!ENDIF

!IFDEF GDAL_SPATIALITE
GDAL_DEPS = $(GDAL_DEPS) $(SPATIALITE_LIB)
!ENDIF

!IFDEF GDAL_CSHARP
GDAL_DEPS = $(GDAL_DEPS) $(SWIG_INSTALL)
!ENDIF

!IFDEF GDAL_XERCES
GDAL_DEPS = $(GDAL_DEPS) $(XERCES_LIB)
!ENDIF

!IFDEF GDAL_EXPAT
GDAL_DEPS = $(GDAL_DEPS) $(LIBEXPAT_LIB)
!ENDIF

!IFDEF GDAL_MYSQL
GDAL_DEPS = $(GDAL_DEPS) $(MYSQL_LIB)
!ENDIF

!IFDEF GDAL_OPENJPEG
GDAL_DEPS = $(GDAL_DEPS) $(OPENJPEG_LIB)
!ENDIF

!IFDEF GDAL_PDF
GDAL_DEPS = $(GDAL_DEPS) $(POPPLER_LIB)
!ENDIF


# set up mapserver configuration
MAPSERVER_OPT = -DWITH_THREAD_SAFETY=1 -DREGEX_DIR=$(REGEX_PATH:\=/) -DCMAKE_SYSTEM_VERSION=8.1 -DMS_EXTERNAL_LIBS=$(HARFBUZZ_LIB)
MAPSERVER_DEPS = $(MSVCRT_DLL) $(JPEG_LIB) $(LIBPNG_LIB) $(FREETYPE_2)

!IFNDEF MS_POSTGIS
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_POSTGIS=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(PGSQL_LIB)
!ENDIF

!IFNDEF MS_PROTOBUFC
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_PROTOBUFC=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(PROTOBUF_C_LIB)
!ENDIF

!IFNDEF MS_PROJ
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_PROJ=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(PROJ4_LIB)
!ENDIF

!IFNDEF MS_GDAL
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_GDAL=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(GDAL_LIB)
!ENDIF

!IFNDEF MS_GEOS
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_GEOS=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(PROJ4_LIB)
!ENDIF

!IFNDEF MS_ICONV
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_ICONV=0
!ELSE
MAPSERVER_OPT = $(MAPSERVER_OPT) "-DICONV_DLL=$(OUTPUT_DIR:\=/)/bin/iconv.dll"
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(LIBICONV_LIB)
!ENDIF

!IFNDEF MS_CAIRO
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_CAIRO=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(CAIRO_LIB)
!ENDIF

!IFNDEF MS_CURL
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_CURL=0
!ELSE
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_CURL=1 -DWITH_CLIENT_WMS=1 -DWITH_CLIENT_WFS=1
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(CURL_LIB)
!ENDIF

!IFNDEF MS_FCGI
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_FCGI=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(FCGI_LIB)
!ENDIF

!IFNDEF MS_GIFLIB
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_GIF=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(GIF_LIB)
!ENDIF

!IFNDEF MS_LIBXML2
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_LIBXML2=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(LIBXML2_LIB)
!ENDIF

!IFNDEF MS_HARFBUZZ
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_HARFBUZZ=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(HARFBUZZ_LIB)
!ENDIF

!IFNDEF MS_FRIBIDI
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_FRIBIDI=0
!ELSE
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(FRIBIDI_LIB)
!ENDIF

!IFDEF MS_CSHARP
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_CSHARP=1 "-DSWIG_EXECUTABLE=$(SWIG_EXE)"
MAPSERVER_DEPS = $(MAPSERVER_DEPS) $(SWIG_INSTALL)
!ENDIF

!IFDEF MS_MSSQL
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_MSSQL2008=1
!ENDIF

MS_EXTRAFLAGS_CC = -D_WIN32_WINNT=0x0601

# Update enabled flags
MSVCR_ENABLED = 1

!IF !EXIST("$(ZLIB_LIB)")
ZLIB_ENABLED = 1
!ENDIF

!IF !EXIST("$(OPENSSL_LIB)")
OPENSSL_ENABLED = 1
!ENDIF

!IF !EXIST("$(CURL_LIB)")
CURL_ENABLED = 1
!ENDIF

!IF !EXIST("$(LIBPNG_LIB)")
LIBPNG_ENABLED = 1
!ENDIF

!IF !EXIST("$(JPEG_LIB)")
JPEG_ENABLED = 1
!ENDIF

!IF !EXIST("$(HARFBUZZ_LIB)")
FREETYPE_ENABLED = 1
!ENDIF

!IF !EXIST("$(HARFBUZZ_LIB)")
HARFBUZZ_ENABLED = 1
!ENDIF

!IF !EXIST("$(GEOS_LIB)")
GEOS_ENABLED = 1
!ENDIF

!IF !EXIST("$(FRIBIDI_LIB)")
FRIBIDI_ENABLED = 1
!ENDIF

!IF !EXIST("$(LIBICONV_LIB)")
LIBICONV_ENABLED = 1
!ENDIF

!IF !EXIST("$(PGSQL_LIB)")
PGSQL_ENABLED = 1
!ENDIF

!IF !EXIST("$(PROJ6_LIB)")
PROJ4_ENABLED = 1
!ENDIF

!IF !EXIST("$(PROJ6_LIB)")
PROJ6_ENABLED = 1
!ENDIF

!IF !EXIST("$(SQLITE_LIB)")
SQLITE_ENABLED = 1
!ENDIF

!IF !EXIST("$(SPATIALITE_LIB)")
SPATIALITE_ENABLED = 1
!ENDIF

!IF !EXIST("$(FREEXL_LIB)")
FREEXL_ENABLED = 1
!ENDIF

!IF !EXIST("$(LIBXML2_LIB)")
LIBXML2_ENABLED = 1
!ENDIF

!IF !EXIST("$(GDAL_LIB)")
GDAL_ENABLED = 1
!ENDIF

!IF !EXIST("$(GDAL_CSHARP_DLL)")
GDAL_CSHARP_ENABLED = 1
!ENDIF

!IF !EXIST("$(MAPSERVER_LIB)")
MAPSERVER_ENABLED = 1
!ENDIF

!IF !EXIST("$(LIBEXPAT_LIB)")
XERCES_ENABLED = 1
!ENDIF

!IF !EXIST("$(LIBEXPAT_LIB)")
LIBEXPAT_ENABLED = 1
!ENDIF

!IF !EXIST("$(PROTOBUF_LIB)")
PROTOBUF_ENABLED = 1
!ENDIF

!IF !EXIST("$(PROTOBUF_C_LIB)")
PROTOBUF_C_ENABLED = 1
!ENDIF

!IF !EXIST("$(SZIP_LIB)")
SZIP_ENABLED = 1
!ENDIF

!IF !EXIST("$(HDF4_LIB)")
HDF4_ENABLED = 1
!ENDIF


!IFDEF DEBUG
BUILD_CONFIG=RelWithDebInfo
MAPSERVER_OPT = $(MAPSERVER_OPT) "-DCMAKE_CXX_FLAGS_RELEASE=/MD /Oi /Ob2 /D NDEBUG $(MS_EXTRAFLAGS_CC)" "-DCMAKE_C_FLAGS_RELEASE=/MD /Oi /Ob2 /D NDEBUG -D $(MS_EXTRAFLAGS_CC)"
!ELSE
BUILD_CONFIG=Release
!IFDEF MS_RELEASE_PDB
MAPSERVER_OPT = $(MAPSERVER_OPT) "-DCMAKE_CXX_FLAGS_RELEASE=/MD /Zi /O2 $(MS_EXTRAFLAGS_CC)" "-DCMAKE_C_FLAGS_RELEASE=/MD /Zi /O2 $(MS_EXTRAFLAGS_CC)" "-DCMAKE_MODULE_LINKER_FLAGS_RELEASE=/OPT:REF /OPT:ICF /DEBUG /INCREMENTAL:NO" "-DCMAKE_SHARED_LINKER_FLAGS_RELEASE=/OPT:REF /OPT:ICF /DEBUG /INCREMENTAL:NO" "-DCMAKE_EXE_LINKER_FLAGS_RELEASE=/OPT:REF /OPT:ICF /DEBUG /INCREMENTAL:NO"
!ELSE
MAPSERVER_OPT = $(MAPSERVER_OPT) "-DCMAKE_CXX_FLAGS_RELWITHDEBINFO=/MD /Zi /Od" "-DCMAKE_C_FLAGS_RELWITHDEBINFO=/MD /Zi /Od $(MS_EXTRAFLAGS_CC)"
!ENDIF
!ENDIF

!IFDEF WIN64
MS_PROJECT_CONFIG = "$(BUILD_CONFIG)|x64"
!ELSE
MS_PROJECT_CONFIG = "$(BUILD_CONFIG)|Win32"
!ENDIF

# directory layout

!IFNDEF BASE_DIR
BASE_DIR = $(MAKEDIR)
!ENDIF

!IFNDEF CMAKE_DIR
CMAKE_DIR = $(BASE_DIR)\cmake
!ENDIF

!IFNDEF NINJA_DIR
NINJA_DIR = $(BASE_DIR)\ninja
!ENDIF

!IFNDEF JAVA_HOME
!IFDEF WIN64
JAVA_HOME = C:\Java\jdk1.8.0_191x64
!ELSE
JAVA_HOME = C:\Java\jdk1.8.0_191
!ENDIF
!ENDIF

!IFNDEF ANT_HOME
ANT_HOME = C:\Programs\apache-ant-1.7.0
!ENDIF

!IFNDEF WIX_DIR
WIX_DIR = wix
!ENDIF

!IFNDEF PHPSDK_DIR
PHPSDK_DIR = E:\php-sdk
!ENDIF

!IFNDEF GDAL_PATH
GDAL_PATH = $(BASE_DIR)\$(GDAL_DIR)
!ENDIF

!IFNDEF SQLNCLI_VERSION
SQLNCLI_VERSION = 11
!ENDIF

!IFNDEF SQLNCLI_DIR
SQLNCLI_DIR = C:\Program Files (x86)\Microsoft SQL Server\$(SQLNCLI_VERSION)0\SDK
!ENDIF

!IFNDEF MSODBCSQL_VERSION
MSODBCSQL_VERSION = 17
!ENDIF

!IFNDEF MSODBCSQL_DIR
MSODBCSQL_DIR = C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\$(MSODBCSQL_VERSION)0\SDK
!ENDIF

!IFNDEF REGEX_DIR
REGEX_DIR = support\regex-0.12
!ENDIF

!IFNDEF REGEX_PATH
REGEX_PATH=$(BASE_DIR)\$(REGEX_DIR)
!ENDIF

!IFNDEF MS_PATH
MS_PATH = $(BASE_DIR)\$(MS_DIR)
!ENDIF

!IFNDEF PYDIR
PYDIR = $(BASE_DIR)\$(PYTHON_DIR)
!ENDIF

# dependent constants

!IFDEF WIN64
COMPILER_VER=$(MSVC_VER)-x64
!ELSE
COMPILER_VER=$(MSVC_VER)
!ENDIF

!IFNDEF OUTPUT_DIR
OUTPUT_DIR = $(BASE_DIR)\release-$(COMPILER_VER)
!ENDIF

EXTRAFLAGS =

default: $(MAPSERVER_LIB)

test: $(LIBICONV_LIB)

test2: $(HDF4_LIB)

op-disable:
    echo This operation is disabled!

$(OUTPUT_DIR):
    if not exist $(OUTPUT_DIR) mkdir $(OUTPUT_DIR)
    if not exist $(OUTPUT_DIR)\include mkdir $(OUTPUT_DIR)\include
    if not exist $(OUTPUT_DIR)\bin mkdir $(OUTPUT_DIR)\bin
    if not exist $(OUTPUT_DIR)\lib mkdir $(OUTPUT_DIR)\lib
    if not exist $(OUTPUT_DIR)\doc mkdir $(OUTPUT_DIR)\doc
    if not exist $(OUTPUT_DIR)\install mkdir $(OUTPUT_DIR)\install
    if not exist $(OUTPUT_DIR)\build mkdir $(OUTPUT_DIR)\build

$(MSVCR_DLL): $(OUTPUT_DIR)
!IF $(MSVC_VER) >= 1922
!IFDEF WIN64
    xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC142.CRT\vcruntime140.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC142.CRT\msvcp140.dll" $(OUTPUT_DIR)\bin
    if exist "%VCToolsRedistDir%x64\Microsoft.VC142.CRT\concrt140.dll" xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC142.CRT\concrt140.dll" $(OUTPUT_DIR)\bin
    echo msvcr140-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCToolsRedistDir%x86\Microsoft.VC142.CRT\vcruntime140.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCToolsRedistDir%x86\Microsoft.VC142.CRT\msvcp140.dll" $(OUTPUT_DIR)\bin
    if exist "%VCToolsRedistDir%x86\Microsoft.VC142.CRT\concrt140.dll" xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC142.CRT\concrt140.dll" $(OUTPUT_DIR)\bin
    echo msvcr140-x86 > $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) >= 1911
!IFDEF WIN64
    xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC141.CRT\vcruntime140.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC141.CRT\msvcp140.dll" $(OUTPUT_DIR)\bin
    if exist "%VCToolsRedistDir%x64\Microsoft.VC141.CRT\concrt140.dll" xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC141.CRT\concrt140.dll" $(OUTPUT_DIR)\bin
    echo msvcr140-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCToolsRedistDir%x86\Microsoft.VC141.CRT\vcruntime140.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCToolsRedistDir%x86\Microsoft.VC141.CRT\msvcp140.dll" $(OUTPUT_DIR)\bin
    if exist "%VCToolsRedistDir%x86\Microsoft.VC141.CRT\concrt140.dll" xcopy /Y "%VCToolsRedistDir%x64\Microsoft.VC141.CRT\concrt140.dll" $(OUTPUT_DIR)\bin
    echo msvcr140-x86 > $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) == 1900
!IFDEF WIN64
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC140.CRT\vcruntime140.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC140.CRT\msvcp140.dll" $(OUTPUT_DIR)\bin
    echo msvcr140-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC140.CRT\vcruntime140.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC140.CRT\msvcp140.dll" $(OUTPUT_DIR)\bin
    echo msvcr140-x86 > $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) == 1800
!IFDEF WIN64
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC120.CRT\msvcr120.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC120.CRT\msvcp120.dll" $(OUTPUT_DIR)\bin
    echo msvcr120-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC120.CRT\msvcr120.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC120.CRT\msvcp120.dll" $(OUTPUT_DIR)\bin
    echo msvcr120-x86> $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) == 1700
!IFDEF WIN64
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC110.CRT\msvcr110.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC110.CRT\msvcp110.dll" $(OUTPUT_DIR)\bin
    echo msvcr110-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC110.CRT\msvcr110.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC110.CRT\msvcp110.dll" $(OUTPUT_DIR)\bin
    echo msvcr110-x86 > $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) == 1600
!IFDEF WIN64
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC100.CRT\msvcr100.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x64\Microsoft.VC100.CRT\msvcp100.dll" $(OUTPUT_DIR)\bin
    echo msvcr100-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC100.CRT\msvcr100.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%redist\x86\Microsoft.VC100.CRT\msvcp100.dll" $(OUTPUT_DIR)\bin
    echo msvcr100-x86 > $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) == 1500
!IFDEF WIN64
    xcopy /Y "%VCInstallDir%\redist\amd64\Microsoft.VC90.CRT\msvcr90.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%\redist\amd64\Microsoft.VC90.CRT\msvcp90.dll" $(OUTPUT_DIR)\bin
    echo msvcr90-x64 > $(MSVCR_DLL)
!ELSE
    xcopy /Y "%VCInstallDir%\redist\x86\Microsoft.VC90.CRT\msvcr90.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "%VCInstallDir%\redist\x86\Microsoft.VC90.CRT\msvcp90.dll" $(OUTPUT_DIR)\bin
    echo msvcr90-x86 > $(MSVCR_DLL)
!ENDIF
!ELSEIF $(MSVC_VER) == 1310
    xcopy /Y "C:\Program Files (x86)\Microsoft Visual Studio .NET 2003\SDK\v1.1\Bin\msvcr71.dll" $(OUTPUT_DIR)\bin
    xcopy /Y "C:\Program Files (x86)\Microsoft Visual Studio .NET 2003\SDK\v1.1\Bin\msvcp71.dll" $(OUTPUT_DIR)\bin
    echo msvcr71 > $(MSVCR_DLL)
!ENDIF
    
$(ZLIB_LIB): $(MSVCR_DLL)
!IFDEF ZLIB_ENABLED
    if not exist $(ZLIB_DIR) git clone -b $(ZLIB_BRANCH) $(ZLIB_SRC) $(ZLIB_DIR)
    cd $(BASE_DIR)\$(ZLIB_DIR)
    git reset --hard HEAD
    git checkout $(ZLIB_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(ZLIB_DIR)\$(CMAKE_BUILDDIR)\install"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    xcopy /Y install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
    cd $(BASE_DIR)
!ELSE
    @echo $(ZLIB_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF
    
$(OPENSSL_LIB): $(MSVCRT_DLL) $(ZLIB_LIB)
!IFDEF OPENSSL_ENABLED
    if not exist $(OPENSSL_DIR) git clone -b $(OPENSSL_BRANCH) $(OPENSSL_SRC) $(OPENSSL_DIR)
    cd $(BASE_DIR)\$(OPENSSL_DIR)
    git reset --hard HEAD
    git checkout $(OPENSSL_BRANCH)
!IFDEF WIN64
    perl Configure VC-WIN64A no-asm enable-zlib --with-zlib-lib=$(OUTPUT_DIR)\lib\zlib.lib -I$(OUTPUT_DIR)\include
!ELSE
    perl Configure VC-WIN32 no-asm enable-zlib --with-zlib-lib=$(OUTPUT_DIR)\lib\zlib.lib -I$(OUTPUT_DIR)\include
!ENDIF
!IFNDEF NO_CLEAN
	nmake clean
!ENDIF
!IFNDEF NO_BUILD
    nmake
!ENDIF
    if not exist $(OUTPUT_DIR)\include\openssl mkdir $(OUTPUT_DIR)\include\openssl
	xcopy /Y include\openssl\*.h $(OUTPUT_DIR)\include\openssl
    xcopy /Y *.dll $(OUTPUT_DIR)\bin
    xcopy /Y *.lib $(OUTPUT_DIR)\lib
    xcopy /Y apps\openssl.exe $(OUTPUT_DIR)\bin
    cd $(BASE_DIR)
!ELSE
    @echo $(OPENSSL_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF
        
$(CURL_LIB): $(OPENSSL_LIB) $(MSVCRT_DLL) $(ZLIB_LIB) 
!IFDEF CURL_ENABLED
    if not exist $(CURL_DIR) git clone -b $(CURL_BRANCH) $(CURL_SRC) $(CURL_DIR)
    cd $(BASE_DIR)\$(CURL_DIR)
    git reset --hard HEAD
    git checkout $(CURL_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
	if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(CURL_DIR)\$(CMAKE_BUILDDIR)\install" -DZLIB_LIBRARY=$(OUTPUT_DIR)\lib\zlib.lib -DZLIB_INCLUDE_DIR=$(OUTPUT_DIR)\include -DCMAKE_USE_OPENSSL=ON -DCMAKE_USE_LIBSSH2=OFF -DHAVE_INET_PTON=OFF -DCURL_DISABLE_LDAPS=OFF
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    xcopy /Y install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
    xcopy /Y install\bin\*.exe $(OUTPUT_DIR)\bin
    cd $(BASE_DIR)
!ELSE
    @echo $(CURL_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(CURL_EXE): $(CURL_LIB)

$(CURL_CA_BUNDLE): $(CURL_EXE)
!IFDEF CURL_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    $(CURL_EXE) -o "$(CURL_CA_BUNDLE)" "http://curl.haxx.se/ca/cacert.pem"
!ENDIF
    
$(LIBPNG_LIB): $(CURL_EXE) $(CURL_CA_BUNDLE) $(MSVCRT_DLL) $(ZLIB_LIB)
!IFDEF LIBPNG_ENABLED
    if not exist $(LIBPNG_DIR) mkdir $(LIBPNG_DIR)
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    cd $(LIBPNG_DIR)
    if not exist $(LIBPNG_VER) $(CURL_EXE) -L -k -o "libpng.zip" "$(LIBPNG_SRC)" & 7z x -y libpng.zip
    cd $(LIBPNG_VER)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(LIBPNG_DIR)\$(LIBPNG_VER)\$(CMAKE_BUILDDIR)\install"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    xcopy /Y install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(LIBPNG_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(JPEG_LIB): $(CURL_EXE) $(CURL_CA_BUNDLE) $(MSVCRT_DLL)
!IFDEF JPEG_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(JPEG_DIR) mkdir $(JPEG_DIR)
    cd $(JPEG_DIR)
    if not exist $(JPEG_VER) $(CURL_EXE) -L -k -o "jpeg.zip" "$(JPEG_SRC)" & 7z x -y jpeg.zip  
    xcopy /Y $(BASE_DIR)\support\win32.mak $(BASE_DIR)\$(JPEG_DIR)\$(JPEG_VER)
	cd $(JPEG_VER)
!IFNDEF NO_CLEAN
	nmake /f makefile.vc clean
	del *.manifest
!ENDIF
!IFNDEF NO_BUILD
    if not exist jconfig.h nmake /f makefile.vc  setup-v15
!IF $(MSVC_VER) >= 1400
	nmake /f makefile.vc libjpeg.lib "EXTRAFLAGS=/D_CRT_SECURE_NO_DEPRECATE /D_CRT_NONSTDC_NO_DEPRECATE"
!ELSE
	nmake /f makefile.vc libjpeg.lib
!ENDIF
!ENDIF
    xcopy /Y *.lib $(OUTPUT_DIR)\lib
    xcopy /Y *.h $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(JPEG_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(FREETYPE_1): $(MSVCRT_DLL) $(ZLIB_LIB) $(LIBPNG_LIB)
!IFDEF FREETYPE_ENABLED
    if not exist $(FREETYPE_DIR) git clone -b $(FREETYPE_BRANCH) $(FREETYPE_SRC) $(FREETYPE_DIR)
    cd $(FREETYPE_DIR)
    git reset --hard HEAD
    git checkout $(FREETYPE_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
!ENDIF
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(FREETYPE_DIR)\$(CMAKE_BUILDDIR)\install" "-DZLIB_LIBRARY_RELEASE=$(OUTPUT_DIR)\lib\zlib.lib"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install  
!ENDIF
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
    echo freetype phase 1 > $(FREETYPE_1)
	cd $(BASE_DIR)
!ELSE
    @echo $(FREETYPE_1) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(FREETYPE_2): $(FREETYPE_1) $(HARFBUZZ_LIB) $(MSVCRT_DLL) $(ZLIB_LIB) $(LIBPNG_LIB)
!IFDEF FREETYPE_ENABLED
    cd $(BASE_DIR)\$(FREETYPE_DIR)
    git reset --hard HEAD
    git checkout $(FREETYPE_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
!ENDIF
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(FREETYPE_DIR)\$(CMAKE_BUILDDIR)\install" "-DZLIB_LIBRARY_RELEASE=$(OUTPUT_DIR)\lib\zlib.lib"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install  
!ENDIF
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
    echo freetype phase 2 > $(FREETYPE_2)
	cd $(BASE_DIR)
!ELSE
    @echo $(FREETYPE_2) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(HARFBUZZ_LIB): $(MSVCRT_DLL) $(FREETYPE_1) $(LIBPNG_LIB) $(ZLIB_LIB)
!IFDEF HARFBUZZ_ENABLED
    if not exist $(HARFBUZZ_DIR) git clone -b $(HARFBUZZ_BRANCH) $(HARFBUZZ_SRC) $(HARFBUZZ_DIR)
    cd $(BASE_DIR)\$(HARFBUZZ_DIR)
    git reset --hard HEAD
    git checkout $(HARFBUZZ_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(HARFBUZZ_DIR)\$(CMAKE_BUILDDIR)\install" "-DHB_HAVE_FREETYPE=ON" "-DCMAKE_CXX_STANDARD_LIBRARIES=$(OUTPUT_DIR)\lib\libpng16.lib $(OUTPUT_DIR)\lib\zlib.lib"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(HARFBUZZ_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(GEOS_LIB): $(MSVCRT_DLL)
!IFDEF GEOS_ENABLED
    if not exist $(GEOS_DIR) git clone -b $(GEOS_BRANCH) $(GEOS_SRC) $(GEOS_DIR)
    cd $(BASE_DIR)\$(GEOS_DIR)
    git reset --hard HEAD
    git checkout $(GEOS_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(GEOS_DIR)\$(CMAKE_BUILDDIR)\install" "-DBUILD_SHARED_LIBS=ON"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(GEOS_DIR)\$(CMAKE_BUILDDIR)
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y /S install\include\*.h $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(GEOS_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(LIBEXPAT_LIB):
!IFDEF LIBEXPAT_ENABLED
    if not exist $(LIBEXPAT_DIR) git clone -b $(LIBEXPAT_BRANCH) $(LIBEXPAT_SRC) $(LIBEXPAT_DIR)
    cd $(LIBEXPAT_DIR)
    git reset --hard HEAD
    git checkout $(LIBEXPAT_BRANCH)
    cd expat
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(LIBEXPAT_DIR)\expat\$(CMAKE_BUILDDIR)\install"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(LIBEXPAT_DIR)\expat\$(CMAKE_BUILDDIR)\install
    xcopy /Y lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y /S include\*.h $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(LIBEXPAT_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(XERCES_LIB):
!IFDEF XERCES_ENABLED
    if not exist $(XERCES_DIR) svn co $(XERCES_SRC)/$(XERCES_BRANCH) $(XERCES_DIR)
    cd $(XERCES_DIR)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(XERCES_DIR)\$(CMAKE_BUILDDIR)\install"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(XERCES_DIR)\$(CMAKE_BUILDDIR)
    xcopy /Y install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y /S install\include\* $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(XERCES_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(PROTOBUF_LIB): $(ZLIB_LIB)
!IFDEF PROTOBUF_ENABLED
    if not exist $(PROTOBUF_DIR) git clone -b $(PROTOBUF_BRANCH) $(PROTOBUF_SRC) $(PROTOBUF_DIR)
    cd $(PROTOBUF_DIR)
    git reset --hard HEAD
    git checkout $(PROTOBUF_BRANCH)
    cd cmake
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(PROTOBUF_DIR)\cmake\$(CMAKE_BUILDDIR)\install" "-Dprotobuf_BUILD_TESTS=OFF" 
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(PROTOBUF_DIR)\cmake\$(CMAKE_BUILDDIR)\install
    xcopy /Y lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y bin\*.exe $(OUTPUT_DIR)\bin
    xcopy /Y /S include\* $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(PROTOBUF_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(PROTOBUF_C_LIB): $(PROTOBUF_LIB)
!IFDEF PROTOBUF_C_ENABLED
    if not exist $(PROTOBUF_C_DIR) git clone -b $(PROTOBUF_C_BRANCH) $(PROTOBUF_C_SRC) $(PROTOBUF_C_DIR)
    cd $(PROTOBUF_C_DIR)
    git reset --hard HEAD
    git checkout $(PROTOBUF_C_BRANCH)
    cd build-cmake
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(PROTOBUF_C_DIR)\build-cmake\$(CMAKE_BUILDDIR)\install" "-DMSVC_STATIC_BUILD=ON"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(PROTOBUF_C_DIR)\build-cmake\$(CMAKE_BUILDDIR)\install
    xcopy /Y lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y bin\*.exe $(OUTPUT_DIR)\bin
    xcopy /Y /S include\* $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(PROTOBUF_C_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(FRIBIDI_LIB):
!IFDEF FRIBIDI_ENABLED
    if not exist $(FRIBIDI_DIR) git clone -b $(FRIBIDI_BRANCH) $(FRIBIDI_SRC) $(FRIBIDI_DIR)
    set NINJA = $(NINJA_DIR)
    cd $(FRIBIDI_DIR)
    git reset --hard HEAD
    git checkout $(FRIBIDI_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
    $(PYTHON_DIR)\Scripts\meson --prefix $(BASE_DIR)\$(FRIBIDI_DIR)\$(CMAKE_BUILDDIR)\install --buildtype=release --backend=ninja $(CMAKE_BUILDDIR) -Ddocs=false
    $(NINJA_DIR)\ninja -v -C $(CMAKE_BUILDDIR)
    $(NINJA_DIR)\ninja -C $(CMAKE_BUILDDIR) install
!ENDIF
    xcopy /Y $(BASE_DIR)\$(FRIBIDI_DIR)\$(CMAKE_BUILDDIR)\install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y $(BASE_DIR)\$(FRIBIDI_DIR)\$(CMAKE_BUILDDIR)\install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y /S $(BASE_DIR)\$(FRIBIDI_DIR)\$(CMAKE_BUILDDIR)\install\include\*.h $(OUTPUT_DIR)\include
    cd $(BASE_DIR)
!ELSE
    @echo $(FRIBIDI_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF
    
$(PROJ4_LIB): $(MSVCRT_DLL)
!IFDEF PROJ4_ENABLED
    if not exist $(PROJ4_DIR) git clone -b $(PROJ4_BRANCH) $(PROJ_SRC) $(PROJ4_DIR)
    cd $(PROJ4_DIR)
    git reset --hard HEAD
    git checkout $(PROJ4_BRANCH)
    xcopy /Y $(BASE_DIR)\support\proj4\null $(BASE_DIR)\$(PROJ4_DIR)\nad
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install" -DPROJ_TESTS=OFF -DCMAKE_BUILD_TYPE=$(BUILD_CONFIG) -DBUILD_LIBPROJ_SHARED=ON
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
    rem cd $(BASE_DIR)\$(PROJ4_DIR)\nad
    rem nmake /f makefile.vc install-all INSTDIR=$(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install PROJ_LIB_DIR=$(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install\share
!ENDIF
    if not exist $(OUTPUT_DIR)\bin\proj mkdir $(OUTPUT_DIR)\bin\proj
    if not exist $(OUTPUT_DIR)\bin\proj\apps mkdir $(OUTPUT_DIR)\bin\proj\apps
    xcopy /Y $(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install\local\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y $(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y $(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install\bin\*.exe $(OUTPUT_DIR)\bin\proj\apps
    xcopy /Y $(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install\local\include\*.h $(OUTPUT_DIR)\include
    if not exist $(OUTPUT_DIR)\bin\proj\share mkdir $(OUTPUT_DIR)\bin\proj\share
    xcopy /Y $(BASE_DIR)\$(PROJ4_DIR)\$(CMAKE_BUILDDIR)\install\share\* $(OUTPUT_DIR)\bin\proj\share
    xcopy /Y $(BASE_DIR)\$(PROJ4_DIR)\nad\ntv1_can.dat $(OUTPUT_DIR)\bin\proj\share
    copy /Y $(PROJ4_LIB) $(OUTPUT_DIR)\lib\proj_i.lib
	cd $(BASE_DIR)
!ELSE
    @echo $(PROJ4_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF
    
$(PROJ6_LIB): $(MSVCRT_DLL) $(SQLITE_LIB)
!IFDEF PROJ6_ENABLED
    if not exist $(PROJ6_DIR) git clone -b $(PROJ6_BRANCH) $(PROJ_SRC) $(PROJ6_DIR)
    cd $(PROJ6_DIR)
    git reset --hard HEAD
    git checkout $(PROJ6_BRANCH)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
    if exist data\proj.db del data\proj.db
    if exist data\all.sql.in del data\all.sql.in
!ENDIF
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(PROJ6_DIR)\$(CMAKE_BUILDDIR)\install" -DPROJ_TESTS=OFF -DCMAKE_BUILD_TYPE=$(BUILD_CONFIG) -DBUILD_LIBPROJ_SHARED=ON
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    if not exist $(OUTPUT_DIR)\bin\proj6 mkdir $(OUTPUT_DIR)\bin\proj6
    if not exist $(OUTPUT_DIR)\bin\proj6\apps mkdir $(OUTPUT_DIR)\bin\proj6\apps
    xcopy /Y $(BASE_DIR)\$(PROJ6_DIR)\$(CMAKE_BUILDDIR)\install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y $(BASE_DIR)\$(PROJ6_DIR)\$(CMAKE_BUILDDIR)\install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y $(BASE_DIR)\$(PROJ6_DIR)\$(CMAKE_BUILDDIR)\install\bin\*.exe $(OUTPUT_DIR)\bin\proj6\apps
    if exist $(OUTPUT_DIR)\include\proj6 rmdir /s /q $(OUTPUT_DIR)\include\proj6
	mkdir $(OUTPUT_DIR)\include\proj6
    xcopy /Y /S $(BASE_DIR)\$(PROJ6_DIR)\$(CMAKE_BUILDDIR)\install\include\*.h $(OUTPUT_DIR)\include\proj6
    if not exist $(OUTPUT_DIR)\bin\proj6\share mkdir $(OUTPUT_DIR)\bin\proj6\share
    xcopy /Y /S $(BASE_DIR)\$(PROJ6_DIR)\$(CMAKE_BUILDDIR)\install\share\proj\* $(OUTPUT_DIR)\bin\proj6\share
	cd $(BASE_DIR)
!ELSE
    @echo $(PROJ6_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(SQLITE_LIB): $(MSVCRT_DLL)
!IFDEF SQLITE_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(SQLITE_DIR) mkdir $(SQLITE_DIR)
    cd $(SQLITE_DIR)
    if not exist sqlite $(CURL_EXE) -L -k -o "sqlite.zip" "$(SQLITE_SRC)" & 7z x -y sqlite.zip  
    cd sqlite
!IFNDEF NO_CLEAN
    nmake /f Makefile.msc clean
!ENDIF
!IFNDEF NO_BUILD
    nmake /f Makefile.msc sqlite3.c
    cl sqlite3.c -DSQLITE_API=__declspec(dllexport) -link -dll -out:sqlite3.dll
    nmake /f Makefile.msc sqlite3.exe
!ENDIF
!IFNDEF NO_COPY
    xcopy /Y *.dll $(OUTPUT_DIR)\bin
    xcopy /Y *.exe $(OUTPUT_DIR)\bin
    xcopy /Y *.lib $(OUTPUT_DIR)\lib
    xcopy /Y sqlite3.h $(OUTPUT_DIR)\include
    copy /Y $(SQLITE_LIB) $(OUTPUT_DIR)\lib\sqlite3_i.lib
!ENDIF
    cd $(BASE_DIR)
!ELSE
    @echo $(SQLITE_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(SWIG_INSTALL): $(CURL_EXE) $(CURL_CA_BUNDLE)
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(SWIG_DIR) mkdir $(SWIG_DIR)
    cd $(SWIG_DIR)
    if not exist $(SWIG_VER) $(CURL_EXE) -L -k -o "$(SWIG_VER).zip" "$(SWIG_SRC)" & 7z x -y $(SWIG_VER).zip
    echo >$(OUTPUT_DIR)\build\$(SWIG_VER).install
    cd $(BASE_DIR)

$(FREEXL_LIB): $(LIBICONV_LIB) $(MSVCRT_DLL)
!IFDEF FREEXL_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(FREEXL_DIR) mkdir $(FREEXL_DIR)
    cd $(FREEXL_DIR)
    if not exist $(FREEXL_VER) $(CURL_EXE) -L -k -o "freexl.zip" "$(FREEXL_SRC)" & 7z x -y freexl.zip
    cd $(FREEXL_VER)
!IFNDEF NO_CLEAN
    nmake /f makefile.vc clean
!ENDIF
!IFNDEF NO_BUILD
	echo INSTDIR=$(BASE_DIR)\$(FREEXL_DIR)\install >nmake.opt
    echo OPTFLAGS=	/nologo /Ox /fp:precise /W3 /MD /D_CRT_SECURE_NO_WARNINGS /DDLL_EXPORT /DYY_NO_UNISTD_H /I$(OUTPUT_DIR)\include >>nmake.opt
    powershell -Command "(gc makefile.vc) -replace 'C:\\OSGeo4w\\lib', '$$(LIBDIR)' | Out-File -encoding ASCII makefile.vc
    cd src
    powershell -Command "(gc freexl.c) -replace 'round \(double num\)', 'round_unused (double num)' | Out-File -encoding ASCII freexl.c"
    cd ..
    nmake /f makefile.vc install "LIBDIR=$(OUTPUT_DIR)\lib"
!ENDIF
    xcopy /Y $(BASE_DIR)\$(FREEXL_DIR)\install\include\*.h $(OUTPUT_DIR)\include
    xcopy /Y $(BASE_DIR)\$(FREEXL_DIR)\install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y $(BASE_DIR)\$(FREEXL_DIR)\install\lib\*.lib $(OUTPUT_DIR)\lib
    cd $(BASE_DIR)
!ELSE
    @echo $(FREEXL_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(SPATIALITE_LIB): $(SQLITE_LIB) $(LIBXML2_LIB) $(PROJ4_LIB) $(LIBICONV_LIB) $(FREEXL_LIB) $(ZLIB_LIB) $(MSVCRT_DLL)
!IFDEF SQLITE_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(SPATIALITE_DIR) mkdir $(SPATIALITE_DIR)
    cd $(SPATIALITE_DIR)
    if not exist $(SPATIALITE_VER) $(CURL_EXE) -L -k -o "spatialite.zip" "$(SPATIALITE_SRC)" & 7z x -y spatialite.zip
    cd $(SPATIALITE_VER)
!IFNDEF NO_CLEAN
    nmake /f makefile.vc clean
!ENDIF
!IFNDEF NO_BUILD
    powershell -Command "(gc config-msvc.h) -replace '#define HAVE_UNISTD_H 1', '/* #undef HAVE_UNISTD_H */' | Out-File -encoding ASCII config-msvc.h"
    powershell -Command "(gc makefile.vc) -replace 'C:\\OSGeo4w\\lib', '$$(LIBDIR)' | Out-File -encoding ASCII makefile.vc
    cd src
    cd gaiageo
    powershell -Command "(gc gg_extras.c) -replace 'rint \(double x\)', 'rint_unused (double x)' | Out-File -encoding ASCII gg_extras.c"
    cd ..
    cd ..
    echo INSTDIR=$(BASE_DIR)\$(SPATIALITE_DIR)\install >nmake.opt
    echo OPTFLAGS=	/nologo /Ox /fp:precise /W3 /MD /D_CRT_SECURE_NO_WARNINGS /DDLL_EXPORT /DYY_NO_UNISTD_H /I$(OUTPUT_DIR)\include >>nmake.opt
    if exist $(BASE_DIR)\$(SPATIALITE_DIR)\install rd /Q /S $(BASE_DIR)\$(SPATIALITE_DIR)\install
    nmake /f makefile.vc install LIBDIR=$(OUTPUT_DIR)\lib
!ENDIF
    xcopy /Y /S $(BASE_DIR)\$(SPATIALITE_DIR)\install\include\*.h $(OUTPUT_DIR)\include
    xcopy /Y $(BASE_DIR)\$(SPATIALITE_DIR)\install\bin\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y $(BASE_DIR)\$(SPATIALITE_DIR)\install\lib\*.lib $(OUTPUT_DIR)\lib
    cd $(BASE_DIR)
!ELSE
    @echo $(SPATIALITE_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(LIBXML2_LIB): $(ZLIB_LIB) $(LIBICONV_LIB) $(MSVCRT_DLL)
!IFDEF LIBXML2_ENABLED
    if not exist $(LIBXML2_DIR) git clone -b $(LIBXML2_BRANCH) $(LIBXML2_SRC) $(LIBXML2_DIR)
    cd $(LIBXML2_DIR)
!IFNDEF NO_CLEAN
    if exist Release rmdir /s /q Release
    mkdir Release
!ENDIF
    cd win32
!IFNDEF NO_CLEAN
    if exist config.msvc nmake /f makefile.msvc clean
!ENDIF
!IFNDEF NO_BUILD
    cscript configure.js compiler=msvc vcmanifest=yes include=$(OUTPUT_DIR)\include lib=$(OUTPUT_DIR)\lib
    nmake /f makefile.msvc
    nmake /f makefile.msvc install PREFIX=$(BASE_DIR)\$(LIBXML2_DIR)\Release
!ENDIF
    cd ..\..
    xcopy /Y $(BASE_DIR)\$(LIBXML2_DIR)\Release\bin\libxml2.dll $(OUTPUT_DIR)\bin
    xcopy /Y $(BASE_DIR)\$(LIBXML2_DIR)\Release\lib\libxml2.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S $(BASE_DIR)\$(LIBXML2_DIR)\Release\include\libxml2\* $(OUTPUT_DIR)\include
    cd $(BASE_DIR)
!ELSE
    @echo $(LIBXML2_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(GDAL_OPT):
!IFDEF GDAL_ENABLED
	echo swig - $(SWIG_VER) > $(OUTPUT_DIR)\doc\gdal_deps.txt
	echo PYDIR=$(PYDIR) >> $(GDAL_OPT)
	echo $(PYTHON_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
	echo GDAL_ROOT=$(GDAL_PATH)\gdal >> $(GDAL_OPT)
!IFDEF GDAL_GEOS
    echo GEOS_DIR=$(BASE_DIR)\$(GEOS_DIR) >> $(GDAL_OPT)
    echo GEOS_CFLAGS=-I$(OUTPUT_DIR)\include -DHAVE_GEOS >> $(GDAL_OPT)
    echo GEOS_LIB=$(GEOS_LIB) >> $(GDAL_OPT)
    echo geos - $(GEOS_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF    
    echo MSVC_VER=$(MSVC_VER) >> $(GDAL_OPT)
!IFDEF WIN64
	echo WIN64=$(WIN64) >> $(GDAL_OPT)
!ENDIF
!IFDEF DEBUG
    echo DEBUG=$(DEBUG) >> $(GDAL_OPT)
    echo OPTFLAGS= /nologo /MP /MD /Zi /Od /EHsc /FC /D_CRT_SECURE_NO_DEPRECATE /D_CRT_NONSTDC_NO_DEPRECATE /DDEBUG  >> $(GDAL_OPT)   
!ENDIF
    rem echo SETARGV=$(SETARGV) >> $(GDAL_OPT)
!IFDEF GDAL_POSTGIS
    echo PG_INC_DIR = $(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo PG_LIB = $(PGSQL_LIB) wsock32.lib >> $(GDAL_OPT)
    echo libpq - $(PGSQL_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_JAVA
    echo JAVA_HOME=$(JAVA_HOME) >> $(GDAL_OPT)
    echo ANT_HOME=$(ANT_HOME) >> $(GDAL_OPT)
!ENDIF
!IFDEF GDAL_CURL
    echo CURL_DIR= $(BASE_DIR)\$(CURL_DIR) >> $(GDAL_OPT)
    echo CURL_INC = -I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo CURL_LIB = $(CURL_LIB) wsock32.lib wldap32.lib winmm.lib >> $(GDAL_OPT)
    echo libcurl - $(CURL_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
    echo openssl - $(OPENSSL_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_SQLITE
    echo SQLITE_INC=-I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo SQLITE_LIB=$(SQLITE_LIB) >> $(GDAL_OPT)
    echo SQLITE_HAS_COLUMN_METADATA=yes >> $(GDAL_OPT)
    echo $(SQLITE_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_SPATIALITE
    echo SQLITE_INC=-I$(OUTPUT_DIR)\include -DHAVE_SPATIALITE -DSPATIALITE_AMALGAMATION >> $(GDAL_OPT)
    echo SQLITE_LIB=$(SQLITE_LIB) $(SPATIALITE_LIB) >> $(GDAL_OPT)
    echo SQLITE_HAS_COLUMN_METADATA=yes >> $(GDAL_OPT)
	echo sqlite - $(SQLITE_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
    echo spatialite - $(SPATIALITE_BRANCH) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_KMLSUPEROVERLAY
!IF EXIST ($(GDAL_PATH)\frmts\kmlsuperoverlay)
    echo KMLSUPEROVERLAY_SUPPORTED = YES >> $(GDAL_OPT)
    echo MINIZIP_INCLUDE = -I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo MINIZIP_LIBRARY = $(OUTPUT_DIR)\lib\minizip.lib >> $(GDAL_OPT)
!ENDIF
!ENDIF
!IFDEF GDAL_MYSQL
    echo MYSQL_INC_DIR=$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo MYSQL_LIB=$(OUTPUT_DIR)\lib\libmysql.lib advapi32.lib >> $(GDAL_OPT)
    echo $(MYSQL_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_XERCES
    echo XERCES_DIR=$(BASE_DIR)\$(XERCES_DIR) >> $(GDAL_OPT)
    echo XERCES_INCLUDE=-I$(OUTPUT_DIR)\include -I$(OUTPUT_DIR)\include\xercesc >> $(GDAL_OPT)
    echo XERCES_LIB=$(OUTPUT_DIR)\lib\xerces-c_3.lib >> $(GDAL_OPT)
    echo $(XERCES_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
    echo ILI_ENABLED = YES >> $(GDAL_OPT)
!ENDIF
!IFDEF GDAL_EXPAT
    echo EXPAT_DIR=$(BASE_DIR)\$(EXPAT_DIR) >> $(GDAL_OPT)
    echo EXPAT_INCLUDE=-I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo EXPAT_LIB=$(OUTPUT_DIR)\lib\expat.lib >> $(GDAL_OPT)
    echo $(EXPAT_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_LIBKML
!IFDEF LIBKML_DIR
    echo LIBKML_DIR=$(BASE_DIR)\$(LIBKML_DIR) >> $(GDAL_OPT)
    echo LIBKML_INCLUDE=-I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo LIBKML_LIBS=$(OUTPUT_DIR)\lib\libkmlbase.lib $(OUTPUT_DIR)\lib\libkmlconvenience.lib $(OUTPUT_DIR)\lib\libkmldom.lib $(OUTPUT_DIR)\lib\libkmlengine.lib $(OUTPUT_DIR)\lib\libkmlregionator.lib $(OUTPUT_DIR)\lib\libkmlxsd.lib $(OUTPUT_DIR)\lib\expat.lib $(OUTPUT_DIR)\lib\zdll.lib >> $(GDAL_OPT)
    echo $(LIBKML_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!ENDIF
!IFDEF GDAL_PDF
    echo POPPLER_ENABLED = YES >> $(GDAL_OPT)
    echo POPPLER_CFLAGS = -I$(OUTPUT_DIR)\include -I$(OUTPUT_DIR)\include\poppler >> $(GDAL_OPT)
    echo POPPLER_HAS_OPTCONTENT = YES >> $(GDAL_OPT)
    echo POPPLER_0_20_OR_LATER = YES >> $(GDAL_OPT)
    echo POPPLER_0_23_OR_LATER = YES >> $(GDAL_OPT)
    echo POPPLER_BASE_STREAM_HAS_TWO_ARGS = YES >> $(GDAL_OPT)
    echo POPPLER_LIBS = $(OUTPUT_DIR)\lib\poppler.lib $(OUTPUT_DIR)\lib\$(FT_LIB) $(OUTPUT_DIR)\lib\harfbuzz.lib advapi32.lib gdi32.lib >> $(GDAL_OPT)
    echo $(POPPLER_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_OPENJPEG
    echo OPENJPEG_ENABLED = YES >> $(GDAL_OPT)
!IFDEF USE_OPENJP2_NEW_METHOD
    echo OPENJPEG_CFLAGS = -I$(OUTPUT_DIR)\include\openjpeg-2.1 >> $(GDAL_OPT)
    echo OPENJPEG_LIB = $(OUTPUT_DIR)\lib\openjp2.lib >> $(GDAL_OPT)
    echo $(OPENJPEG2_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ELSEIFDEF USE_OPENJP2
    echo OPENJPEG_CFLAGS = -I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo OPENJPEG_LIB = $(OUTPUT_DIR)\lib\openjp2.lib >> $(GDAL_OPT)
    echo OPENJPEG_VERSION = 20100 >> $(GDAL_OPT)
    echo $(OPENJPEG2_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ELSE
    echo OPENJPEG_LIB = $(OUTPUT_DIR)\lib\openjpeg.lib >> $(GDAL_OPT)
    echo $(OPENJPEG_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!ENDIF
!IFDEF GDAL_TIFF
    echo TIFF_INC=-I$(OUTPUT_DIR)\include >> $(GDAL_OPT)
    echo TIFF_LIB=$(OUTPUT_DIR)\lib\libtiff_i.lib >> $(GDAL_OPT)
    echo TIFF_OPTS=-DBIGTIFF_SUPPORT
    echo $(JBIG_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
    echo $(LIBTIFF_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
	echo $(LIBGEOTIFF_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF GDAL_AMIGOCLOUD
    echo AMIGOCLOUD_PLUGIN=YES >> $(GDAL_OPT)
!ENDIF
!IFDEF GDAL_GNM
    echo INCLUDE_GNM_FRMTS=YES >> $(GDAL_OPT)
!ENDIF
!IFDEF SZIP_DIR
    echo $(SZIP_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF FITS_DIR
    echo $(FITS_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF HDF5_DIR
    echo $(HDF5_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF HDF5_DIR
    echo $(KEA_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF HDF5_DIR
    echo $(HDF4_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF ECW_DIR
    echo $(ECW_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF MRSID_DIR
    echo $(MRSID_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF OCI_DIR
    echo $(OCI_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF NETCDF_DIR
    echo $(NETCDF_DIR) >> $(OUTPUT_DIR)\doc\gdal_deps.txt
!ENDIF
!IFDEF USE_PROJ6
    echo PROJ_INCLUDE = -I$(OUTPUT_DIR)\include\proj6 >> $(GDAL_OPT)
    echo PROJ_LIBRARY = $(OUTPUT_DIR)\lib\proj_6_1.lib >> $(GDAL_OPT)
!ENDIF
!ENDIF

$(GDAL_LIB): $(GDAL_DEPS)
!IFDEF GDAL_ENABLED
    if not exist $(GDAL_DIR) git clone -b $(GDAL_BRANCH) $(GDAL_SRC) $(GDAL_DIR)
    cd $(GDAL_DIR)
    git reset --hard HEAD
    git checkout $(GDAL_BRANCH)
    cd gdal
!IFNDEF NO_CLEAN
	nmake /f makefile.vc clean EXT_NMAKE_OPT=$(GDAL_OPT)
	-del gdal*.dll
	cd swig
	nmake /f makefile.vc clean EXT_NMAKE_OPT=$(GDAL_OPT)
    cd ..
!ENDIF
!IFNDEF NO_BUILD
	nmake /f makefile.vc EXT_NMAKE_OPT=$(GDAL_OPT)
!ENDIF
	xcopy /Y *.dll $(OUTPUT_DIR)\bin
	xcopy /Y port\*.h $(OUTPUT_DIR)\include
	xcopy /Y gcore\*.h $(OUTPUT_DIR)\include
	xcopy /Y alg\*.h $(OUTPUT_DIR)\include
	xcopy /Y ogr\*.h $(OUTPUT_DIR)\include
	xcopy /Y apps\*.h $(OUTPUT_DIR)\include
	xcopy /Y frmts\mem\memdataset.h $(OUTPUT_DIR)\include
	if exist frmts\raw\rawdataset.h xcopy /Y frmts\raw\rawdataset.h $(OUTPUT_DIR)\include
    if exist gcore\rawdataset.h xcopy /Y gcore\rawdataset.h $(OUTPUT_DIR)\include
	xcopy /Y frmts\gtiff\libgeotiff\*.h $(OUTPUT_DIR)\include
	xcopy /Y frmts\gtiff\libgeotiff\*.inc $(OUTPUT_DIR)\include
	xcopy /Y frmts\vrt\*.h $(OUTPUT_DIR)\include
	xcopy /Y ogr\ogrsf_frmts\*.h $(OUTPUT_DIR)\include
	xcopy /Y gdal_i.lib $(OUTPUT_DIR)\lib
	if not exist $(OUTPUT_DIR)\bin\gdal mkdir $(OUTPUT_DIR)\bin\gdal
	if not exist $(OUTPUT_DIR)\bin\gdal\apps mkdir $(OUTPUT_DIR)\bin\gdal\apps
	xcopy /Y apps\*.exe $(OUTPUT_DIR)\bin\gdal\apps
	if not exist $(OUTPUT_DIR)\bin\gdal-data mkdir $(OUTPUT_DIR)\bin\gdal-data
	xcopy /Y data\*.* $(OUTPUT_DIR)\bin\gdal-data
	if exist $(OUTPUT_DIR)\bin\gdal\plugins del $(OUTPUT_DIR)\bin\gdal\plugins\*.dll
    if exist $(OUTPUT_DIR)\bin\gdal\plugins-optional del $(OUTPUT_DIR)\bin\gdal\plugins-optional\*.dll
	if exist $(OUTPUT_DIR)\bin\gdal\plugins-external del $(OUTPUT_DIR)\bin\gdal\plugins-external\*.dll
	cd $(BASE_DIR)
!ELSE
    @echo $(GDAL_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(GDAL_CSHARP_OPT): $(GDAL_OPT) $(SWIG_INSTALL)
    copy /Y $(GDAL_OPT) $(GDAL_CSHARP_OPT)
    echo SWIG=$(SWIG_EXE) >>$(GDAL_CSHARP_OPT)

$(GDAL_CSHARP_DLL):	$(GDAL_LIB) $(GDAL_CSHARP_OPT)
!IFDEF GDAL_CSHARP_ENABLED
	cd $(GDAL_DIR)\gdal\swig\csharp
!IFNDEF NO_CLEAN
	nmake /f makefile.vc clean EXT_NMAKE_OPT=$(GDAL_CSHARP_OPT)
!ENDIF
!IFNDEF NO_BUILD
!IFDEF DEBUG
	nmake /f makefile.vc interface EXT_NMAKE_OPT=$(GDAL_CSHARP_OPT) DEBUG=1
!ELSE
	nmake /f makefile.vc interface EXT_NMAKE_OPT=$(GDAL_CSHARP_OPT)
!ENDIF	
	nmake /f makefile.vc EXT_NMAKE_OPT=$(GDAL_CSHARP_OPT)
!ENDIF
	if not exist $(OUTPUT_DIR)\bin\gdal\csharp mkdir $(OUTPUT_DIR)\bin\gdal\csharp
	xcopy /Y *.dll $(OUTPUT_DIR)\bin\gdal\csharp
	xcopy /Y *.exe $(OUTPUT_DIR)\bin\gdal\csharp
	cd $(BASE_DIR)
!ELSE
    @echo $(GDAL_CSHARP_DLL) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(MAPSERVER_LIB): $(MAPSERVER_DEPS) 
!IFDEF MAPSERVER_ENABLED
    if not exist $(MAPSERVER_DIR) git clone -b $(MAPSERVER_BRANCH) $(MAPSERVER_SRC) $(MAPSERVER_DIR)
	cd $(MAPSERVER_DIR) 
!IFNDEF NO_CLEAN
    git reset --hard HEAD
    git checkout $(MAPSERVER_BRANCH)
    git pull origin $(MAPSERVER_BRANCH)
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
    if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
!IFNDEF NO_BUILD
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\install" -DCMAKE_BUILD_TYPE=$(BUILD_CONFIG) $(MAPSERVER_OPT)
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    if not exist $(OUTPUT_DIR)\bin\ms mkdir $(OUTPUT_DIR)\bin\ms
	if not exist $(OUTPUT_DIR)\bin\ms\apps mkdir $(OUTPUT_DIR)\bin\ms\apps
	xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\$(BUILD_CONFIG)\*.dll $(OUTPUT_DIR)\bin
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\$(BUILD_CONFIG)\*.exe $(OUTPUT_DIR)\bin\ms\apps
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\install\lib\*.lib $(OUTPUT_DIR)\lib
    xcopy /Y /S $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\install\include\*.h $(OUTPUT_DIR)\include
!IFDEF MS_RELEASE_PDB
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\$(BUILD_CONFIG)\mapserver.pdb $(OUTPUT_DIR)\bin
!ENDIF
!IFDEF MS_MSSQL
    if not exist $(OUTPUT_DIR)\bin\ms\plugins\mssql2008 mkdir $(OUTPUT_DIR)\bin\ms\plugins\mssql2008
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\$(BUILD_CONFIG)\msplugin_mssql2008.dll $(OUTPUT_DIR)\bin\ms\plugins\mssql2008
!IFDEF MS_RELEASE_PDB
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\$(BUILD_CONFIG)\msplugin_mssql2008.pdb $(OUTPUT_DIR)\bin\ms\plugins\mssql2008
!ENDIF
!ENDIF
!IFDEF MS_CSHARP
    if not exist $(OUTPUT_DIR)\bin\ms\csharp mkdir $(OUTPUT_DIR)\bin\ms\csharp
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\mapscript\csharp\$(BUILD_CONFIG)\*.dll $(OUTPUT_DIR)\bin\ms\csharp
	xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\mapscript\csharp\*.dll $(OUTPUT_DIR)\bin\ms\csharp
	xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\mapscript\csharp\*.exe $(OUTPUT_DIR)\bin\ms\csharp
!IFDEF MS_RELEASE_PDB
    xcopy /Y $(BASE_DIR)\$(MAPSERVER_DIR)\$(CMAKE_BUILDDIR)\mapscript\csharp\$(BUILD_CONFIG)\*.pdb $(OUTPUT_DIR)\bin\ms\csharp
!ENDIF
!ENDIF
	cd $(OUTPUT_DIR)\bin
	ms\apps\mapserv -v > $(OUTPUT_DIR)\doc\ms_version.txt
	cd $(BASE_DIR)
!ELSE
    @echo $(MAPSERVER_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF
    
$(PGSQL_LIB): $(OPENSSL_LIB) $(MSVCRT_DLL)
!IFDEF PGSQL_ENABLED
    if not exist $(PGSQL_DIR) git clone -b $(PGSQL_BRANCH) $(PGSQL_SRC) $(PGSQL_DIR)
    cd $(BASE_DIR)\$(PGSQL_DIR)
    rem git reset --hard HEAD
    rem git checkout $(PGSQL_BRANCH)
    cd src\tools\msvc
    echo $$config-^>{openssl} = '$(OUTPUT_DIR)'; >config.pl
!IFNDEF NO_CLEAN
    clean dist
!ENDIF
!IFNDEF NO_BUILD
    build libpq
!ENDIF
    cd $(BASE_DIR)\$(PGSQL_DIR)\$(BUILD_CONFIG)\libpq
    xcopy /Y *.dll $(OUTPUT_DIR)\bin
    xcopy /Y *.lib $(OUTPUT_DIR)\lib
    xcopy /Y $(BASE_DIR)\$(PGSQL_DIR)\src\interfaces\libpq\libpq-fe.h $(OUTPUT_DIR)\include
    xcopy /Y $(BASE_DIR)\$(PGSQL_DIR)\src\interfaces\libpq\libpq-events.h $(OUTPUT_DIR)\include
    xcopy /Y $(BASE_DIR)\$(PGSQL_DIR)\src\include\postgres_ext.h $(OUTPUT_DIR)\include
    xcopy /Y $(BASE_DIR)\$(PGSQL_DIR)\src\include\pg_config_ext.h $(OUTPUT_DIR)\include
    cd $(BASE_DIR)
!ELSE
    @echo $(PGSQL_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.    
!ENDIF

$(SZIP_LIB): $(MSVCRT_DLL)
!IFDEF SZIP_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(SZIP_DIR) mkdir $(SZIP_DIR)
    cd $(SZIP_DIR)
    if not exist $(SZIP_VER).tar.gz $(CURL_EXE) -L -k -o "$(SZIP_VER).tar.gz" "$(SZIP_SRC)"
    if not exist $(SZIP_VER) 7z e -y $(SZIP_VER).tar.gz && 7z x -y $(SZIP_VER).tar
    cd $(SZIP_VER)
!IFNDEF NO_CLEAN
    if exist cmake rd /Q /S cmake
!ENDIF
!IFNDEF NO_BUILD
    if not exist cmake mkdir cmake
	cd cmake
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(SZIP_DIR)\$(SZIP_VER)\cmake\install" "-DBUILD_SHARED_LIBS=ON"
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(SZIP_DIR)\$(SZIP_VER)\cmake\install
    xcopy /Y lib\*.lib $(OUTPUT_DIR)\lib
	xcopy /Y bin\szip.dll $(OUTPUT_DIR)\bin
	xcopy /Y /S include\*.h $(OUTPUT_DIR)\include
	cd $(BASE_DIR)
!ELSE
    @echo $(SZIP_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF

$(HDF4_LIB): $(ZLIB_LIB) $(SZIP_LIB) $(JPEG_LIB) $(MSVCRT_DLL)
!IFDEF HDF4_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(HDF4_DIR) mkdir $(HDF4_DIR)
    cd $(HDF4_DIR)
    if not exist $(HDF4_VER).zip $(CURL_EXE) -L -k -o "$(HDF4_VER).zip" "$(HDF4_SRC)" & 7z x -y $(HDF4_VER).zip
    cd $(HDF4_VER)
!IFNDEF NO_CLEAN
    if exist $(CMAKE_BUILDDIR) rd /Q /S $(CMAKE_BUILDDIR)
!ENDIF
!IFNDEF NO_BUILD
	if not exist $(CMAKE_BUILDDIR) mkdir $(CMAKE_BUILDDIR)
	cd $(CMAKE_BUILDDIR)
!IFDEF HDF4_SZIP
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(HDF4_DIR)\$(HDF4_VER)\$(CMAKE_BUILDDIR)\install" "-DHDF4_ENABLE_Z_LIB_SUPPORT=ON" "-DHDF4_ENABLE_SZIP_SUPPORT=ON" "-DHDF4_BUILD_FORTRAN=OFF" "-DJPEG_LIBRARY=$(JPEG_LIB)"  "-DBUILD_SHARED_LIBS=ON"
!ELSE
    $(CMAKE_DIR)\bin\cmake ..\ -G $(CMAKE_GENERATOR) "-DCMAKE_PREFIX_PATH=$(OUTPUT_DIR)" "-DCMAKE_INSTALL_PREFIX=$(BASE_DIR)\$(HDF4_DIR)\$(HDF4_VER)\$(CMAKE_BUILDDIR)\install" "-DHDF4_ENABLE_Z_LIB_SUPPORT=ON" "-DHDF4_ENABLE_SZIP_SUPPORT=OFF" "-DHDF4_BUILD_FORTRAN=OFF" "-DJPEG_LIBRARY=$(JPEG_LIB)"  "-DBUILD_SHARED_LIBS=ON"
!ENDIF
    $(CMAKE_DIR)\bin\cmake --build . --config $(BUILD_CONFIG) --target install
!ENDIF
    cd $(BASE_DIR)\$(HDF4_DIR)\$(HDF4_VER)\$(CMAKE_BUILDDIR)\install
    xcopy /Y lib\*.lib $(OUTPUT_DIR)\lib
	xcopy /Y bin\hdf.dll $(OUTPUT_DIR)\bin
    xcopy /Y bin\mfhdf.dll $(OUTPUT_DIR)\bin
    xcopy /Y bin\xdr.dll $(OUTPUT_DIR)\bin
    if not exist $(OUTPUT_DIR)\include\hdf4 mkdir $(OUTPUT_DIR)\include\hdf4
    xcopy  /Y /S include\*.h $(OUTPUT_DIR)\include\hdf4
    cd $(BASE_DIR)
!ELSE
    @echo $(HDF4_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF
    
$(LIBICONV_LIB):
!IFDEF LIBICONV_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(LIBICONV_DIR) mkdir $(LIBICONV_DIR)
    cd $(LIBICONV_DIR)
    if not exist $(LIBICONV_VER).tar.gz $(CURL_EXE) -L -k -o "$(LIBICONV_VER).tar.gz" "$(LIBICONV_SRC)"
    if not exist $(LIBICONV_VER) 7z e -y $(LIBICONV_VER).tar.gz && 7z x -y $(LIBICONV_VER).tar
    cd $(LIBICONV_VER)
    cd libcharset
    cd include
    powershell -Command "(gc libcharset.h.in) -replace 'extern void libcharset_set_relocation_prefix', 'extern LIBCHARSET_DLL_EXPORTED void libcharset_set_relocation_prefix' | Out-File -encoding ASCII libcharset.h.in"
    $(CYGWIN_DIR)\bin\dos2unix.exe libcharset.h.in
    cd ..
    cd ..
    cd src
    powershell -Command "(gc Makefile.in) -replace '--output-format=coff', '$$(RCFLAGS)' | Out-File -encoding ASCII Makefile.in"
    cd ..
    cd lib
    powershell -Command "(gc Makefile.in) -replace '--output-format=coff', '$$(RCFLAGS)' | Out-File -encoding ASCII Makefile.in"
    cd ..
!IFNDEF NO_CLEAN
    if exist install rd /Q /S install
    del /S *.obj
!ENDIF
    echo INCLUDE='$(INCLUDE)' >build-aux\vcvars.sh
    echo LIB='$(LIB)' >>build-aux\vcvars.sh
    echo LIBPATH='$(LIBPATH)' >>build-aux\vcvars.sh
    for /f "usebackq tokens=*" %i in (`where cl.exe`) do echo COMPILERPATH=`cygpath -u "%~dpi."` >>build-aux\vcvars.sh
    echo PATH="$$COMPILERPATH":"$$PATH" >>build-aux\vcvars.sh
    echo SRCDIR=`cygpath -u "$(BASE_DIR)\$(LIBICONV_DIR)\$(LIBICONV_VER)"` >>build-aux\vcvars.sh
    echo OUTPUTDIR=`cygpath -u "$(OUTPUT_DIR)"` >>build-aux\vcvars.sh
!IFDEF WIN64
    echo CONFIGHOST=x86_64-w64-mingw32 >>build-aux\vcvars.sh
    echo RCFLAGS='--output-format=coff --target=pe-x86-64' >>build-aux\vcvars.sh
!ELSE
    echo CONFIGHOST=i686-w64-mingw32 >>build-aux\vcvars.sh
    echo RCFLAGS='--output-format=coff --target=pe-i386' >>build-aux\vcvars.sh
!ENDIF
    echo export INCLUDE LIB LIBPATH PATH RCFLAGS >>build-aux\vcvars.sh

    echo cd $$SRCDIR >>build-aux\vcvars.sh
    echo ./configure --host=$$CONFIGHOST --prefix=$$SRCDIR/install CC="$$SRCDIR/build-aux/compile cl -nologo" CFLAGS="-MD" CXX="$$SRCDIR/build-aux/compile cl -nologo" CXXFLAGS="-MD" CPPFLAGS="-D_WIN32_WINNT=_WIN32_WINNT_WIN7 -I$$OUTPUTDIR/include" LDFLAGS="msvcrt.lib legacy_stdio_definitions.lib -L$$OUTPUTDIR/lib" LD="link" NM="dumpbin -symbols" STRIP=":" AR="$$SRCDIR/build-aux/ar-lib lib" RANLIB=":" >>build-aux\vcvars.sh
!IFNDEF NO_CLEAN
    echo make clean >>build-aux\vcvars.sh
!ENDIF
!IFNDEF NO_BUILD
    echo make >>build-aux\vcvars.sh
    echo make install-lib >>build-aux\vcvars.sh
!ENDIF
    $(CYGWIN_DIR)\bin\dos2unix.exe build-aux\vcvars.sh
    if not exist $(BASE_DIR)\$(LIBICONV_DIR)\$(LIBICONV_VER)\install echo run the following command from a cygwin shell!!! & $(CYGWIN_DIR)\bin\cygpath.exe -u "$(BASE_DIR)\$(LIBICONV_DIR)\$(LIBICONV_VER)\build-aux\vcvars.sh" & exit 1
    copy /Y $(BASE_DIR)\$(LIBICONV_DIR)\$(LIBICONV_VER)\install\bin\*.dll $(OUTPUT_DIR)\bin
    copy /Y $(BASE_DIR)\$(LIBICONV_DIR)\$(LIBICONV_VER)\install\lib\iconv.dll.lib $(OUTPUT_DIR)\lib\iconv.lib
    copy /Y $(BASE_DIR)\$(LIBICONV_DIR)\$(LIBICONV_VER)\install\include\*.h $(OUTPUT_DIR)\include
    cd $(BASE_DIR)
!ELSE
    @echo $(LIBICONV_LIB) is outdated, but the build was suppressed! Remove this file to force rebuild.
!ENDIF    
