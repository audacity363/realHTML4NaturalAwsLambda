################################################ (c) Software AG 1993-
# File            : $NAT_HOME/bin/build/Makefile
# Creation date   : 21:42:37 28.08.2018
# Machine         : lingcc4_x64
# NATURAL version : 911F
##########################################################################
#
#  Generate executable NATURAL program from natraw.o,
#  userexits and database drivers.
#

#
#  To install NATURAL with the necessary drivers appropiate to your
#  Database system(s) you have to run this Makefile with some of
#  the following flags.
#
#     make natural {<flags>} 
#
#  Please refer to the section about the specific database system for 
#  further informations about the flags.
#
#  Following Environment Variables are needed for successful linking 
#  of NATURAL
#
#    NAT_HOME   : NATURAL base directory
#
#------------------------------------------------------------------------
#
#  Using ADABAS :
#
#  if you want to use ADABAS with the NATURAL you are generating, you have to
#  specify yes for the ada flag. 
#
#    ada=yes       use dynamic binding of ADABAS
#
#  The following Environment variables must be set :
#
#    ADADIR     : ADABAS base directory
#    ADAVERS    : ADABAS version
#
#------------------------------------------------------------------------
#
#  Using ADABAS ACBX :
#
#  if you want to use ADABAS with extended control block ACBX with the
#  NATURAL you are generating, you have to specify yes for the ada2 flag. 
#
#    ada2=yes      use dynamic binding of ADABAS ACBX
#
#  The following Environment variables must be set during runtime:
#
#    ACLDIR     : ADABAS client directory
#    ACLVERS    : ADABAS client version
#
#------------------------------------------------------------------------
#
#  Using SQL databases with OSX :
#
#  to link the SQL interface (OSX version) to the NATURAL system, 
#  please specify following flag at the command line. This option 
#  is usable only if the SQL interface libraries are accessible
#  at the $NAT_HOME/bin/build directory.
#
#     osx=yes
#
#  The following Environment variables must be set :
#
#    OSXDIR     : OSX base directory
#    OSXVERS    : OSX version
#
#------------------------------------------------------------------------
#
#  Using SYNCSORT :
#
#  to use the external SYNCSORT product, please specify following 
#  flag at the command line.
#  The Syncsort LibPATH (DM-Express) will be used for accessing the library.
#  i.e. sync=/opt/dmexpress-7.15/lib
#  
#     sync=<Synsort LibPATH>
#
#------------------------------------------------------------------------
#
#  Using ASCII :
#
#  To use the former ASCII interface of Natural instead of the new binary
#  interface, you have to link a new nucleus providing this interface.
#  If you need this interface enter the following command line option
#  (additional to your other settings).
#
#     ascii=yes
#
#------------------------------------------------------------------------
#
#  Using SAX2 :
#
#  To use SAX2 you have to link a new nucleus.
#  If you need this enter the following command line option
#  (additional to your other settings).
#
#     sax2=yes
#
#------------------------------------------------------------------------
#
#  Using XSLT :
#
#  To use XSLT you have to link a new nucleus.
#  If you need this enter the following command line option
#  (additional to your other settings).
#
#     xslt=yes
#
#------------------------------------------------------------------------
#
#  Using TAMINO :
#
#  To use TAMINO DB interface you have to link a new nucleus.
#  If you need this enter the following command line option
#  (additional to your other settings). This option will also
#  implicitely use the "sax2=yes" option. Please do not enter
#  the "sax2=yes" option seperately then.
#
#     ins=yes
#
#------------------------------------------------------------------------
#
#  Build Natural shared library :
#
#  Build  shared library libnatural.s? for Natural Native Interface.
#  Non-Natural applications can load this shared library    
#  dynamically and access Natural code through the exported  
#  interface functions.
#  Do not use apx=yes in combination with shlib=yes
#  as interactiv IO is suppressed for shared libraries.
#
#     shlib=yes
#
#------------------------------------------------------------------------
#
#  Using APX :
#
#  To use the nucleus with Applinx, you have to link
#  a special Natural nucleus, containing the Applinx
#  interface.
#
#     apx=yes
#
#------------------------------------------------------------------------
#
#  The result of this make will be an executable 'natural'
#  which will be placed in the current directory
#
#  Use 'make install' for copying the generated 'natural' program
#  to $NAT_HOME/bin. Original 'natural' program will be renamed
#  to 'natural.old'
#
#  Use 'make install shlib=yes' for copying the generated lib%natural%\.s?
#  program to $NAT_HOME/bin.
#  Original lib'natural'.s? program will be renamed
#  to lib'natural.s?.old'
#
##########################################################################
SHELL=/bin/sh
#
# Default Rule for Help text
#
ALL: default_text
#
##########################################################################
#
# This Macros specifies the files containing your user exits.
# This is not required.
# You may specify any .o or .a file containg the modules you need 
#
USEROBJS =

