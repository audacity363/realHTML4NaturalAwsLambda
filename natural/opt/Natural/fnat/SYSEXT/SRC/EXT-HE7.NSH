0010*
0020*  Member ......... EXT-HE7
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Keyword as selection and search
0070*                                       field
0080*
0090************************************************************************
0100*
0110DEFINE DATA LOCAL
0120 1 #BASE1 (N2)
0130END-DEFINE
0140*
0150* IF *PAGESIZE GE 42
0160IF *WINDOW-PS GE 42           /* Get pagesize on UNIX
0170  #BASE1 := 29
0180ELSE
0190* IF *PAGESIZE GE 31
0200  IF *WINDOW-PS GE 31         /* Get pagesize on UNIX
0210    #BASE1 := 18
0220  ELSE
0230    #BASE1 := 10
0240  END-IF
0250END-IF
0260*
0270DEFINE WINDOW HELP-MAP
0280  SIZE 11 * 66
0290  BASE #BASE1 / 6
0300  TITLE ' Help for Keyword Selection/Search '
0310*
0320SET KEY
0330  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0340*
0350SET CONTROL 'K00'
0360SET CONTROL 'MB'
0370*
0380INPUT WINDOW = 'HELP-MAP'
0390 / 'If you enter an existing keyword, the list of APIs will'(TU)
0400 / 'be rebuilt with this selection criterion. To remove the' (TU)
0410 / 'selection criterion, clear the keyword field (see also PF2).'(TU)
0420// 'Use the asterisk (*) notation to list all available keywords.' (TU)
0430 / 'On the Keyword Search window, you can search for the required'(TU)
0440 / 'keywords and mark a keyword as a new selection criterion.'(TU)
0450*
0460SET WINDOW OFF
0470SET CONTROL 'M-4'
0480*
0490END
