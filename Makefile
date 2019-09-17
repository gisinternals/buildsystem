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
CMAKE_BUILDDIR = vc16x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15 2017"
CMAKE_BUILDDIR = vc16
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.15.26726.0"
MSVC_VER = 1911
MESON_BACKEND = vs2017
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 15 2017 Win64"
CMAKE_BUILDDIR = vc16x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15 2017"
CMAKE_BUILDDIR = vc16
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.16.27034.0"
MSVC_VER = 1911
MESON_BACKEND = vs2017
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 15 2017 Win64"
CMAKE_BUILDDIR = vc16x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 15 2017"
CMAKE_BUILDDIR = vc16
!ENDIF
!ELSEIF "$(_NMAKE_VER)" == "14.22.27905.0"
MSVC_VER = 1922
MESON_BACKEND = vs2019
!IFDEF WIN64
CMAKE_GENERATOR = "Visual Studio 16 2019" -A x64
CMAKE_BUILDDIR = vc17x64
!ELSE
CMAKE_GENERATOR = "Visual Studio 16 2019" -A Win32
CMAKE_BUILDDIR = vc17
!ENDIF
!ELSE
!ERROR This compiler version $(_NMAKE_VER) is not supported or must be enumerated in the makefile
!ENDIF
!ENDIF

!IFNDEF SERVER_URL
SERVER_URL=http://www.gisinternals.com/sdk
!ENDIF

#specify build targets
MSVCR_DLL = $(OUTPUT_DIR)\build\msvcr.install
ZLIB_LIB = $(OUTPUT_DIR)\lib\zlib.lib
OPENSSL_LIB = $(OUTPUT_DIR)\lib\libssl.lib
CURL_LIB = $(OUTPUT_DIR)\lib\libcurl_imp.lib
CURL_EXE = $(OUTPUT_DIR)\bin\curl\curl.exe
CURL_CA_BUNDLE = $(OUTPUT_DIR)\bin\curl\curl-ca-bundle.crt
LIBPNG_LIB = $(OUTPUT_DIR)\lib\libpng16.lib
JPEG_LIB = $(OUTPUT_DIR)\lib\libjpeg.lib
FREETYPE_LIB = $(OUTPUT_DIR)\lib\freetype.lib
HARFBUZZ_LIB = $(OUTPUT_DIR)\lib\harfbuzz.lib
FREETYPE_1 = $(OUTPUT_DIR)\build\freetype_1.install
FREETYPE_2 = $(OUTPUT_DIR)\build\freetype_2.install
GEOS_LIB = $(OUTPUT_DIR)\lib\geos_c.lib
FRIBIDI_LIB = $(OUTPUT_DIR)\lib\fribidi.lib
LIBICONV_LIB = $(OUTPUT_DIR)\lib\iconv.lib
PGSQL_LIB = $(OUTPUT_DIR)\lib\libpqdll.lib
PROJ4_LIB = $(OUTPUT_DIR)\lib\proj_4_9.lib
PROJ6_LIB = $(OUTPUT_DIR)\lib\proj_6_2.lib
SQLITE_LIB = $(OUTPUT_DIR)\lib\sqlite3.lib
SPATIALITE_LIB = $(OUTPUT_DIR)\lib\spatialite.lib
FREEXL_LIB = $(OUTPUT_DIR)\lib\freexl.lib
LIBXML2_LIB = $(OUTPUT_DIR)\lib\libxml2.lib
XERCES_LIB = $(OUTPUT_DIR)\lib\xerces-c_3D.lib
LIBEXPAT_LIB = $(OUTPUT_DIR)\lib\expat.lib
GDAL_LIB = $(OUTPUT_DIR)\lib\gdal_i.lib
GDAL_OPT = $(OUTPUT_DIR)\build\gdal.opt
MAPSERVER_LIB = $(OUTPUT_DIR)\lib\mapserver.lib

# Update enabled flags
MSVCR_ENABLED = 1
ZLIB_ENABLED = 1
!IF DEFINED(GDAL_CURL) || DEFINED(MS_CLIENT_WMS)  || DEFINED(MS_CLIENT_WFS)
OPENSSL_ENABLED = 1
CURL_ENABLED = 1
!ENDIF
LIBPNG_ENABLED = 1
JPEG_ENABLED = 1
FREETYPE_ENABLED = 1
HARFBUZZ_ENABLED = 1
!IF DEFINED(MS_GEOS) || DEFINED(GDAL_GEOS)
GEOS_ENABLED = 1
!ENDIF
FRIBIDI_ENABLED = 1
LIBICONV_ENABLED = 1
PGSQL_ENABLED = 1
PROJ4_ENABLED = 1
PROJ6_ENABLED = 1
SQLITE_ENABLED = 1
SPATIALITE_ENABLED = 1
FREEXL_ENABLED = 1
LIBXML2_ENABLED = 1
GDAL_ENABLED = 1
MAPSERVER_ENABLED = 1
XERCES_ENABLED = 1
LIBEXPAT_ENABLED = 1

