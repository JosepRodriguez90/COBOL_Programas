      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EJEMPLO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT PROBA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\PROBAAAAAA.txt".


       DATA DIVISION.

       FILE SECTION.
       FD PROBA
       RECORD CONTAINS 35 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 REGISTRO PIC X9(4).


       WORKING-STORAGE SECTION.
       01 NUMERO-NUMERIC PIC S9(3).
       01 NUMERO-NUMERIC-2 PIC S9(3).
       01 RESULTADO PIC S9(4).
       PROCEDURE DIVISION.

       OPEN OUTPUT PROBA

       DISPLAY "NUMERO1"
       ACCEPT NUMERO-NUMERIC
       DISPLAY "NUMERO2"
       ACCEPT NUMERO-NUMERIC-2


       COMPUTE RESULTADO = NUMERO-NUMERIC - NUMERO-NUMERIC-2.
       DISPLAY "El resultado es: ", RESULTADO.

       WRITE REGISTRO FROM RESULTADO

       DISPLAY REGISTRO

       CLOSE PROBA
       STOP RUN.
