dnl Process this file with autoconf to produce a configure script.
AC_INIT(sumo, 0.21.0)
AC_CONFIG_SRCDIR(src/sumo_main.cpp)
AC_CANONICAL_SYSTEM

dnl create an config-header
AC_CONFIG_HEADER(src/config.h)

dnl enable automake-support
AM_INIT_AUTOMAKE([gnu dist-zip tar-ustar])


dnl the debug check has to be made before the program checks
dnl because it modifies CXXFLAGS
AC_ARG_ENABLE([debug], [AS_HELP_STRING([--enable-debug],[enable sumo debugging code [default=no].])])
if test x$enable_debug = xyes; then
    AC_DEFINE(_DEBUG, 1, [Define to 1 in order to enable sumo debugging code.])
    CXXFLAGS="-g -pthread $CXXFLAGS"
    ac_enabled="$ac_enabled Debug"
    program_transform_name="s,\$\$,D,; $program_transform_name"
else
    CXXFLAGS="-O2 -DNDEBUG $CXXFLAGS"
    ac_disabled="$ac_disabled Debug"
fi

AC_ARG_ENABLE([profiling], [AS_HELP_STRING([--enable-profiling],[enable compilation of gprof profiling code [default=no].])])
if test x$enable_profiling = xyes; then
    CXXFLAGS="-pg $CXXFLAGS"
    ac_enabled="$ac_enabled Profiling"
else
    ac_disabled="$ac_disabled Profiling"
fi


dnl Checks for programs.
AC_PROG_CC
AC_PROG_CPP
AC_PROG_CXX
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET

dnl enable libtool-support
dnl gives a deprecated warning for RANLIB with newer libtools
AC_PROG_RANLIB
AM_PROG_LIBTOOL


dnl Check for enable-features that shall go into config.h
AC_ARG_ENABLE([memcheck], [AS_HELP_STRING([--enable-memcheck],[enable compilation of memory leak checks [default=no].])])
AM_CONDITIONAL(CHECK_MEMORY_LEAKS, test x$enable_memcheck = xyes)
if test x$enable_memcheck = xyes; then
    AC_DEFINE(CHECK_MEMORY_LEAKS, 1, [Define to 1 in order to enable memory checks.])
    ac_enabled="$ac_enabled MemoryChecks"
else
    ac_disabled="$ac_disabled MemoryChecks"
fi

AC_ARG_ENABLE([internal-lanes], [AS_HELP_STRING([--disable-internal-lanes],[Disable junction internal lanes.])])
if test x$enable_internal_lanes != xno; then
    AC_DEFINE(HAVE_INTERNAL_LANES, 1, [Define to 1 if you want junction internal lanes])
    ac_enabled="$ac_enabled InternalLanes"
else
    ac_disabled="$ac_disabled InternalLanes"
fi

AC_ARG_ENABLE([double-precision], [AS_HELP_STRING([--disable-double-precision],[Use "float" instead of "double" for calculations.])])
if test x$enable_double_precision != xno; then
    AC_DEFINE([SUMOReal], [double], [defines the precision of floats])
    ac_enabled="$ac_enabled DoublePrecision"
else
    AC_DEFINE([SUMOReal], [float], [defines the precision of floats])
    ac_disabled="$ac_disabled DoublePrecision"
fi
AC_DEFINE([SUMOLong], [long long int], [defines a long])

AC_ARG_ENABLE([subsecond], [AS_HELP_STRING([--disable-subsecond],[Disable subsecond timesteps.])])
if test x$enable_subsecond != xno; then
    AC_DEFINE(HAVE_SUBSECOND_TIMESTEPS, 1, [Undefine for disabling subsecond timesteps.])
    ac_enabled="$ac_enabled Subsecond"
else
    ac_disabled="$ac_disabled Subsecond"
fi

AC_DEFINE([POSITION_EPS], [(SUMOReal)0.1], [defines the epsilon to use on position comparison])
AC_DEFINE([NUMERICAL_EPS], [(SUMOReal)0.001], [defines the epsilon to use on general floating point comparison])
AC_DEFINE([OUTPUT_ACCURACY], [2], [defines the number of digits after the comma in output])
AC_DEFINE([GEO_OUTPUT_ACCURACY], [6], [defines the number of digits after the comma in geo-coordinates output])
AC_DEFINE([SUMOLong], [long long int], [defines the type for very long integers])

dnl   ... for xerces 3.0
PKG_CHECK_MODULES([XERCES], [xerces-c >= 3.0],
                  [AC_DEFINE([XERCES3_SIZE_t],[XMLSize_t],[Define length for Xerces 3.])],
                  [AC_DEFINE([XERCES3_SIZE_t],[unsigned int],[Define length for Xerces 2.])])


