# =================================================================================
#  http://www.gnu.org/software/autoconf-archive/ax_cxx_partial_specialization.html
# =================================================================================
#
# SYNOPSIS
#
#   AX_CXX_PARTIAL_SPECIALIZATION
#
# DESCRIPTION
#
#   If the compiler supports partial specialization, define
#   HAVE_PARTIAL_SPECIALIZATION.
#
# LICENSE
#
#   Copyright (c) 2008 Todd Veldhuizen
#   Copyright (c) 2008 Luc Maisonobe <luc@spaceroots.org>
#
#   Copying and distribution of this file, with or without modification, are
#   permitted in any medium without royalty provided the copyright notice
#   and this notice are preserved. This file is offered as-is, without any
#   warranty.

#serial 6

AU_ALIAS([AC_CXX_PARTIAL_SPECIALIZATION], [AX_CXX_PARTIAL_SPECIALIZATION])
AC_DEFUN([AX_CXX_PARTIAL_SPECIALIZATION],
[AC_CACHE_CHECK(whether the compiler supports partial specialization,
ax_cv_cxx_partial_specialization,
[AC_DIAGNOSE([obsolete],[Instead of using `AC_LANG', `AC_LANG_SAVE', and `AC_LANG_RESTORE',
you should use `AC_LANG_PUSH' and `AC_LANG_POP'.])dnl
AC_LANG_SAVE
 AC_LANG([C++])
 AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
template<class T, int N> class A            { public : enum e { z = 0 }; };
template<int N>          class A<double, N> { public : enum e { z = 1 }; };
template<class T>        class A<T, 2>      { public : enum e { z = 2 }; };
]], [[return (A<int,3>::z == 0) && (A<double,3>::z == 1) && (A<float,2>::z == 2);]])],[ax_cv_cxx_partial_specialization=yes],[ax_cv_cxx_partial_specialization=no])
 AC_LANG_POP([])
])
if test "$ax_cv_cxx_partial_specialization" = yes; then
  AC_DEFINE(HAVE_PARTIAL_SPECIALIZATION,,
            [define if the compiler supports partial specialization])
fi
])