#
##########################################################################
#
# Set the database specific libraries
#
# ADABAS :
# --------
ada=
adaxvers=
LIB_NATADAE  	= $(NAT_HOME)/bin/build/libadae$(adaxvers).a
PATH_ADA_SO     = -Wl,-R/opt/softwareag/AdabasClient/lib:\$$ORIGIN/../../AdabasClient/lib,-R/opt/softwareag/common/lib:\$$ORIGIN/../../common/lib
#
esxxvers=
LIB_NATESXE      = $(NAT_HOME)/bin/build/libesxe$(esxxvers).a
#
# ADABAS ACBX:
# --------
ada2=
ada2xvers=
LIB_NATADA2E  	= $(NAT_HOME)/bin/build/libada2e$(adaxvers).a
#
# OSX :
# -----
osx=
osxxvers=
LIB_NATOSXE	= $(NAT_HOME)/bin/build/libsqle$(osxxvers).a
#
# TAMINO :
# -----
ins=
LIB_NATINSE	= $(NAT_HOME)/bin/build/libinse.a
#
# ASCII :
# -------
#
ascii=
#
# RPC :
# -------
#
rpc=91
LIB_RPC91       = $(NAT_HOME)/bin/build/librpc91.a
#
# SAX2 :
# -------
#
sax2=
LIB_SAX2	= $(NAT_HOME)/bin/build/libsax2.a -Wl,-R/opt/softwareag/Natural/v9110/lib:\$$ORIGIN/../lib -L${NAT_HOME}/lib -lxerces-c-3.1
#
# XSLT :
# -------
#
xslt=
LIB_XSLT	= $(NAT_HOME)/bin/build/libxslt.a -Wl,-R/opt/softwareag/Natural/v9110/lib:\$$ORIGIN/../lib -L${NAT_HOME}/lib -l:libxalan-c.so.111 -lxerces-c-3.1 -l:libxalanMsg.so.111
#
#
# APX :
# ------
#
apx=
#
# SyncSort :
# ----------
#
sync            =
LIB_SYNC	= -lsyncsort
LINK_SYNC       = -Wl,-R$(sync) -L$(sync)
#
##########################################################################
#
# Set some general variables
#
CC	= c++
CFLAGS  = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
LD	= c++
LFLAGS1 = -Wl,-Bsymbolic -pthread -export-dynamic -Wl,-R/opt/softwareag/Natural/v9110/lib:\$$ORIGIN/../lib ${NAT_HOME}/lib/libicuio.so.58 ${NAT_HOME}/lib/libicui18n.so.58 ${NAT_HOME}/lib/libicuuc.so.58 ${NAT_HOME}/lib/libicudata.so.58
LFLAGS2 = -lm -lrt
LFLAGSD = $(shlib:yes=-shared)
LEXT    = $(shlib:yes=.so)
LLIB    = $(shlib:yes=lib)
#
# set name of temporary files used for linking
#
tmpdbexe=.dbexe
tmpdbext=.dbext
tmpsprod=.sprod
tmpintf=.intf
tmprpc=.rpc
#
##########################################################################
#
# Set location of prelinked natural and some libraries
#
NATRAW       = $(NAT_HOME)/bin/natraw.o
LIB_FE       = $(NAT_HOME)/bin/build/libfe.a
LIB_FE_ASCII = $(NAT_HOME)/bin/build/libfe_ascii.a
LIB_OW       = $(NAT_HOME)/bin/build/libow.a
LIB_OW_ASCII = $(NAT_HOME)/bin/build/libow_ascii.a
LIB_NWO      = $(NAT_HOME)/bin/build/libnwo.a
LIB_CHIMERA  = $(NAT_HOME)/bin/build/libchimera.a
LIB_OW_APX   = $(NAT_HOME)/bin/build/libapx.a
LIB_NATVALID = $(NAT_HOME)/bin/build/libnatvalid.a
LIB_STUB   = $(NAT_HOME)/bin/build/libstub.a
LIB_STUBSYNC = $(NAT_HOME)/bin/build/libstubsync.a
PROLIB_LST   = natprolib.lst
#
# Get directory for external libraries from NATURAL.INI file
#
NAT_EXTLIB   = grep NATEXTLIB $(NAT_HOME)/etc/NATURAL.INI|sed 's/ //g'|sed 's/^.*=//'
#
##########################################################################
default_text:
	@echo '============================================================'
	@echo ' NATURAL link script                         (c) SOFTWARE AG'
	@echo '============================================================'
	@echo 'This Makefile is currently executing the default rule for'
	@echo 'giving you some help.'
	@echo ''
	@echo 'Use following command line for creating a new NATURAL in'
	@echo 'current directory:'
	@echo ''
	@echo '  make natural {<flags>}'
	@echo ''
	@echo 'For installation after successful creation call:'
	@echo ''
	@echo '  make install'
	@echo '  make install shlib=yes'
	@echo ''
	@echo 'Following NATURAL interface options {<flags>} are available:'
	@echo ''
	@echo '  ada=yes        link with dynamic ADABAS interface'
	@echo ''
	@echo '  ada2=yes       link with dynamic ADABAS ACBX interface'
	@echo ''
	@echo '  osx=yes        link with SQL interface (OSX)'
	@echo ''
	@echo '  sync=<Syncsort LibPATH>'
	@echo '                 link with SYNCSORT library'
	@echo ''
	@echo '  ascii=yes      link with ASCII interface'
	@echo ''
	@echo "  rpc=91         link with RPC 91 protocol"
	@echo ''
	@echo '  sax2=yes       link with SAX2 interface'
	@echo ''
	@echo '  xslt=yes       link with XSLT interface'
	@echo ''
	@echo '  ins=yes        link with TAMINO interface'
	@echo '                 (not together with sax2=yes)'
	@echo ''
	@echo '  apx=yes        link with Applinx interface'
	@echo ''
	@echo '  shlib=yes      link Natural shared library'
	@echo '                 (libnatural.s?)'
	@echo ''
	@echo 'see top of Makefile for more information'
	@echo '============================================================'
	@echo ''

