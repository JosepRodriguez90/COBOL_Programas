      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM1 PIC 9(5) VALUE 100.
       01 NUM2 PIC 9(5) VALUE 200.
       01 RESULT PIC 9(7) VALUE 0.

       PROCEDURE DIVISION.
           DISPLAY "Programa Principal - Inicio".

               CALL "SUBPROGRAMA" USING NUM1, NUM2, RESULT.

               DISPLAY "El resultado de la suma es: " RESULT.

               DISPLAY "Programa Principal - Fin".
           STOP RUN.
