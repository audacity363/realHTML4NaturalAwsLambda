#!/bin/sh
################################################################################
# Copyright (c) 2005-2016 Software AG, Darmstadt, Germany and/or Software AG USA
# Inc., Reston, VA, USA, and/or its subsidiaries and/or its affiliates
# and/or their licensors.
# Use, reproduction, transfer, publication or disclosure is prohibited except
# as specifically provided for in your License Agreement with Software AG.
#
#  $Id: check.sh 2650 2016-07-29 08:34:07Z bal $
################################################################################

if [ $# -ne 2 ]; then 
  echo "Usage:"  
  echo "  check.sh <licensefile>"  
  exit 1
fi

./saglicutil printlicinfo     ${1}
./saglicutil checkhash        ${1}
./saglicutil checkexpiration  ${1} ProductInfo
./saglicutil checkos          ${1} ProductInfo
./saglicutil checkbucket      ${1} LicenseInfo
./saglicutil checkcpucount    ${1} LicenseInfo

exit 0