AM_CONDITIONAL(INTERNAL, test -d $srcdir/src/internal)
m4_syscmd([test -d src/internal])
m4_if(m4_sysval,[0],[
    AC_DEFINE([HAVE_INTERNAL], [1], [Define to enable internal code.])
    AC_CONFIG_FILES([src/mesogui/Makefile src/mesosim/Makefile src/netedit/Makefile src/osgview/Makefile src/marouter/Makefile src/internal/Makefile unittest/src/internal/Makefile])
    INTERNAL_DIRS="mesosim marouter internal"
    AC_SUBST([INTERNAL_DIRS])
    GUI_INTERNAL_DIRS="mesogui netedit osgview"
    AC_SUBST([GUI_INTERNAL_DIRS])
    UNITTEST_INTERNAL_DIRS=internal
    AC_SUBST([UNITTEST_INTERNAL_DIRS])
    ac_enabled="$ac_enabled Internal"
    program_transform_name="s,\$\$,Int,; s,sumoInt,meso,; s,sumo-guiInt,meso-gui,; s,marouterInt,marouter,; s,neteditInt,netedit,; $program_transform_name"
])

AC_ARG_ENABLE([traci],[AS_HELP_STRING([--disable-traci],[disable Traffic Control Interface (TraCI) Server [default=no].])])
AM_CONDITIONAL(TRACI, test x$enable_traci != xno)
if test x$enable_traci != xno; then
    ac_enabled="$ac_enabled TRACI"
else
    AC_DEFINE(NO_TRACI, 1, [Define to 1 in order to disable TraCI Server.])
    ac_disabled="$ac_disabled TRACI"
fi

AM_CONDITIONAL([WITH_VERSION_H], test -d .svn)
if test -d .svn; then
   AC_DEFINE([HAVE_VERSION_H], [1], [Define if auto-generated version.h should be used.])
else
   AC_DEFINE_UNQUOTED(VERSION_STRING, "$PACKAGE_VERSION", [Defined if auto-generated version.h is unavailable.])
fi

dnl ---------------------------------------------
dnl Platform specific stuff
dnl - - - - - - - - - - - - - - - - - - - - - - -

case "$host" in
   *-cygwin*)
   AC_DEFINE([HAVE_CYGWIN], [1], [Define if compiling under cygwin])
   AC_DEFINE([WIN32], [1], [Xerces and Fox expect this to be defined (cygwin)])
   AC_DEFINE([NOMINMAX], [1], [Including windows.h gives errors otherwise (cygwin)])
   ;;
esac


dnl ---------------------------------------------
dnl check for libraries...
dnl - - - - - - - - - - - - - - - - - - - - - - -

dnl  ... for xerces
AC_ARG_WITH([xerces], [AS_HELP_STRING([--with-xerces=DIR],[where Xerces-C is installed (libraries in DIR/lib, headers in DIR/include).])])
if test x"$with_xerces" != x; then
   if test x"$with_xerces_libraries" = x; then
      with_xerces_libraries=$with_xerces/lib
   fi
   if test x"$with_xerces_includes" = x; then
      with_xerces_includes=$with_xerces/include
   fi
fi

dnl   ... for libs
LIB_XERCES="xerces-c"
AC_ARG_WITH([xerces-libraries], [AS_HELP_STRING([--with-xerces-libraries=DIR],[where the Xerces-C library is installed.])])
if test x"$with_xerces_libraries" = x; then
   AC_CHECK_LIB([$LIB_XERCES], [main], [true],
                [AC_MSG_ERROR([xerces-lib not found. Specify path with option --with-xerces-libraries=DIR.])])
else
   save_ldflags=$LDFLAGS
   LDFLAGS="-L$with_xerces_libraries"
   export LDFLAGS
   AC_CHECK_LIB([$LIB_XERCES], [main], [XERCES_LDFLAGS=$LDFLAGS],
                [AC_MSG_ERROR([xerces-lib not found in "$with_xerces_libraries".])])
   LDFLAGS=$save_ldflags
   AC_SUBST(XERCES_LDFLAGS)
fi
AC_SUBST(LIB_XERCES)

