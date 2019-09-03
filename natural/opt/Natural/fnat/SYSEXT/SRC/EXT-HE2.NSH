0010*
0020*  Member ......... EXT-HE2
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Interface
0070*
0080***********************************************************************
0090*
0100DEFINE WINDOW HELP-MAP
0110  SIZE 13 * 66
0120  BASE 05 / 06
0130  TITLE ' Help for Interface '
0140*
0150SET KEY
0160  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0170*
0180SET CONTROL 'K00'
0190SET CONTROL 'MB'
0200*
0210INPUT WINDOW = 'HELP-MAP'
0220 / 'The name of an' (TU)
0230   'application programming interface (API)'(YEI) 'ends' (TU)
0240 / 'with "N" (or as an exception with "P").'(TU)
0250 / 'The API itself cannot be edited or listed. However, you can' (TU)
0260 / 'read the respective text object and the example program.'(TU)
0270 / 'All APIs that belong to an interface version (previous or'(TU)
0280 / 'current version) are displayed intensified.'(TU)
0290// 'Use the asterisk (*) notation as selection criterion. It must'(TU)
0300 / 'start with "USR" and end with "*".'(TU)
0310*
0320SET WINDOW OFF
0330SET CONTROL 'M-4'
0340*
0350END
