      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       DATA DIVISION.
          WORKING-STORAGE SECTION.
           01 WS-STRING PIC A(30).
           01 WS-STR1 PIC A(30) VALUE 'Tutorials point'.

       PROCEDURE DIVISION.
         STRING WS-STR1 DELIMITED BY SPACE
           INTO WS-STRING
       END-STRING.

           DISPLAY 'WS-STRING : 'WS-STR1.
           DISPLAY 'WS-STRING : 'WS-STRING.


       STOP RUN.
