      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. num-lvls-variables.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 EDAD PIC 999.
           88 JOVEN VALUE 1 THRU 40.   *>El nivell 88 identifica posibles valors que es poden enmagatzema en una variable.
           88 MADURO VALUE 41 THRU 65.
           88 ANCIANO VALUE 66 THRU 100.

       01 VARIABLE-COMPUESTA1.
           02 SUB-VARIABLE1 PIC X(4) VALUE "hola".  *> del nivell 02 al 49 son les sub-variables.
           02 SUB-VARIABLE2 PIC 9(4) VALUE 4000.
           02 FILLER PIC X(15) VALUE "Texto FILLER". *> FILLER es una constante, no puede variar.

       01 VARIABLE-COMPUESTA2.
           05 SUB-VARIABLE3 PIC X VALUE SPACES.
           05 SUB-VARIABLE4 PIC 9 VALUE ZERO.

       77 VARIABLE-SIMPLE PIC 9 VALUE ZERO. *> normalment fica el 77 per no confonde'l amb el 01 de composta.

       PROCEDURE DIVISION.
       MIRA-EDAD.

           DISPLAY "Introduce tu edad: "   *> si fiques un punt noagafara el ACCEPT.
           ACCEPT EDAD.
           IF JOVEN
           DISPLAY "Eres joven.".
           IF MADURO
           DISPLAY "Eres maduro.".
           IF ANCIANO
           DISPLAY "Eres anciano.".

           DISPLAY SUB-VARIABLE1.

       STOP RUN.
       END PROGRAM num-lvls-variables.