##########################################################################
#
# Rule to build a new natural
#
natural : db_all $(USEROBJS)
	@echo '---------------------------------------------------------------'
	@echo used db-interfaces:
	@cat $(tmpdbexe) $(tmpdbext)
	@echo '---------------------------------------------------------------'
	@echo used subproducts:
	@cat $(tmpsprod)
	@echo '---------------------------------------------------------------'
	@echo used io-interface:
	@cat $(tmpintf)
	@echo '---------------------------------------------------------------'
	@echo used rpc-protocol:
	@cat $(tmprpc)
	@echo '---------------------------------------------------------------'
	@echo linking:
	$(LD) $(LFLAGSD) $(LFLAGS1)  \
	  $(NATRAW) \
	  `cat $(tmpdbexe) $(tmpdbext) $(tmpsprod) $(tmpintf) $(tmprpc)` \
	  $(LIB_NWO) $(LIB_CHIMERA) $(LIB_NATVALID) $(USEROBJS) \
	  $(LIB_STUB) \
	  $(LFLAGS2) -lc -ldl -o $(LLIB)natural$(LEXT)
	@rm -f $(tmpdbexe) $(tmpdbext) $(tmpsprod) $(tmpintf) $(tmprpc) 
	@echo 'linking complete'

#############################################################################
# dependency rules for DB interfaces
#############################################################################
db_all : db_start db_osx_$(osx) db_ins_$(ins) \
	db_ada_$(ada) db_ada2_$(ada2) db_sync_ db_sax2_$(sax2) \
	db_xslt_$(xslt) db_owintf_$(ascii)__$(apx) db_rpc_$(rpc)

