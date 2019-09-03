0010*
0020*  Member ......... EXT-HE10
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: List all keywords of an API
0070*
0080************************************************************************
0090*
0100DEFINE DATA
0110LOCAL
0120  01 #TITLE (A30)
0130END-DEFINE
0140*
0150DEFINE WINDOW HELP-MAP
0160  SIZE 10 * 66
0170  BASE 05 / 06
0180  TITLE #TITLE
0190*
0200SET KEY
0210  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0220*
0230SET CONTROL 'K00'
0240SET CONTROL 'MB'
0250*
0260#TITLE := ' Help for Keywords '
0270INPUT WINDOW = 'HELP-MAP'
0280   / 'Each API has attached'(TU) 'keywords.' (YEI)
0290     'A keyword can be used as' (TU)
0300   / 'selection criterion to retrieve APIs.'(TU)
0310   / 'Reserved keywords'(YEI) 'start with'(TU) '"+".'(YEI)
0320     'They are used to indicate'(TU)
0330   / 'APIs with interface'(TU) 'versions (+PREVIOUS-VERSION or'(TU)
0340   / '+CURRENT-VERSION) or APIs that are added or modified for the'(TU)
0350   / 'current version (like +MOD-NAT-8.2.1).'(TU)
0360*
0370SET WINDOW OFF
0380SET CONTROL 'M-4'
0390*
0400END