# set up mapserver configuration
MAPSERVER_OPT = -DWITH_THREAD_SAFETY=1 -DREGEX_DIR=$(REGEX_PATH:\=/)
!IFDEF MS_POSTGIS
MAPSERVER_OPT = $(MAPSERVER_OPT) "-DPOSTGRESQL_LIBRARY=$(OUTPUT_DIR:\=/)/lib/libpqdll.lib"
!ELSE
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_POSTGIS=0
!ENDIF

!IFNDEF MS_PROTOBUFC
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_PROTOBUFC=0
!ENDIF

!IFDEF MS_PROJ
MAPSERVER_OPT = $(MAPSERVER_OPT) "-DPROJ_LIBRARY=$(OUTPUT_DIR:\=/)/lib/proj_4_9.lib"
!ELSE
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_PROJ=0
!ENDIF

!IFNDEF MS_ICONV
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_ICONV=0
!ENDIF

!IFNDEF MS_CAIRO
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_CAIRO=0
!ENDIF

!IFNDEF MS_FCGI
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_FCGI=0
!ENDIF

!IFNDEF MS_GIFLIB
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_GIF=0
!ENDIF

!IFNDEF MS_LIBXML2
MAPSERVER_OPT = $(MAPSERVER_OPT) -DWITH_LIBXML2=0
!ENDIF


!IFDEF DEBUG
BUILD_CONFIG=RelWithDebInfo
!ELSE
BUILD_CONFIG=Release
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

!IFNDEF SWIG_DIR
SWIG_DIR = SWIG-1.3.39
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

test: $(LIBEXPAT_LIB)

test2: $(FREEXL_LIB)

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
!IFDEF MSVCR_ENABLED
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
!ENDIF
  
$(ZLIB_DIR):
!IFDEF ZLIB_ENABLED
    git clone -b $(ZLIB_BRANCH) $(ZLIB_SRC) $(ZLIB_DIR)
!ENDIF
    
$(ZLIB_LIB): $(ZLIB_DIR) $(MSVCR_DLL)
!IFDEF ZLIB_ENABLED
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
!ENDIF

$(OPENSSL_DIR):
!IFDEF OPENSSL_ENABLED
    git clone -b $(OPENSSL_BRANCH) $(OPENSSL_SRC) $(OPENSSL_DIR)
!ENDIF
    
$(OPENSSL_LIB): $(OPENSSL_DIR) $(MSVCRT_DLL) $(ZLIB_LIB)
!IFDEF OPENSSL_ENABLED
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
    if not exist $(OUTPUT_DIR)\bin\curl mkdir $(OUTPUT_DIR)\bin\curl
    xcopy /Y apps\openssl.exe $(OUTPUT_DIR)\bin\curl
    cd $(BASE_DIR)
!ENDIF   

$(CURL_DIR):
!IFDEF CURL_ENABLED
    git clone -b $(CURL_BRANCH) $(CURL_SRC) $(CURL_DIR)
!ENDIF
        
$(CURL_LIB): $(CURL_DIR) $(OPENSSL_LIB) $(MSVCRT_DLL) $(ZLIB_LIB) 
!IFDEF CURL_ENABLED
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
    if not exist $(OUTPUT_DIR)\bin\curl mkdir $(OUTPUT_DIR)\bin\curl
    xcopy /Y install\bin\*.exe $(OUTPUT_DIR)\bin\curl
    cd $(BASE_DIR)
!ENDIF

$(CURL_EXE): $(CURL_LIB)

$(CURL_CA_BUNDLE): $(CURL_EXE)
!IFDEF CURL_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    $(CURL_EXE) -o "$(CURL_CA_BUNDLE)" "http://curl.haxx.se/ca/cacert.pem"
!ENDIF
    
$(LIBPNG_DIR):
!IFDEF LIBPNG_ENABLED
    if not exist $(LIBPNG_DIR) mkdir $(LIBPNG_DIR)    
    SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    cd $(LIBPNG_DIR)
    $(CURL_EXE) -L -k -o "libpng.zip" "$(LIBPNG_SRC)"
    7z x -y libpng.zip
    cd $(BASE_DIR)
!ENDIF
    
