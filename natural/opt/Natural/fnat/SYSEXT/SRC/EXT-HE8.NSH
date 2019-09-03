0010*
0020*  Member ......... EXT-HE8
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Search window for
0070*                                       keywords/categories
0080*
0090************************************************************************
0100*
0110DEFINE DATA
0120PARAMETER
0130  01 TYPE   (A1)
0140LOCAL
0150  01 #TITLE (A30)
0160END-DEFINE
0170*
0180DEFINE WINDOW HELP-MAP
0190  SIZE 08 * 66
0200  BASE 05 / 06
0210  TITLE #TITLE
0220*
0230SET KEY
0240  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0250*
0260SET CONTROL 'K00'
0270SET CONTROL 'MB'
0280*
0290IF TYPE = 'K'
0300  #TITLE := ' Help for Keyword '
0310  INPUT WINDOW = 'HELP-MAP'
0320   / 'Use the asterisk (*) notation to list all required' (TU)
0330     'keywords.' (TU)
0340   / 'Mark a keyword with any character to select it as a new'(TU)
0350   / 'selection criterion.'(TU)
0360ELSE
0370  #TITLE := ' Help for Category '
0380  INPUT WINDOW = 'HELP-MAP'
0390   / 'Use the asterisk (*) notation to list all required' (TU)
0400   / 'categories.'(TU)
0410   / 'Mark a category with any character to select it as a new'(TU)
0420   / 'selection criterion.'(TU)
0430END-IF
0440*
0450SET WINDOW OFF
0460SET CONTROL 'M-4'
0470*
0480END
