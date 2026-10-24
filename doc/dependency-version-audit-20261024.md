# Dependency version audit

Generated: 2026-10-24 20:26:43 +02:00

This report queries authoritative upstream Git tag repositories. It intentionally keeps compatibility lines (OpenSSL 3, PostgreSQL 16/18, protobuf 3, HDF5 1.14, and MySQL Cluster 8) separate from unrelated major releases.

| Component | Variable | Current pin | Pin owner | Latest matching tag | Result | Upstream |
|---|---|---|---|---|---|---|
| zlib | `ZLIB_BRANCH` | `v1.3.2` | config.opt | `v1.3.2` | current | https://github.com/madler/zlib.git |
| OpenSSL 3 | `OPENSSL_BRANCH` | `openssl-3.6.5` | config.opt | `openssl-3.6.5` | current | https://github.com/openssl/openssl.git |
| curl | `CURL_BRANCH` | `curl-8_23_0` | config.opt | `curl-8_23_0` | current | https://github.com/curl/curl.git |
| libpng | `LIBPNG_VER` | `lpng1659` | config.opt | `v1.6.59` | current | https://git.code.sf.net/p/libpng/code |
| FreeType | `FREETYPE_BRANCH` | `VER-2-15-0` | config.opt | `VER-2-15-0` | current | https://github.com/freetype/freetype.git |
| HarfBuzz | `HARFBUZZ_BRANCH` | `12.3.0` | config.opt | `15.0.0` | review | https://github.com/harfbuzz/harfbuzz.git |
| GEOS | `GEOS_BRANCH` | `3.14.1` | config.opt | `3.15.0` | review | https://github.com/libgeos/geos.git |
| FriBidi | `FRIBIDI_BRANCH` | `v1.0.17` | config.opt | `v1.0.17` | current | https://github.com/fribidi/fribidi.git |
| PostgreSQL 18 candidate | `PGSQL_BRANCH` | `REL_18_6` | config.opt | `REL_18_6` | current | https://github.com/postgres/postgres.git |
| PROJ | `PROJ9_BRANCH` | `9.9.0` | config.opt | `9.9.0` | current | https://github.com/OSGeo/PROJ.git |
| PROJ-data | `PROJ_DATA_BRANCH` | `1.25.0` | config.opt | `1.25.0` | current | https://github.com/OSGeo/PROJ-data.git |
| GDAL | `GDAL_BRANCH` | `v3.13.3` | setversions.bat (effective release) | `v3.13.3` | current | https://github.com/OSGeo/gdal.git |
| MapServer | `MAPSERVER_BRANCH` | `rel-8-6-6` | setversions.bat (effective release) | `rel-8-6-6` | current | https://github.com/MapServer/MapServer.git |
| MapCache | `MAPCACHE_BRANCH` | `rel-1-16-0` | setversions.bat (effective release) | `rel-1-16-0` | current | https://github.com/MapServer/mapcache.git |
| libxml2 | `LIBXML2_BRANCH` | `v2.15.4` | config.opt | `v2.15.4` | current | https://github.com/GNOME/libxml2.git |
| libwebp | `LIBWEBP_BRANCH` | `v1.6.0` | config.opt | `v1.6.0` | current | https://chromium.googlesource.com/webm/libwebp |
| Zstandard | `ZSTD_BRANCH` | `v1.5.7` | config.opt | `v1.5.7` | current | https://github.com/facebook/zstd.git |
| muparser | `MUPARSER_BRANCH` | `v2.3.5` | config.opt | `v2.3.5` | current | https://github.com/beltoforion/muparser.git |
| Xerces-C | `XERCES_BRANCH` | `v3.3.0` | config.opt | `v3.3.0` | current | https://github.com/apache/xerces-c.git |
| Expat | `LIBEXPAT_BRANCH` | `R_2_9_0` | config.opt | `R_2_9_0` | current | https://github.com/libexpat/libexpat.git |
| protobuf 3 | `PROTOBUF_BRANCH` | `v3.29.5` | config.opt | `v3.29.5` | current | https://github.com/protocolbuffers/protobuf.git |
| protobuf-c | `PROTOBUF_C_BRANCH` | `v1.5.2` | config.opt | `v1.5.2` | current | https://github.com/protobuf-c/protobuf-c.git |
| HDF4 | `HDF4_BRANCH` | `hdf-4_2_16` | config.opt | `hdf-4_2_16` | current | https://github.com/HDFGroup/hdf4.git |
| HDF5 1.14 | `HDF5_BRANCH` | `hdf5-1_14_3` | config.opt | `hdf5-1_14_3` | current | https://github.com/HDFGroup/hdf5.git |
| libtiff | `LIBTIFF_BRANCH` | `v4.7.2` | config.opt | `v4.7.2` | current | https://gitlab.com/libtiff/libtiff.git |
| libgeotiff | `LIBGEOTIFF_BRANCH` | `1.7.4` | config.opt | `1.7.4` | current | https://github.com/OSGeo/libgeotiff.git |
| OpenJPEG | `OPENJPEG_BRANCH` | `v2.5.4` | config.opt | `v2.5.4` | current | https://github.com/uclouvain/openjpeg.git |
| FastCGI | `FCGI_BRANCH` | `2.4.7` | config.opt | `2.4.7` | current | https://github.com/FastCGI-Archives/fcgi2.git |
| libkml | `LIBKML_BRANCH` | `1.3.0` | config.opt | `1.3.0` | current | https://github.com/libkml/libkml.git |
| MySQL cluster 8 | `MYSQL_BRANCH` | `mysql-cluster-8.1.0` | config.opt | `mysql-cluster-8.4.13` | review | https://github.com/mysql/mysql-server.git |
| KEA | `KEA_BRANCH` | `kealib-1.4.14` | config.opt | `kealib-2.0.0` | review | https://github.com/ubarsc/kealib.git |
| NetCDF | `NETCDF_BRANCH` | `v4.8.1` | config.opt | `v4.10.1` | review | https://github.com/Unidata/netcdf-c.git |
| OGDI | `OGDI_BRANCH` | `ogdi_4_1_1` | config.opt | `ogdi_4_1_1` | current | https://github.com/libogdi/ogdi.git |
| Boost | `BOOST_BRANCH` | `boost-1.75.0` | config.opt | `boost-1.92.0` | review | https://github.com/boostorg/boost.git |
| SWIG | `SWIG_VER` | `4.0.2` | Makefile/default | `rel-4.0.2` | current | https://github.com/swig/swig.git |
| CMake | `CMAKE_TOOL_VER` | `not pinned` | Makefile/default | `v4.4.4` | review | https://github.com/Kitware/CMake.git |
| Ninja | `NINJA_TOOL_VER` | `not pinned` | Makefile/default | `v1.13.2` | review | https://github.com/ninja-build/ninja.git |
| WinFlexBison | `WINFLEXBISON_VER` | `not pinned` | Makefile/default | `v2.5.25` | review | https://github.com/lexxmark/winflexbison.git |
| IJG JPEG | `JPEG_VER` | `jpeg-10` | config.opt | `jpeg-10` | current | https://ijg.org/ |
| GNU libiconv | `LIBICONV_VER` | `libiconv-1.19` | config.opt | `libiconv-1.19` | current | https://ftp.gnu.org/pub/gnu/libiconv/ |
| SQLite | `SQLITE_VER` | `3.54.1` | config.opt | `3.54.1` | current | https://www.sqlite.org/chronology.html |

The IJG JPEG, GNU libiconv, and SQLite rows were checked on their authoritative release pages because their configured sources are archives or do not expose suitable release tags. Other archive-only dependencies and commercial SDKs still require manual verification. A newer tag is a review candidate, not automatic approval to change an ABI or supported compatibility line.
