0010*
0020*  Member ......... EXT-HE5
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Category as selection field
0070*
0080************************************************************************
0090*
0100DEFINE WINDOW HELP-MAP
0110  SIZE 14 * 66
0120  BASE 05 / 06
0130  TITLE ' Help for Category '
0140*
0150SET KEY
0160  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0170*
0180SET CONTROL 'K00'
0190SET CONTROL 'MB'
0200*
0210INPUT WINDOW = 'HELP-MAP'
0220 / 'Each API is assigned to a'(TU) 'category,' (YEI)
0230   'which enables a better' (TU)
0240 / 'classification in groups of APIs.'(TU)
0250// 'A category (or the asterisk (*) notation) can be entered'(TU)
0260 / 'as selection criterion for the list of APIs. To remove the' (TU)
0270 / 'selection criterion, clear the category field (see also'(TU)
0280 / 'PF2).'(TU)
0290// 'To search for all categories, enter "*" in the Category'(TU)
0300 / 'search field at the bottom of the API list.' (TU)
0310*
0320SET WINDOW OFF
0330SET CONTROL 'M-4'
0340*
0350END
