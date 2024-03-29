0010* ----------------------------------------------------------------------
0020* CLASS  Natural Web Interface - Demo Application
0030*
0040*        D3SHOW
0050*
0060* DESCRIPTION
0070*               GENERATE HTML-PAGE FOR SHOWING A PERSON
0080*
0090* AUTHOR        SAG   11.04.97
0100*
0110* Version       8.3
0120*
0130* Copyright (c) 1997-2016 Software AG, Germany.  All rights reserved.
0140*
0150* HISTORY
0160* USER    DATE       REASON
0170* ------+----------+----------------------------------------------
0180*       ! --.--.-- !
0190* ------+----------+----------------------------------------------
0200*
0210* ------ PARAMETER -----------------------------------------------
0220DEFINE DATA
0230PARAMETER USING D3-PARM
0240LOCAL USING W3CONST
0250LOCAL
02601 W3URL           (A250)
02701 W3VALUE         (A250)
02801 W3MAX           (I004)
0290*
03001 #OUT-P-NO         (A008)
03101 #OUT-P-NAME       (A020)
03201 #OUT-P-FIRST-NAME (A020)
03301 #OUT-P-BIRTH      (A010)
03401 #OUT-P-SEX        (A001)
03501 #OUT-P-DEPT       (A006)
03601 #OUT-P-CITY       (A020)
03701 #OUT-P-AREA-CODE  (A006)
03801 #OUT-P-ZIP        (A010)
03901 #OUT-P-COUNTRY    (A003)
04001 #OUT-P-PHONE      (A015)
04101 #OUT-P-PICTURE    (A250)
0420END-DEFINE
0430*
0440DEFINE SUBROUTINE D3SHOW
0450*
0460ON ERROR
0470##W3ERROR.SUBROUTINE := *PROGRAM
0480PERFORM W3ERROR ##W3ERROR
0490ESCAPE ROUTINE
0500END-ERROR
0510*
0520IF #DEMO-PARM.#PERSON EQ " " THEN
0530  #DEMO-PARM.#MSG := 'Please Select a employee!'
0540  INCLUDE D3-BACK
0550END-IF
0560*
0570* #move left #demo-parm.#person to #OUT-P-NO
0580*
0590#DEMO-PARM.#TODO   := "SHOW"
0600*
0610PERFORM D3-START #DEMO-MENU #DEMO-PARM
0620*
0630PERFORM D3-HPERS #DEMO-MENU #DEMO-PARM
0640*
0650CALLNAT "D3EMSHOW"  #DEMO-PARM.#PERSON #OUT-P-NAME
0660  #OUT-P-FIRST-NAME #OUT-P-BIRTH #OUT-P-SEX
0670  #OUT-P-DEPT #OUT-P-CITY #OUT-P-AREA-CODE
0680  #OUT-P-ZIP #OUT-P-COUNTRY #OUT-P-PHONE
0690  #OUT-P-PICTURE #DEMO-PARM.#MSG
0700*
0710COMPRESS #DEMO-PARM.#GIF #OUT-P-PICTURE INTO W3URL LEAVING NO
0720PERFORM H3-IMAGE  W3URL 'Sex' 248 111 "L"
0730PERFORM W3TEXTDYNAMIC ##HTTP_NEWLINE
0740*
0750PERFORM W3TEXTLINEDYNAMIC "<BR><CENTER><TABLE>"
0760PERFORM W3TEXTDYNAMIC '<TR><TD><B>Personel-ID:</B></TD><TD>'
0770PERFORM W3HTML  #DEMO-PARM.#PERSON
0780PERFORM W3TEXTLINEDYNAMIC '</TD><TR><TD>&nbsp;</TD></TR>'
0790*
0800PERFORM W3TEXTDYNAMIC '<TR><TD><B>Name:</B></TD><TD>'
0810PERFORM W3HTML  #OUT-P-NAME
0820PERFORM W3TEXTDYNAMIC '</TD><TD><B>Sex:</B></TD><TD>'
0830PERFORM W3HTML #OUT-P-SEX
0840PERFORM W3TEXTLINEDYNAMIC "</TD></TR>"
0850*
0860PERFORM W3TEXTDYNAMIC '<TR><TD><B>First-Name:</B></TD><TD>'
0870PERFORM W3HTML #OUT-P-FIRST-NAME
0880PERFORM W3TEXTLINEDYNAMIC '</TD><TD><B>Birth:</B></TD><TD>'
0890PERFORM W3HTML #OUT-P-BIRTH
0900PERFORM W3TEXTLINEDYNAMIC "</TD></TR>"
0910*
0920PERFORM W3TEXTLINEDYNAMIC '<TR><TD>&nbsp;</TD></TR>'
0930*
0940PERFORM W3TEXTLINEDYNAMIC '<TR><TD><B>Country:</B></TD><TD>'
0950PERFORM W3HTML #OUT-P-COUNTRY
0960PERFORM W3TEXTLINEDYNAMIC '</TD><TD><B>Department:</B></TD><TD>'
0970PERFORM W3HTML #OUT-P-DEPT
0980PERFORM W3TEXTLINEDYNAMIC "</TD></TR>"
0990*
1000PERFORM W3TEXTLINEDYNAMIC '<TR><TD><B>Zip:</B></TD><TD>'
1010PERFORM W3HTML #OUT-P-ZIP
1020PERFORM W3TEXTLINEDYNAMIC '</TD><TD><B>Area-Code:</B></TD><TD>'
1030PERFORM W3HTML #OUT-P-AREA-CODE
1040PERFORM W3TEXTLINEDYNAMIC "</TD></TR>"
1050*
1060PERFORM W3TEXTLINEDYNAMIC '<TR><TD><B>City:</B></TD><TD>'
1070PERFORM W3HTML #OUT-P-CITY
1080PERFORM W3TEXTLINEDYNAMIC '</TD><TD><B>Phone:</B></TD><TD>'
1090PERFORM W3HTML #OUT-P-PHONE
1100PERFORM W3TEXTLINEDYNAMIC "</TD></TR>"
1110*
1120PERFORM W3TEXTLINEDYNAMIC "</TABLE></CENTER><BR>"
1130*
1140#DEMO-MENU.#ME := "T"
1150#DEMO-MENU.#CH := "T"
1160#DEMO-MENU.#DE := "T"
1170*
1180PERFORM D3-BACKB #DEMO-MENU #DEMO-PARM
1190PERFORM D3-END #DEMO-MENU #DEMO-PARM
1200END-SUBROUTINE
1210END
