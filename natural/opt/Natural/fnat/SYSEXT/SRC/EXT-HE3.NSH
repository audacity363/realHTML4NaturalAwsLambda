0010*
0020*  Member ......... EXT-HE3
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Description
0070*
0080***********************************************************************
0090*
0100DEFINE WINDOW HELP-MAP
0110  SIZE 12 * 66
0120  BASE 05 / 06
0130  TITLE ' Help for Description '
0140*
0150SET KEY
0160  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0170*
0180SET CONTROL 'K00'
0190SET CONTROL 'MB'
0200*
0210INPUT WINDOW = 'HELP-MAP'
0220 / 'The'(TU)  'description'(YEI) 'serves as a menu header' (TU)
0230   'of the API.' (TU)
0240 / 'The description is part of the API"s'(TU)
0250   'text object'(YEI) 'which'(TU)
0260 / 'describes parameters, usage and features of the API.'(TU)
0270 / 'The name of the text object ends with "T".' (TU)
0280// 'Enter any string as a new selection criterion.' (TU)
0290 / 'To remove the selection criterion, clear the description'(TU)
0300 / 'field (see also PF2).'(TU)
0310*
0320SET WINDOW OFF
0330SET CONTROL 'M-4'
0340*
0350END