$(LIBPNG_LIB): $(CURL_EXE) $(CURL_CA_BUNDLE) $(LIBPNG_DIR) $(MSVCRT_DLL) $(ZLIB_LIB)
!IFDEF LIBPNG_ENABLED
    cd $(BASE_DIR)\$(LIBPNG_DIR)\$(LIBPNG_VER)
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
!ENDIF

$(JPEG_DIR):
!IFDEF JPEG_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(JPEG_DIR) mkdir $(JPEG_DIR)
    cd $(JPEG_DIR)
    $(CURL_EXE) -L -k -o "jpeg.zip" "$(JPEG_SRC)"
    7z x -y jpeg.zip
    cd $(BASE_DIR)
!ENDIF

$(JPEG_LIB): $(CURL_EXE) $(CURL_CA_BUNDLE) $(JPEG_DIR) $(MSVCRT_DLL)
!IFDEF JPEG_ENABLED
    xcopy /Y $(BASE_DIR)\support\win32.mak $(BASE_DIR)\$(JPEG_DIR)\$(JPEG_VER)
	cd $(BASE_DIR)\$(JPEG_DIR)\$(JPEG_VER)
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
!ENDIF
    
$(FREETYPE_DIR):
!IFDEF FREETYPE_ENABLED
    git clone -b $(FREETYPE_BRANCH) $(FREETYPE_SRC) $(FREETYPE_DIR)
!ENDIF

$(FREETYPE_1): $(FREETYPE_DIR) $(MSVCRT_DLL) $(ZLIB_LIB) $(LIBPNG_LIB)
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
    echo freetype phase 1 > $(FREETYPE_1)
	cd $(BASE_DIR)
!ENDIF

$(FREETYPE_2): $(FREETYPE_DIR) $(HARFBUZZ_LIB) $(MSVCRT_DLL) $(ZLIB_LIB) $(LIBPNG_LIB)
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
!ENDIF

$(HARFBUZZ_DIR):
!IFDEF HARFBUZZ_ENABLED
    git clone -b $(HARFBUZZ_BRANCH) $(HARFBUZZ_SRC) $(HARFBUZZ_DIR)
!ENDIF

$(HARFBUZZ_LIB): $(HARFBUZZ_DIR) $(MSVCRT_DLL) $(FREETYPE_1) $(LIBPNG_LIB) $(ZLIB_LIB)
!IFDEF HARFBUZZ_ENABLED
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
!ENDIF

$(GEOS_DIR):
!IFDEF GEOS_ENABLED
    git clone -b $(GEOS_BRANCH) $(GEOS_SRC) $(GEOS_DIR)
!ENDIF

$(GEOS_LIB): $(GEOS_DIR) $(MSVCRT_DLL)
!IFDEF GEOS_ENABLED
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
!ENDIF

$(LIBEXPAT_DIR):
!IFDEF LIBEXPAT_ENABLED
    git clone -b $(LIBEXPAT_BRANCH) $(LIBEXPAT_SRC) $(LIBEXPAT_DIR)
!ENDIF

$(LIBEXPAT_LIB): $(LIBEXPAT_DIR)
!IFDEF LIBEXPAT_ENABLED
    cd $(BASE_DIR)\$(LIBEXPAT_DIR)
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
!ENDIF

$(XERCES_DIR):
!IFDEF XERCES_ENABLED
    svn co $(XERCES_SRC)/$(XERCES_BRANCH) $(XERCES_DIR)
!ENDIF

$(XERCES_LIB): $(XERCES_DIR)
!IFDEF XERCES_ENABLED
    cd $(BASE_DIR)\$(XERCES_DIR)
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
!ENDIF

$(FRIBIDI_DIR):
!IFDEF FRIBIDI_ENABLED
    git clone -b $(FRIBIDI_BRANCH) $(FRIBIDI_SRC) $(FRIBIDI_DIR)
!ENDIF

$(FRIBIDI_LIB): $(FRIBIDI_DIR)
!IFDEF FRIBIDI_ENABLED
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
!ENDIF

$(PROJ4_DIR):
!IFDEF PROJ4_ENABLED
    git clone -b $(PROJ4_BRANCH) $(PROJ_SRC) $(PROJ4_DIR)
!ENDIF
    
$(PROJ4_LIB): $(PROJ4_DIR) $(MSVCRT_DLL)
!IFDEF PROJ4_ENABLED
    cd $(BASE_DIR)\$(PROJ4_DIR)
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
!ENDIF

$(PROJ6_DIR):
!IFDEF PROJ6_ENABLED
    git clone -b $(PROJ6_BRANCH) $(PROJ_SRC) $(PROJ6_DIR)
