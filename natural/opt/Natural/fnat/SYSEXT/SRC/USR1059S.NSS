0010/* output error message for NATURAL/Reporter interface sample programs
0020/* dependent on passed return code
0030DEFINE DATA
0040PARAMETER
0050   1 RETCODE     (I4)
0060   1 REINFLG     (L)
0070LOCAL
0080   USING USR1059L
0090LOCAL
0100   1 PART1       (A78)    CONST <'Natural/Reporter Interface Error:'>
0110   1 PART2       (A78)
0120   1 ERRORMSG    (A78)
0130END-DEFINE
0140/*
0150DEFINE SUBROUTINE SHOW-ERR
0160/* output error message dependent on input parameter
0170DECIDE ON FIRST VALUE OF RETCODE
0180   VALUE ERROR-FILE-NOT-FOUND
0190      MOVE 'File not found' TO PART2
0200   VALUE ERROR-PROC-NOT-FOUND
0210      MOVE 'Exported function not found' TO PART2
0220   VALUE ERROR-NOT-INITIALIZED
0230      MOVE 'Interface not initialized' TO PART2
0240   VALUE ERROR-TOO-MANY-ACTIVE-REPORTS
0250      MOVE 'Too many active reports' TO PART2
0260   VALUE ERROR-GENERAL-ERROR
0270      MOVE 'Non-specific error' TO PART2
0280   VALUE ERROR-REPORT-NOT-FOUND
0290      MOVE 'Report not found' TO PART2
0300   VALUE ERROR-UNSUPPORTED-MACHINE-CLASS
0310      COMPRESS 'Machine class'
0320      *MACHINE-CLASS
0330      'is not supported'
0340      INTO PART2
0350   VALUE 0    /* no error
0360      IGNORE
0370   NONE
0380      COMPRESS 'Unrecognized error' RETCODE INTO PART2
0390END-DECIDE
0400/*
0410IF RETCODE NE 0
0420   COMPRESS PART1 PART2 INTO ERRORMSG
0430   IF REINFLG
0440      REINPUT ERRORMSG
0450   ELSE
0460      INPUT ERRORMSG (AD=O)
0470   END-IF
0480END-IF
0490/*
0500END-SUBROUTINE
0510END
