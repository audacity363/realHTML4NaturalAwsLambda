#!/bin/sh
# set -x
#########################################################################
#                                                                       #
# Copyright (C) 2018 Software AG, Darmstadt, Germany and/or             #
# Software AG USA Inc., Reston, VA, USA, and/or its subsidiaries        #
# and/or its affiliates and/or their licensors.                         #
#                                                                       #
# The name Software AG and all Software AG product names are either     #
# trademarks or registered trademarks of Software AG and/or             #
# Software AG USA Inc. and/or its subsidiaries and/or its affiliates    #
# and/or their licensors. Other company and product names mentioned     #
# herein may be trademarks of their respective owners.                  #
#                                                                       #
# Detailed information on trademarks and patents owned by Software AG   #
# and/or its subsidiaries is located at http://softwareag.com/licenses. #
#                                                                       #
#########################################################################



# Do a pre-check if a license file is at the right location 

function pre_check_license {

	echo ""
	echo "function pre_check_license ..."
	if [ -f ${SAG_HOME}/common/conf/nat91.xml ]; then
		echo "License file ${SAG_HOME}/common/conf/nat91.xml found"
	else
		echo "No license file ${SAG_HOME}/common/conf/nat91.xml found"
		echo "Exiting ..."
		exit 1
	fi
	
	if [ -f ${SAG_HOME}/common/conf/ndv91.xml ]; then
		echo "License file ${SAG_HOME}/common/conf/ndv91.xml found"
	else
		echo "No license file ${SAG_HOME}/common/conf/ndv91.xml found"
		echo "Exiting ..."
		exit 1
	fi
}

# Start Buffer Pool Server
function start_bp {
	echo " "
	echo "Starting up buffer pool at `date`"
    echo "NAT_HOME: ${NAT_HOME}"

	cd ${NAT_HOME}/bin/

options="BPID=natbp"
natbpsrv=${NAT_HOME}/bin/natbpsrv	
if [ -r ${natbpsrv} ]
then
  echo starting natural bufferpool server with the command
  echo ${natbpsrv} ${options}
       ${natbpsrv} ${options}
  if [ $? -ne 0 ]
  then
    echo "Error:NATURAL bufferpool server start failed"
  else
    echo NATURAL bufferpool server started
    exit_code=0
  fi
else
  echo "ERROR: ${natbpsrv}: not found or not executable"
  echo "ERROR: NATURAL bufferpool server not started"
fi

}

#
# Entrypoint
#

NAT_HOME=/opt/softwareag/Natural
SAG_HOME=/opt/softwareag

# pre_check_license

# source ACL environment

# Starting buffer pool server
start_bp

# start_ndv


