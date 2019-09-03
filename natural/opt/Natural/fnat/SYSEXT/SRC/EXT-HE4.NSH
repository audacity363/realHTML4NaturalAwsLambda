0010*
0020*  Member ......... EXT-HE4
0030*  Type ........... Helproutine
0040*  Library ........ SYSEXTC
0050*
0060*  Function ....... SYSEXT Online Help: Product code
0070*
0080************************************************************************
0090*
0100DEFINE WINDOW HELP-MAP
0110  SIZE 13 * 66
0120  BASE 05 / 06
0130  TITLE ' Help for Product Code '
0140*
0150SET KEY
0160  TREQ PF1 PF2 PF3 PF4 PF5 PF6 PF7 PF8 PF9 PF10 PF11 PF12
0170*
0180SET CONTROL 'K00'
0190SET CONTROL 'MB'
0200*
0210INPUT WINDOW = 'HELP-MAP'
0220 / 'Each API is classified according to a'(TU) 'product code.'(YEI)
0230 / 'A product code can refer to Natural (NAT) or a Natural'(TU)
0240   'add-on'(TU)
0250 / 'product (such as PRD or RPC). Product codes other than NAT' (TU)
0260 / 'are displayed intensified.' (TU)
0270// 'A product code (or the asterisk (*) notation) can be entered'(TU)
0280 / 'as selection criterion for the list of APIs. To remove the' (TU)
0290 / 'selection criterion, clear the product code field (see also'(TU)
0300 / 'PF2).' (TU)
0310*
0320SET WINDOW OFF
0330SET CONTROL 'M-4'
0340*
0350END