dnl   ... for includes
AC_ARG_WITH([xerces-includes], [AS_HELP_STRING([--with-xerces-includes=DIR],[where the Xerces-C includes are.])])
save_cppflags=$CPPFLAGS
if test x"$with_xerces_includes" = x; then
    CPPFLAGS="$CPPFLAGS -I/usr/local/include -I/usr/include"
    export CPPFLAGS
    AC_CHECK_HEADER([xercesc/util/XercesVersion.hpp], [AM_CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"],
                    [AC_MSG_ERROR([xerces-includes not found. Specify path with option --with-xerces-includes=DIR.])])
else
    CPPFLAGS="-I$with_xerces_includes"
    export CPPFLAGS
    AC_CHECK_HEADER([xercesc/util/XercesVersion.hpp], [AM_CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"],
                    [AC_MSG_ERROR([xerces-includes not found in "$with_xerces_includes".])])
fi
CPPFLAGS=$save_cppflags

dnl - - - - - - - - - - - - - - - - - - - - - - -
dnl  ... for proj and gdal
AC_ARG_WITH([proj-gdal], [AS_HELP_STRING([--with-proj-gdal=DIR],[where PROJ and GDAL are installed (libraries in DIR/lib, headers in DIR/include).])])
if test x"$with_proj_gdal" != xno; then
if test x"$with_proj_gdal" != x; then
   if test x"$with_proj_libraries" = x; then
      with_proj_libraries=$with_proj_gdal/lib
   fi
   if test x"$with_proj_includes" = x; then
      with_proj_includes=$with_proj_gdal/include
   fi
   if test x"$with_gdal_libraries" = x; then
      with_gdal_libraries=$with_proj_gdal/lib
   fi
   if test x"$with_gdal_includes" = x; then
      with_gdal_includes=$with_proj_gdal/include
   fi
fi

dnl  ... for proj.4
dnl   ... for libs
AC_ARG_WITH([proj-libraries], [AS_HELP_STRING([--with-proj-libraries=DIR],[where the PROJ library is installed (overrides previous settings).])])
if test x"$with_proj_libraries" = x; then
   AC_CHECK_LIB([proj], [main], [PROJ_LDFLAGS="-lproj"],
                [AC_MSG_WARN([proj-lib not found. Specify path with option --with-proj-libraries=DIR.])])
else
   save_ldflags=$LDFLAGS
   LDFLAGS="-L$with_proj_libraries"
   export LDFLAGS
   AC_CHECK_LIB([proj], [main], [PROJ_LDFLAGS="$LDFLAGS -lproj"],
                [AC_MSG_ERROR([proj-lib not found in "$with_proj_libraries".])])
   LDFLAGS=$save_ldflags
fi
AC_SUBST(PROJ_LDFLAGS)

dnl   ... for includes
AC_ARG_WITH([proj-includes], [AS_HELP_STRING([--with-proj-includes=DIR],[where the PROJ includes are (overrides previous settings).])])
if test x"$with_proj_includes" = x; then
   AC_CHECK_HEADER([proj_api.h], [with_proj_includes=yes],
                   [AC_MSG_WARN([proj-includes not found. Specify path with option --with-proj-includes=DIR.])])
else
   save_cppflags=$CPPFLAGS
   CPPFLAGS="-I$with_proj_includes"
   export CPPFLAGS
   AC_CHECK_HEADER([proj_api.h], [AM_CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"],
                   [AC_MSG_ERROR([proj-includes not found in "$with_proj_includes".])])
   CPPFLAGS=$save_cppflags
fi
fi
if test x"$with_proj_includes" != x && test x"$PROJ_LDFLAGS" != x; then
   AC_DEFINE([HAVE_PROJ], [1], [defined if PROJ is available])
   ac_enabled="$ac_enabled PROJ"
else
   ac_disabled="$ac_disabled PROJ"
fi


dnl - - - - - - - - - - - - - - - - - - - - - - -
dnl  ... for gdal
AC_ARG_WITH([gdal-config], 
            [AS_HELP_STRING([--with-gdal-config=FILE], [specify an alternative gdal-config file])], 
            [GDAL_CONFIG="$withval"], [GDAL_CONFIG=""])
if test x"$with_proj_gdal" != xno && test x"$with_gdal_config" != xno; then
    if test -z $GDAL_CONFIG; then
        AC_PATH_PROG([GDAL_CONFIG], [gdal-config])
        if test -z $GDAL_CONFIG; then
            AC_MSG_WARN([could not find gdal-config from libgdal within the current path. Specify path with option --with-gdal-config.])
        fi
    else
        if test -f $GDAL_CONFIG; then
            AC_MSG_RESULT([Using user-specified gdal-config file: $GDAL_CONFIG])
        else
            AC_MSG_ERROR([the user-specified gdal-config file $GDAL_CONFIG does not exist])
        fi
    fi

    if test -z $GDAL_CONFIG; then 
        ac_disabled="$ac_disabled GDAL"
    else
        GDAL_CFLAGS="`$GDAL_CONFIG --cflags`"
        GDAL_LDFLAGS="`$GDAL_CONFIG --libs`"
        AC_SUBST([GDAL_LDFLAGS])

        save_cppflags=$CPPFLAGS
        CPPFLAGS="$GDAL_CFLAGS"
        export CPPFLAGS
        AC_CHECK_HEADER([ogr_api.h], [AM_CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"],
                        [AC_MSG_ERROR([gdal-includes not found.])])
        CPPFLAGS=$save_cppflags
        AC_DEFINE([HAVE_GDAL], [1], [defined if GDAL is available])
        ac_enabled="$ac_enabled GDAL"
    fi
else
    ac_disabled="$ac_disabled GDAL"
fi


dnl - - - - - - - - - - - - - - - - - - - - - - -
dnl  ... for fox
AC_ARG_WITH([fox-config],
            [AS_HELP_STRING([--with-fox-config=FILE], [specify an alternative fox-config file])],
            [FOX_CONFIG="$withval"], [FOX_CONFIG=""])
if test x"$with_fox_config" != xno; then
    if test -z $FOX_CONFIG; then
        AC_PATH_PROG([FOX_CONFIG], [fox-config])
        if test -z $FOX_CONFIG; then
            AC_MSG_WARN([could not find fox-config from libgdal within the current path. Specify path with option --with-fox-config.])
        fi
    else
        if test -f $FOX_CONFIG; then
            AC_MSG_RESULT([Using user-specified fox-config file: $FOX_CONFIG])
        else
            AC_MSG_ERROR([the user-specified fox-config file $FOX_CONFIG does not exist])
        fi
    fi

    if test -z $FOX_CONFIG; then
        ac_disabled="$ac_disabled GUI"
    else
        FOX_CFLAGS="`$FOX_CONFIG --cflags`"
        FOX_LDFLAGS="`$FOX_CONFIG --libs`"
        AC_SUBST([FOX_LDFLAGS])

        save_cppflags=$CPPFLAGS
        CPPFLAGS="$FOX_CFLAGS"
        export CPPFLAGS
        AC_CHECK_HEADER([fxver.h], [AM_CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"],
                        [AC_MSG_ERROR([fox-includes not found.])])
        CPPFLAGS=$save_cppflags
        ac_enabled="$ac_enabled GUI"
    fi
else
    ac_disabled="$ac_disabled GUI"
fi
AM_CONDITIONAL([WITH_GUI], [test x"$FOX_CONFIG" != x && test x"$with_fox_config" != xno])


dnl - - - - - - - - - - - - - - - - - - - - - - -
dnl  ... for gtest
AC_ARG_WITH([gtest], [AS_HELP_STRING([--with-gtest=DIR],[where googletest is installed (libraries in DIR/lib, headers in DIR/include).])])
if test x"$with_gtest" == x; then
    with_gtest=no
fi
if test x"$with_gtest" != xno; then
    LIB_GTEST="$with_gtest/lib/libgtest.a"
    AC_SUBST(LIB_GTEST)
    AM_CPPFLAGS="-I$with_gtest/include $AM_CPPFLAGS"
fi
AM_CONDITIONAL([WITH_GTEST], [test x"$with_gtest" != xno])
if test x"$with_gtest" != xno; then
    ac_enabled="$ac_enabled UnitTests"
else
    ac_disabled="$ac_disabled UnitTests"
fi


dnl - - - - - - - - - - - - - - - - - - - - - - -
dnl  ... for python
AC_ARG_WITH([python], [AS_HELP_STRING([--with-python],[enable python scripting.])])
if test x"$with_python" == x; then
    with_python=no
fi
if test x"$with_python" != xno; then
    PYTHON_LIBS=`python -c "import distutils.sysconfig; print distutils.sysconfig.get_config_var('BLDLIBRARY')"`
    AC_SUBST(PYTHON_LIBS)
    save_cppflags=$CPPFLAGS
    PYTHON_INCLUDES=`python -c "import distutils.sysconfig; print distutils.sysconfig.get_config_var('INCLUDEPY')"`
    CPPFLAGS="$CPPFLAGS -I$PYTHON_INCLUDES"
    export CPPFLAGS
    AC_CHECK_HEADER([Python.h], [AM_CPPFLAGS="$CPPFLAGS $AM_CPPFLAGS"],
                    [AC_MSG_ERROR([Python.h not found. Please install the devel package.])])
    CPPFLAGS=$save_cppflags
fi
AM_CONDITIONAL([WITH_PYTHON], [test x"$with_python" != xno])
if test x"$with_python" != xno; then
    AC_DEFINE([HAVE_PYTHON], [1], [defined if python is available])
    ac_enabled="$ac_enabled Python"
else
    ac_disabled="$ac_disabled Python"
fi

if test -d src/osgview; then
    AC_CHECK_HEADER([osg/Config], 
                    [AC_DEFINE([HAVE_OSG], [1], [defined if osg is available])
                     OSG_LIBS="-losg -losgGA -losgViewer -losgUtil -losgDB -lOpenThreads" AC_SUBST(OSG_LIBS)
                     ac_enabled="$ac_enabled OSG"],
                    [ac_disabled="$ac_disabled OSG"])
fi

AM_CPPFLAGS="-I$PWD/$srcdir/src $AM_CPPFLAGS"
AC_SUBST(AM_CPPFLAGS)
AC_SUBST(AM_CXXFLAGS)


dnl ---------------------------------------------
dnl Checks proposed by autoscan.
dnl Checks for header files.
AC_FUNC_ALLOCA
AC_HEADER_STDC
AC_CHECK_HEADERS([float.h limits.h malloc.h math.h stddef.h stdlib.h string.h sys/time.h unistd.h wchar.h])

dnl Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_C_CONST
AC_C_INLINE
AC_TYPE_SIZE_T
AC_HEADER_TIME
AC_STRUCT_TM
AC_C_VOLATILE

dnl Checks for library functions.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC
AC_FUNC_SELECT_ARGTYPES
AC_TYPE_SIGNAL
AC_FUNC_STAT
AC_CHECK_FUNCS([floor getcwd gettimeofday memset pow select socket sqrt])


dnl ---------------------------------------------
dnl add here all your Makefiles. These will be created by configure
AC_CONFIG_FILES([
src/Makefile
src/activitygen/Makefile
src/activitygen/activities/Makefile
src/activitygen/city/Makefile
src/foreign/Makefile
src/foreign/eulerspiral/Makefile
src/foreign/gl2ps/Makefile
src/foreign/mersenne/Makefile
src/foreign/nvwa/Makefile
src/foreign/polyfonts/Makefile
src/foreign/rtree/Makefile
src/foreign/tcpip/Makefile
src/gui/Makefile
src/gui/dialogs/Makefile
src/guinetload/Makefile
src/guisim/Makefile
src/microsim/Makefile
src/microsim/actions/Makefile
src/microsim/cfmodels/Makefile
src/microsim/devices/Makefile
src/microsim/logging/Makefile
src/microsim/output/Makefile
src/microsim/traffic_lights/Makefile
src/microsim/trigger/Makefile
src/netbuild/Makefile
src/netgen/Makefile
src/netimport/Makefile
src/netimport/vissim/Makefile
src/netimport/vissim/tempstructs/Makefile
src/netimport/vissim/typeloader/Makefile
src/netload/Makefile
src/netwrite/Makefile
src/od2trips/Makefile
src/polyconvert/Makefile
src/router/Makefile
src/dfrouter/Makefile
src/duarouter/Makefile
src/jtrrouter/Makefile
src/tools/Makefile
src/traci_testclient/Makefile
src/traci-server/Makefile
src/utils/Makefile
src/utils/common/Makefile
src/utils/distribution/Makefile
src/utils/emissions/Makefile
src/utils/foxtools/Makefile
src/utils/geom/Makefile
src/utils/gui/Makefile
src/utils/gui/div/Makefile
src/utils/gui/events/Makefile
src/utils/gui/globjects/Makefile
src/utils/gui/images/Makefile
src/utils/gui/settings/Makefile
src/utils/gui/tracker/Makefile
src/utils/gui/windows/Makefile
src/utils/importio/Makefile
src/utils/iodevices/Makefile
src/utils/options/Makefile
src/utils/shapes/Makefile
src/utils/traci/Makefile
src/utils/xml/Makefile
unittest/Makefile
unittest/src/Makefile
unittest/src/microsim/Makefile
unittest/src/netbuild/Makefile
unittest/src/utils/Makefile
unittest/src/utils/common/Makefile
unittest/src/utils/geom/Makefile
unittest/src/utils/iodevices/Makefile
bin/Makefile
Makefile])
AC_OUTPUT

dnl ---------------------------------------------
dnl Summary

AC_MSG_RESULT()
AC_MSG_RESULT([Optional features summary])
AC_MSG_RESULT([-------------------------])
AC_MSG_RESULT([Enabled:$ac_enabled])
AC_MSG_RESULT([Disabled:$ac_disabled])
