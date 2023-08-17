      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FECHA-ACTUAL.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-CURRENT-DATE-DATA.
           05 WS-CURRENT-DATE.
               10 WS-CURRENT-YEAR    PIC 9(4).
               10 WS-CURRENT-MONTH   PIC 9(2).
               10 WS-CURRENT-DAY     PIC 9(2).
           05 WS-CURRENT-TIME.
               10 WS-CURRENT-HOUR    PIC 9(2).
               10 WS-CURRENT-MINUTE  PIC 9(2).
               10 WS-CURRENT-SECOND  PIC 9(2).
               10 WS-CURRENT-MSEC    PIC 9(2).
           05 WS-DIFF-GMT          PIC S9(4).

       LINKAGE SECTION.
       01 WS-FECHA PIC X(21).

       PROCEDURE DIVISION USING WS-FECHA.
       MAIN-PROCEDURE.
            MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA

           STRING WS-CURRENT-DAY"/"WS-CURRENT-MONTH"/"WS-CURRENT-YEAR
            " "WS-CURRENT-HOUR":"WS-CURRENT-MINUTE"' "
            WS-CURRENT-SECOND'"' INTO WS-FECHA
           END-STRING.

            *>DISPLAY WS-FECHA.

       EXIT PROGRAM.
