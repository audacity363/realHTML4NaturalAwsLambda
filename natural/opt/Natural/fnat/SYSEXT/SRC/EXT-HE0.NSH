0010*
0020*  Member ......... EXT-HE0
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help:  General Help for SYSEXT
0070*
0080************************************************************************
0090*
0100DEFINE DATA LOCAL
0110  01 MAP-TITLE (A30)
0120  01 IX        (I02)
0130END-DEFINE
0140*
0150DEFINE WINDOW HELP-MAP
0160  SIZE 19 * 66
0170  BASE 04 / 06
0180  TITLE MAP-TITLE
0190  CONTROL SCREEN
0200*
0210SET KEY
0220  TREQ        NAMED 'Cont'
0230  PF3         NAMED 'Exit'
0240  PF6         NAMED '--'
0250  PF7         NAMED '-'
0260  PF8         NAMED '+'
0270  PF9         NAMED '++'
0280  PF12        NAMED 'Canc'
0290  PF1 PF2  PF4  PF5  PF10 PF11
0300  PF13 PF14 PF15 PF16 PF17 PF18
0310  PF19 PF20 PF21 PF22 PF23 PF24
0320*
0330FORMAT KD=ON
0340*
0350REPEAT
0360*
0370  ADD 1 TO IX
0380*
0390  DECIDE ON FIRST IX
0400  VALUE 1
0410    MAP-TITLE := ' Help for SYSEXT Utility '
0420    INPUT WINDOW = 'HELP-MAP' ( IP=OFF )
0430    / 'The' (TU) 'SYSEXT utility'(YEI)
0440      'contains a variety of application'(TU)
0450    / 'programmig interfaces (API) together with example programs'(TU)
0460    / 'and their documentation (text objects).'(TU)
0470   // 'The name of an'(TU)  'API'(YEI) 'is'(TU)
0480      'always headed with "USR" followed by a' (TU)
0490    / 'four-digit number and it ends with "N" (or, as an '-
0500      'exception'(TU)
0510    / 'with "P"). An API itself cannot be listed or edited.' (TU)
0520   // 'The corresponding'(TU) 'example program' (YEI)
0530      'ends with "P".'(TU)
0540    / 'It is used to demonstrate the functionality of the API. It'(TU)
0550    / 'can be edited, listed, run or executed.' (TU)
0560   // 'The corresponding'(TU) 'text object' (YEI)
0570      'ends with "T". It describes'(TU)
0580    / 'parameters and usage as well as features such as keywords,'(TU)
0590    / 'category and possibly interface versions.'(TU)
0600      'It can be listed.'(TU)
0610*
0620  VALUE 2
0630    MAP-TITLE := ' Help for SYSEXT Utility '
0640    INPUT WINDOW = 'HELP-MAP'
0650    / 'Each API has attached'(TU) 'keywords.' (YEI)
0660    / 'A keyword can be used as selection criterion to retrieve'(TU)
0670    / 'APIs. The asterisk (*) notation provides a list of all'(TU)
0680    / 'available keywords.'(TU)
0690    / 'Reserved keywords'(YEI)
0700      'are used to indicate APIs with interface'(TU)
0710    / 'versions or APIs that have been added or modified for the'(TU)
0720    / 'current' (TU)
0730      'version. Reserved keywords'(TU) 'start with'(TU) '"+".'(YEI)
0740   // 'Interface versions'(YEI)
0750      'contain APIs with parameters that could'(TU)
0760    / 'not be enhanced for compatibility reasons. So a new API was'(TU)
0770    / 'added with enhanced parameter specifications. This current'(TU)
0780    / 'API is marked with +CURRENT-VERSION, whereas previous APIs' (TU)
0790    / 'are marked with +PREVIOUS-VERSION.'(TU)
0800    / 'APIs with no interface version are unique.' (TU)
0810*
0820  VALUE 3
0830    MAP-TITLE := ' Help for SYSEXT Utility '
0840    INPUT WINDOW = 'HELP-MAP'
0850    / 'Each API has an attached'(TU) 'category.'(YEI)
0860    / 'Categories classify APIs in different groups.'(TU)
0870   // 'A category (or the asterisk (*) notation) can be entered as' (TU)
0880    / 'selection criterion for the list of APIs.' (TU)
0890   // 'In the search field Category (below the list of APIs), the'(TU)
0900    / 'asterisk (*) notation provides a list of all available'(TU)
0910    / 'categories.'(TU)
0920*
0930  VALUE 4
0940    MAP-TITLE := ' Help for SYSEXT Utility '
0950    INPUT WINDOW = 'HELP-MAP'
0960    / 'The following PF keys are defined:'(TU)
0970   // 'PF1  -'(TU) '"Help"'(YEI)
0980      16T          'display context-sensitive help for each field.'(TU)
0990    / 'PF2  -'(TU) '"Reset"'(YEI)
1000      16T          'reset all selection fields.' (TU)
1010    / 'PF3  -'(TU) '"Exit"'(YEI)
1020      16T          'exit the SYSEXT utility/current window.' (TU)
1030    / 'PF4  -'(TU) '"Desc"'(YEI)
1040      16T          'execute a descending sort of the list.' (TU)
1050    / '     -'(TU) '"Asc"'(YEI)
1060      16T          'execute an ascending sort of the list.' (TU)
1070    / 'PF5  -'(TU) '"Curr"'(YEI)
1080      16T          'list the current APIs.' (TU)
1090    / '     -'(TU) '"All"'(YEI)
1100      16T          'list all APIs.' (TU)
1110    / 'PF6  -'(TU) '"--"'(YEI)
1120      16T          'scroll to top.' (TU)
1130    / 'PF7  -'(TU) '"-"'(YEI)
1140      16T          'scroll one page up.' (TU)
1150    / 'PF8  -'(TU) '"+"'(YEI)
1160      16T          'scroll one page down.' (TU)
1170    / 'PF9  -'(TU) '"++"'(YEI)
1180      16T          'scroll to bottom.' (TU)
1190    / 'PF10 -'(TU) '"<"'(YEI)
1200      16T          'shift to first menu.'(TU)
1210    / 'PF11 -'(TU) '">"'(YEI)
1220      16T          'shift to second menu'(TU)
1230                   '(with categories).'(TU)
1240    / 'PF12 -'(TU) '"Canc"'(YEI)
1250      16T          'exit the SYSEXT utility/current window.' (TU)
1260*
1270  VALUE 5
1280    MAP-TITLE := ' Support Information '
1290    INPUT WINDOW = 'HELP-MAP'
1300    / 'The available APIs of SYSEXT should be used for well-defined'(TU)
1310    / 'user applications.'(TU)
1320   // 'All APIs will be supported in future versions of Natural.' (TU)
1330   // 'The list of APIs will be regularly updated and added with'(TU)
1340    / 'new APIs, example programs and text objects. ' (TU)
1350   // 'If an existing API cannot be enhanced because of its'(TU)
1360    / 'parameters, a new API will be created. The involved APIs'(TU)
1370      'will' (TU)
1380    / 'be called interface versions and marked by keywords'(TU)
1390    / '(+PREVIOUS-VERSION, +CURRENT-VERSION).'(TU)
1400*
1410  VALUE 6
1420    MAP-TITLE := ' Direct Command SYSEXT '
1430    INPUT WINDOW = 'HELP-MAP'
1440    / 'The SYSEXT utility can directly be started with' (TU)
1450      'the following'(TU)
1460    / 'parameters:'(TU)
1470   // 'ALL'(YEI)
1480      12T '- List all APIs.'(TU)
1490    / 'or' (TU)
1500    / 'CURRENT'(YEI)
1510      12T '- List current APIs (current version or unique).'(TU)
1520   // 'ASCENDING'(YEI)
1530      12T '- List APIs in ascending order.'(TU)
1540    / 'or' (TU)
1550    / 'DESCENDING'(YEI)
1560      12T '- List APIs in descending order.'(TU)
1570   // 'FIRST'(YEI)
1580      12T '- Display the first menu (with product codes).'(TU)
1590    / 'or' (TU)
1600    / 'SECOND'(YEI)
1610      12T '- Display the second menu (with categories).'(TU)
1620*
1630  NONE IGNORE
1640  END-DECIDE
1650*
1660  DECIDE ON FIRST *PF-KEY
1670  VALUE 'PF3','PF12'
1680    ESCAPE BOTTOM
1690  VALUE 'PF6'
1700    IX := 0
1710  VALUE 'PF7'
1720    IX := IX - 2
1730    IF IX < 0
1740      RESET IX
1750    END-IF
1760  VALUE 'PF8'
1770    IF IX > 5
1780      IX := 5
1790    END-IF
1800  VALUE 'PF9'
1810    IX := 5
1820  VALUE 'ENTR'
1830    IGNORE
1840  NONE
1850    IX := IX - 1
1860  END-DECIDE
1870*
1880  IF IX = 6
1890    ESCAPE BOTTOM
1900  END-IF
1910END-REPEAT
1920*
1930SET WINDOW OFF
1940*
1950END
