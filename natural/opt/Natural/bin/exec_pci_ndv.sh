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

# Start Buffer Pool Server

echo " "
echo "Starting up buffer pool at `date`"

cd ${NAT_HOME}/bin/

options="BPID=natbp"
natbpsrv=${NAT_HOME}/bin/natbpsrv	 
if [ -r ${natbpsrv} ]
then
  echo starting natural bufferpool server with the command test
  echo ${natbpsrv} ${options} 
       ${natbpsrv} ${options}
  if [ $? -ne 0 ] 
  then
    echo "Error:NATURAL bufferpool server start failed"
	exit 1
	
  else
    echo NATURAL bufferpool server started
    exit_code=0
  fi
else
  echo "ERROR: ${natbpsrv}: not found or not executable"
  echo "ERROR: NATURAL bufferpool server not started"
  exit 1
fi
	
	#########################################################################
# Adapt NDVPARM.SAG

	cd ${NAT_HOME}/bin/
	./natparm batch parm=natparm export=NATPARM exit
	sed -i "/^UDB/c\UDB = 12" ../tmp/NATPARM.LST
	sed -i "/^WEBIO/c\WEBIO = ON" ../tmp/NATPARM.LST
	sed -i "/^DEBUGGER/c\DEBUGGER = ON" ../tmp/NATPARM.LST
	./natparm batch import=NATPARM save exit
	
	./natparm batch parm=ndvparm export=NDVPARM exit
	sed -i "/^UDB/c\UDB = 12" ../tmp/NDVPARM.LST
	sed -i "/^WEBIO/c\WEBIO = ON" ../tmp/NDVPARM.LST
	sed -i "/^DEBUGGER/c\DEBUGGER = ON" ../tmp/NDVPARM.LST
	./natparm batch import=NDVPARM save exit
	
	
#########################################################################
# Start SYSPCI for NDV

echo
echo "Starting SYSPCI for NDV"
	 
	cd ${NAT_HOME}/bin/
	./natural stack='(SYSPCI PROD NDV FUNC INW; Fin)'
	echo -e '\r'
	