!ENDIF
    
$(PROJ6_LIB): $(PROJ6_DIR) $(MSVCRT_DLL) $(SQLITE_LIB)
!IFDEF PROJ6_ENABLED
    cd $(BASE_DIR)\$(PROJ6_DIR)
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
!ENDIF

$(SQLITE_DIR):
!IFDEF SQLITE_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(SQLITE_DIR) mkdir $(SQLITE_DIR)
    cd $(SQLITE_DIR)
    $(CURL_EXE) -L -k -o "sqlite.zip" "$(SQLITE_SRC)"
    7z x -y sqlite.zip
    cd $(BASE_DIR)
!ENDIF

$(SQLITE_LIB): $(SQLITE_DIR) $(MSVCRT_DLL)
!IFDEF SQLITE_ENABLED
    cd $(SQLITE_DIR)\sqlite
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
!ENDIF

$(FREEXL_DIR):
!IFDEF SPATIALITE_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(FREEXL_DIR) mkdir $(FREEXL_DIR)
    cd $(FREEXL_DIR)
    $(CURL_EXE) -L -k -o "freexl.zip" "$(FREEXL_SRC)"
    7z x -y freexl.zip
    cd $(BASE_DIR)
!ENDIF

$(FREEXL_LIB): $(FREEXL_DIR) $(LIBICONV_LIB) $(MSVCRT_DLL)
!IFDEF FREEXL_ENABLED
    cd $(FREEXL_DIR)\$(FREEXL_VER)
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
!ENDIF

$(SPATIALITE_DIR):
!IFDEF FREEXL_ENABLED
    SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    if not exist $(SPATIALITE_DIR) mkdir $(SPATIALITE_DIR)
    cd $(SPATIALITE_DIR)
    $(CURL_EXE) -L -k -o "spatialite.zip" "$(SPATIALITE_SRC)"
    7z x -y spatialite.zip
    cd $(BASE_DIR)
!ENDIF

$(SPATIALITE_LIB): $(SPATIALITE_DIR) $(SQLITE_LIB) $(LIBXML2_LIB) $(PROJ4_LIB) $(LIBICONV_LIB) $(FREEXL_LIB) $(ZLIB_LIB) $(MSVCRT_DLL)
!IFDEF SQLITE_ENABLED
    cd $(SPATIALITE_DIR)\$(SPATIALITE_VER)
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
!ENDIF

$(LIBXML2_LIB): $(LIBXML2_DIR) $(ZLIB_LIB) $(LIBICONV_LIB) $(MSVCRT_DLL)
!IFDEF LIBXML2_ENABLED
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
!ENDIF
    
$(GDAL_DIR):
!IFDEF GDAL_ENABLED
    git clone -b $(GDAL_BRANCH) $(GDAL_SRC) $(GDAL_DIR)
!ENDIF

$(GDAL_OPT):
!IFDEF GDAL_ENABLED
    echo SWIG=$(BASE_DIR)\$(SWIG_DIR)\swig.exe > $(GDAL_OPT)
	echo swig - $(SWIG_DIR) > $(OUTPUT_DIR)\doc\gdal_deps.txt
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

$(GDAL_LIB): $(GDAL_DIR) $(GDAL_OPT) $(MSVCRT_DLL) $(CURL_LIB) $(GEOS_LIB) $(PROJ4_LIB) $(PROJ6_LIB) $(PGSQL_LIB)
!IFDEF GDAL_ENABLED
    cd $(GDAL_PATH)
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
!ENDIF

$(MAPSERVER_DIR):
!IFDEF MAPSERVER_ENABLED
    git clone -b $(MAPSERVER_BRANCH) $(MAPSERVER_SRC) $(MAPSERVER_DIR)
!ENDIF

$(MAPSERVER_LIB): $(MAPSERVER_DIR) $(MSVCRT_DLL) $(ZLIB_LIB) $(JPEG_LIB) $(LIBPNG_LIB) $(CURL_LIB) $(FREETYPE_2) $(GEOS_LIB) $(FRIBIDI_LIB) $(PROJ4_LIB) $(PGSQL_LIB) $(GDAL_LIB) 
!IFDEF MAPSERVER_ENABLED
	cd $(MAPSERVER_DIR) 
!IFNDEF NO_CLEAN
    git reset --hard HEAD
    git checkout $(MAPSEERVER_BRANCH)
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
	cd $(OUTPUT_DIR)\bin
	ms\apps\mapserv -v > $(OUTPUT_DIR)\doc\ms_version.txt
	cd $(BASE_DIR)
!ENDIF

