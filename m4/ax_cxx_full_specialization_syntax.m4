# =====================================================================================
#  http://www.gnu.org/software/autoconf-archive/ax_cxx_full_specialization_syntax.html
# =====================================================================================
#
# SYNOPSIS
#
#   AX_CXX_FULL_SPECIALIZATION_SYNTAX
#
# DESCRIPTION
#
#   If the compiler recognizes the full specialization syntax, define
#   HAVE_FULL_SPECIALIZATION_SYNTAX.
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

#serial 8

AU_ALIAS([AC_CXX_FULL_SPECIALIZATION_SYNTAX], [AX_CXX_FULL_SPECIALIZATION_SYNTAX])
AC_DEFUN([AX_CXX_FULL_SPECIALIZATION_SYNTAX],
[AC_CACHE_CHECK(whether the compiler recognizes the full specialization syntax,
[ax_cv_cxx_full_specialization_syntax],
[AC_LANG_PUSH([C++])
 AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
template<class T> class A        { public : int f () const { return 1; } };
template<>        class A<float> { public:  int f () const { return 0; } };]], [[
A<float> a; return a.f();]])],[ax_cv_cxx_full_specialization_syntax=yes],[ax_cv_cxx_full_specialization_syntax=no])
 AC_LANG_POP([])
])
if test "x${ax_cv_cxx_full_specialization_syntax}" = "xyes"; then
  AC_DEFINE([HAVE_FULL_SPECIALIZATION_SYNTAX],[1],
            [Define to 1 if the compiler recognizes the full specialization syntax])
fi
])dnl
