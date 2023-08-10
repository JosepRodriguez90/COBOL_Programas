      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUMA.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 NUM1 PIC 9(2).
       01 NUM2 PIC 9(2).
       01 RESULT PIC 9(4).
       01 MASNUM PIC 9(3) VALUE 100.

       PROCEDURE DIVISION.

           DISPLAY "INCERTA NUMERO1: ".
           ACCEPT NUM1.

           DISPLAY "INCERTA EL NUMERO2: ".
           ACCEPT NUM2.

           ADD NUM1 TO NUM2 GIVING RESULT. *>suma NUM1 y NUM2 y ho fica a la variable RESULT.
           *>ADD MASNUM TO RESULT.

           *>MOVE ZERO TO RESULT. fica un 0 a la variable RESULT, es una paraula resrvada.

            DISPLAY RESULT.
            STOP RUN.

       END PROGRAM SUMA.
