0010*
0020*  Member ......... EXT-HE6
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Category as search field
0070*
0080************************************************************************
0090*
0100DEFINE DATA LOCAL
0110 1 #BASE1 (N2)
0120END-DEFINE
0130*
0140* IF *PAGESIZE GE 42
0150IF *WINDOW-PS GE 42           /* Get pagesize on UNIX
0160  #BASE1 := 30
0170ELSE
0180* IF *PAGESIZE GE 31
0190  IF *WINDOW-PS GE 31         /* Get pagesize on UNIX
0200    #BASE1 := 19
0210  ELSE
0220    #BASE1 := 11
0230  END-IF
0240END-IF
0250*
0260DEFINE WINDOW HELP-MAP
0270  SIZE 10 * 66
0280  BASE #BASE1 / 6
0290  TITLE ' Help for Category Search '
0300*
0310SET KEY
0320  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0330*
0340SET CONTROL 'K00'
0350SET CONTROL 'MB'
0360*
0370INPUT WINDOW = 'HELP-MAP'
0380 / 'Use the asterisk (*) notation on the category search field to' (TU)
0390 / 'list all available categories.' (TU)
0400// 'On the Category Search window, you can search for the'(TU)
0410 / 'required categories and mark a category as a new selection'(TU)
0420 / 'criterion.'(TU)
0430*
0440SET WINDOW OFF
0450SET CONTROL 'M-4'
0460*
0470END
