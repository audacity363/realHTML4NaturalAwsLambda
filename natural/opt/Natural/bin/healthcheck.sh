#!/bin/sh
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


cd ${NAT_HOME}/bin

# simple ping to check if broker answers in reasonable time
#
# ?????????????????????????????????????????????????????????

ret=$?

case $ret in
	0)
		echo "NaturalDevelopmentServer check finished successfully"
		;;

	*)
		echo "NaturalDevelopmentServer not running correctly (state=$ret)"
		;;
esac

exit $ret

