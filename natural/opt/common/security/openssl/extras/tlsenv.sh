#!/bin/sh
# --------------------------------------------------------------
#
# Environment settings for the Common Libraries for OpenSSL
#
# --------------------------------------------------------------
# Copyright (c) 2017-2018 Software AG, Darmstadt, Germany and/or
# Software AG USA Inc., Reston, VA, USA, and/or its subsidiaries and/or
# its affiliates and/or their licensors.
#
# Use, reproduction, transfer, publication or disclosure is prohibited except
# as specifically provided for in your License Agreement with Software AG.
# --------------------------------------------------------------
# If the environment variable TLSDIR is set ensure it points to
# the root of the installation directory.
#
# Alternatively review the setup below before using this script.
#
# Then source this script in a Bourne compatible shell to
# include the libraries in the current environment's
# search paths, e.g. like:
# $> . /path/to/common/security/openssl/extras/tlsenv.sh
#
# Set the environment variable SAGENV_VERBOSE to any non-empty value
# in order to get verbose output while the script executes.
# --------------------------------------------------------------

#set -x

SSLPRINTF ()
{
  [ -z "${SAGENV_VERBOSE:-}" ] || printf "$@"
}

SSLPRINTF "[SSX_TLSENV] Setting up environment for "
SSLPRINTF "Common Libraries for OpenSSL ...\n"

if [ -z "${TLSDIR:-}" ]; then
  TLSDIR="/home/EUR/hkk/Suite.10.3.1029/common/security/openssl"
  export TLSDIR
fi
SSLPRINTF "[SSX_TLSENV] \$TLSDIR=${TLSDIR}\n"

# The actual path to the default OpenSSL configuration file.
OPENSSL_CONF="${OPENSSL_CONF:-${TLSDIR}/openssl.cnf}"
export OPENSSL_CONF
SSLPRINTF "[SSX_TLSENV] \$OPENSSL_CONF=${OPENSSL_CONF}\n"

_OS=`uname`

case "${_OS:-unkown}" in
  AIX)
    if [ -z "${LIBPATH:-}" -o -n "${LIBPATH##*${TLSDIR}/lib*}" ]; then
      LIBPATH="${TLSDIR}/lib${LIBPATH:+:}${LIBPATH:-}"
      export LIBPATH
    fi
    SSLPRINTF "[SSX_TLSENV] \$LIBPATH=${LIBPATH:-}\n"
    ;;
  Darwin)
    if [ -z "${DYLD_LIBRARY_PATH:-}" -o -n "${DYLD_LIBRARY_PATH##*${TLSDIR}/lib*}" ]; then
      DYLD_LIBRARY_PATH="${TLSDIR}/lib:${TLSDIR}/lib/engines${DYLD_LIBRARY_PATH:+:}${DYLD_LIBRARY_PATH:-}"
      export DYLD_LIBRARY_PATH
    fi
    SSLPRINTF "[SSX_TLSENV] \$DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH:-}\n"
    ;;
  HP-UX)
    if [ -z "${SHLIB_PATH:-}" -o -n "${SHLIB_PATH##*${TLSDIR}/lib*}" ]; then
      SHLIB_PATH="${TLSDIR}/lib${SHLIB_PATH:+:}${SHLIB_PATH:-}"
      export SHLIB_PATH
    fi
    SSLPRINTF "[SSX_TLSENV] \$SHLIB_PATH=${SHLIB_PATH:-}\n"
    ;;
  SunOS)
    if [ -z "${LD_LIBRARY_PATH:-}" ]; then
      LD_LIBRARY_PATH="${TLSDIR}/lib"
      export LD_LIBRARY_PATH
    elif ( echo "${LD_LIBRARY_PATH}" | grep "${TLSDIR}/lib" > /dev/null ); then
      # almost empty body, to avoid issues with POSIX incomplete sh on Solaris
      true
    else
      LD_LIBRARY_PATH="${TLSDIR}/lib:${LD_LIBRARY_PATH}"
      export LD_LIBRARY_PATH
    fi
    SSLPRINTF "[SSX_TLSENV] \$LD_LIBRARY_PATH=${LD_LIBRARY_PATH}\n"
    ;;
  *)
    if [ -z "${LD_LIBRARY_PATH:-}" -o -n "${LD_LIBRARY_PATH##*${TLSDIR}/lib*}" ]; then
      LD_LIBRARY_PATH="${TLSDIR}/lib${LD_LIBRARY_PATH:+:}${LD_LIBRARY_PATH:-}"
      export LD_LIBRARY_PATH
    fi
    SSLPRINTF "[SSX_TLSENV] \$LD_LIBRARY_PATH=${LD_LIBRARY_PATH:-}\n"
    ;;
esac

case "${_OS:-unknown}" in
  SunOS)
    if ( echo "${PATH:-}" | grep "${TLSDIR}/bin" > /dev/null ); then
      # almost empty body, to avoid issues with POSIX incomplete sh on Solaris
      true
    else
      PATH="${TLSDIR}/bin${PATH:+:}${PATH:-}"
      export PATH
    fi
    ;;
  *)
    if [ -n "${PATH##*${TLSDIR}/bin*}" ]; then
      PATH="${TLSDIR}/bin${PATH:+:}${PATH:-}"
      export PATH
    fi
    ;;
esac
SSLPRINTF "[SSX_TLSENV] \$PATH=${PATH:-}\n"
SSLPRINTF "[SSX_TLSENV] Finished.\n"
