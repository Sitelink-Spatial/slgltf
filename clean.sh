#!/bin/bash

#--------------------------------------------------------------------------------------------------
SCRIPTPATH=$(realpath ${BASH_SOURCE[0]})
ROOTDIR=$(dirname $SCRIPTPATH)
if [[ ! -d "$ROOTDIR" ]]; then
    echo "Invalid script path: ${ROOTDIR}"
    exit -1
fi

#--------------------------------------------------------------------------------------------------
rmFiles()
{
    for v in $1; do
        f="${ROOTDIR}/${v}"
        if [ -f "$f" ]; then
            rm "$f"
        fi
    done
}

rmDirs()
{
    for v in $1; do
        d="${ROOTDIR}/${v}"
        if [ -d "$d" ]; then
            rm -Rf "$d"
        fi
    done
}


#--------------------------------------------------------------------------------------------------
# Conan
#--------------------------------------------------------------------------------------------------

rmFiles "conan.lock conanbuildinfo.cmake conanbuildinfo.txt conaninfo.txt graph_info.json"
rmDirs "bld"


#--------------------------------------------------------------------------------------------------
# Gradle
#--------------------------------------------------------------------------------------------------

rmDirs ".gradle build"


#--------------------------------------------------------------------------------------------------
# Project files
#--------------------------------------------------------------------------------------------------

rmFiles ".project"
rmDirs ".settings"


#--------------------------------------------------------------------------------------------------
# Package
#--------------------------------------------------------------------------------------------------

rmDirs "package"

#--------------------------------------------------------------------------------------------------
# skbuild
#--------------------------------------------------------------------------------------------------

rmDirs "_skbuild dist slgltf.egg-info src/slgltf.egg-info"

#--------------------------------------------------------------------------------------------------
# npm
#--------------------------------------------------------------------------------------------------

rmDirs "bin"
rmFiles "package-lock.json MANIFEST.in"
