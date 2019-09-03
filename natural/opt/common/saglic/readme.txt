################################################################################
# Copyright (c) 2005-2016 Software AG, Darmstadt, Germany and/or Software AG USA
# Inc., Reston, VA, USA, and/or its subsidiaries and/or its affiliates
# and/or their licensors.
# Use, reproduction, transfer, publication or disclosure is prohibited except
# as specifically provided for in your License Agreement with Software AG.
#
#  $Id: readme.txt 2650 2016-07-29 08:34:07Z bal $
################################################################################

saglicutil is a utility which will enable you to check your license files without installing any product.
You will only need it to investigate a cpu-based licensing model.

There are several options to use this utility:

1. You may just run info.bat (Windows) or info.sh (Unix) to get the information about your environment

    It does printout the numbers of CPUs and the core-class of your hardware.

    You will need to license the appropriate core-class 
    (this should be mentioned in the PriceUnit tag of your license file)
    and in addition the number of CPUs of your machine 
    (the physical CPUs should match the PriceQuantity tag of your license file)


2. You may run check.bat (Windows) or check.sh (Unix) to test your license key

    It will printout the key content and the data of your machine.

    Then it will check:	the hash-code:       whether your key is valid
                        the expiration date: whether it is expired
                        the os:              whether is for your operating system
                        the cpu-class:       whether it is for the right core-class
                        the number of CPUs:  whether they are exceeded
