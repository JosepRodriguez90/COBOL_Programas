      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EJEMPLO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 9(5).
       01 LETRA PIC X(1).
       01 CONTADOR PIC 9(2) VALUE 0.

       PROCEDURE DIVISION.
       INICIO.
       DISPLAY "Introduce un n�mero: ".
       ACCEPT NUMERO.


       IF FUNCTION NUMVAL(NUMERO) = 0 THEN
       DISPLAY "No has introducido un n�mero"
       ELSE
       DISPLAY "Has introducido el n�mero: " NUMERO
       END-IF


       STOP RUN.
       END PROGRAM EJEMPLO.
