0010*
0020*  Member ......... EXT-HE9
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Mark on search window
0070*
0080************************************************************************
0090*
0100DEFINE DATA
0110PARAMETER
0120  01 TYPE   (A1)
0130LOCAL
0140  01 #TITLE (A30)
0150END-DEFINE
0160*
0170DEFINE WINDOW HELP-MAP
0180  SIZE 08 * 66
0190  BASE 05 / 06
0200  TITLE #TITLE
0210*
0220SET KEY
0230  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0240*
0250SET CONTROL 'K00'
0260SET CONTROL 'MB'
0270*
0280#TITLE := ' Help for Mark '
0290IF TYPE = 'K'
0300  INPUT WINDOW = 'HELP-MAP'
0310   / 'Mark a keyword with any character to select it as a new ' (TU)
0320   / 'selection criterion.' (TU)
0330ELSE
0340  INPUT WINDOW = 'HELP-MAP'
0350   / 'Mark a category with any character to select it as a new' (TU)
0360   / 'selection criterion.' (TU)
0370END-IF
0380*
0390SET WINDOW OFF
0400SET CONTROL 'M-4'
0410*
0420END
