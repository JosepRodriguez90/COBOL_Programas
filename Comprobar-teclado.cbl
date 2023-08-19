      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EJEMPLO.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 9(5).
       01 LETRA PIC X(10).

       PROCEDURE DIVISION.
       INICIO.
       DISPLAY "Introduce un número: ".
       ACCEPT NUMERO.

       DISPLAY NUMERO

       IF NUMERO EQUAL ZEROS
       DISPLAY "No has introducido un número"
       ELSE
       DISPLAY "Has introducido el número: " NUMERO
       END-IF.

       DISPLAY "Introduce texto: ".
       ACCEPT LETRA.



       IF LETRA IS NOT ALPHABETIC
           DISPLAY "No has introducido todo letras"
       ELSE
       DISPLAY "Has introducido el texto: " FUNCTION UPPER-CASE(LETRA)  *> nomes funciona al printar.
       END-IF.


       STOP RUN.
       END PROGRAM EJEMPLO.