$(PGSQL_DIR):
!IFDEF PGSQL_ENABLE
    git clone -b $(PGSQL_BRANCH) $(PGSQL_SRC) $(PGSQL_DIR)
!ENDIF
    
$(PGSQL_LIB):
!IFDEF PGSQL_ENABLED
    cd $(BASE_DIR)\$(PGSQL_DIR)
    rem git reset --hard HEAD
    rem git checkout $(PGSQL_BRANCH)
    cd $(BASE_DIR)\$(PGSQL_DIR)\src\interfaces\libpq
!IFNDEF NO_CLEAN
    nmake /f win32.mak clean
!ENDIF
!IFNDEF NO_BUILD
!IFDEF WIN64
    nmake /f win32.mak CPU=AMD64 MSVC_VER=$(MSVC_VER) USE_SSL=1 SSL_INC=$(OUTPUT_DIR)\include SSL_LIB_PATH=$(OUTPUT_DIR)\lib
!ELSE
    nmake /f win32.mak MSVC_VER=$(MSVC_VER) USE_SSL=1 SSL_INC=$(OUTPUT_DIR)\include SSL_LIB_PATH=$(OUTPUT_DIR)\lib
!ENDIF
!ENDIF
    xcopy /Y libpq-fe.h $(OUTPUT_DIR)\include
    cd Release
    xcopy /Y *.dll $(OUTPUT_DIR)\bin
    xcopy /Y *.lib $(OUTPUT_DIR)\lib
    cd $(BASE_DIR)
    xcopy /Y $(PGSQL_DIR)\src\include\postgres_ext.h $(OUTPUT_DIR)\include
	xcopy /Y $(PGSQL_DIR)\src\include\pg_config_ext.h $(OUTPUT_DIR)\include
!ENDIF

$(LIBICONV_DIR):
!IFDEF LIBICONV_ENABLED
    rem git clone -b $(LIBICONV_BRANCH) $(LIBICONV_SRC) $(LIBICONV_DIR)
    rem SET PATH=$(OUTPUT_DIR)\bin;$(OUTPUT_DIR)\bin\curl;$(PATH)
    rem SET CURL_CA_BUNDLE=$(CURL_CA_BUNDLE)
    rem $(CURL_EXE) -L -k -o $(LIBICONV_DIR)\build-aux\ar-lib "https://git.savannah.gnu.org/gitweb/?p=automake.git;a=blob_plain;f=lib/ar-lib;hb=HEAD"
    rem $(CURL_EXE) -L -k -o $(LIBICONV_DIR)\build-aux\compile "https://git.savannah.gnu.org/gitweb/?p=automake.git;a=blob_plain;f=lib/compile;hb=HEAD"
!ENDIF
    
$(LIBICONV_LIB): $(LIBICONV_DIR)
    echo INCLUDE='$(INCLUDE)' >$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo LIB='$(LIB)' >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo LIBPATH='$(LIBPATH)' >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo PATH=`cygpath -u "$(VCINSTALLDIR)bin\amd64"`:"$$PATH" >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo export INCLUDE LIB LIBPATH PATH >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo ./configure --host=i686-w64-mingw32 --prefix=/cygdrive/e/buildsystem/src/libiconv-1.16/install CC="/cygdrive/e/buildsystem/src/libiconv-1.15/build-aux/compile cl -nologo" CFLAGS="-MD" CXX="/cygdrive/e/buildsystem/src/libiconv-1.15/build-aux/compile cl -nologo" CXXFLAGS="-MD" CPPFLAGS="-D_WIN32_WINNT=_WIN32_WINNT_WIN7 -I/cygdrive/e/buildsystem/release-1900-x64/include" LDFLAGS="msvcrt.lib legacy_stdio_definitions.lib -L/cygdrive/e/buildsystem/release-1900-x64/lib" LD="link" NM="dumpbin -symbols" STRIP=":" AR="/cygdrive/e/buildsystem/src/libiconv-1.15/build-aux/ar-lib lib" RANLIB=":" >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo make >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    echo install-lib >>$(LIBICONV_DIR)\build-aux\vcvars.sh
    E:\cygwin\bin\dos2unix.exe $(LIBICONV_DIR)\build-aux\vcvars.sh
    copy /Y $(BASE_DIR)\$(LIBICONV_DIR)\install\bin\*.dll $(OUTPUT_DIR)\bin
    copy /Y $(BASE_DIR)\$(LIBICONV_DIR)\install\lib\iconv.dll.lib $(OUTPUT_DIR)\lib\iconv.lib
    copy /Y $(BASE_DIR)\$(LIBICONV_DIR)\install\include\*.h $(OUTPUT_DIR)\include
    