db_start :
	@-rm -f $(tmpdbexe) $(tmpdbext) $(tmpsprod) $(tmpintf) $(tmprpc)
	@-touch $(tmpdbexe) $(tmpdbext) $(tmpsprod) $(tmpintf) $(tmprpc)
	@-touch `$(NAT_EXTLIB)`/$(PROLIB_LST)
	@echo "echo \"`cat \`$(NAT_EXTLIB)\`/$(PROLIB_LST)`\"" | sh >> $(tmpsprod)

db_osx_yes :
	@echo $(LIB_NATOSXE)	>> $(tmpdbexe)

db_osx_ :

db_ins_yes :
	@echo $(LIB_NATINSE)	>> $(tmpdbexe)
	@echo $(LIB_SAX2)	>> $(tmpdbext)

db_ins_ :

db_ada_dyn :
	@echo $(LIB_NATADAE)	>> $(tmpdbexe)
	@echo $(LIB_NATESXE)	>> $(tmpdbexe)
	@echo $(PATH_ADA_SO)    >> $(tmpdbext)

db_ada_yes :
	@echo $(LIB_NATADAE)	>> $(tmpdbexe)
	@echo $(LIB_NATESXE)	>> $(tmpdbexe)
	@echo $(PATH_ADA_SO)    >> $(tmpdbext)

db_ada_ :

db_ada2_yes :
	@echo $(LIB_NATADA2E)	>> $(tmpdbexe)

db_ada2_ :

db_sync_ : $(sync)/dev

$(sync)/dev:
	@echo $(LINK_SYNC)	>> $(tmpdbext)
	@echo $(LIB_SYNC)	>> $(tmpdbext)
	@echo $(LIB_STUBSYNC)	>> $(tmpdbext)

db_owintf___:
	@echo $(LIB_FE)	        >> $(tmpintf)
	@echo $(LIB_OW)	        >> $(tmpintf)

db_owintf_yes__:
	@echo $(LIB_FE_ASCII)	>> $(tmpintf)
	@echo $(LIB_OW_ASCII)	>> $(tmpintf)

db_rpc_91 :
	@echo $(LIB_RPC91)	>> $(tmprpc)

db_sax2_ :

db_sax2_yes :
	@echo $(LIB_SAX2)	>> $(tmpdbext)

db_xslt_ :

db_xslt_yes :
	@echo $(LIB_XSLT)	>> $(tmpdbext)

db_owintf___yes: db_owintf_yes__yes

db_owintf_yes__yes:
	@echo $(LIB_FE_ASCII)	>> $(tmpintf)
	@echo $(LIB_OW_APX)	>> $(tmpintf)

#
# Use the following target to install the executable NATURAL.
# The one in the current directory is NOT removed!
# (call 'make install' at command line for natural.
#  call 'make install shlib=yes' at command line for libnatural.s?.)
#
install:
	if [ -f $(NAT_HOME)/bin/$(LLIB)natural$(LEXT) ] ; then \
	rm -f $(NAT_HOME)/bin/$(LLIB)natural$(LEXT).old ; \
	cp $(NAT_HOME)/bin/$(LLIB)natural$(LEXT) $(NAT_HOME)/bin/$(LLIB)natural$(LEXT).old ; \
	fi
	cp $(LLIB)natural$(LEXT) $(NAT_HOME)/bin/$(LLIB)natural$(LEXT)

#
# Use following target to clean up the current directory.
# (call 'make clean' at command line)
#
clean:
	-rm -f $(LLIB)natural$(LEXT)
	-rm -f *.o

#
