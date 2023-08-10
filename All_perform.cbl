      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 NUMERO PIC 999V9.
       PROCEDURE DIVISION.
       INICIO.
           PERFORM OPERACION 200 TIMES.
           *> O tambe pots fer fins que la variable valgui 100
           *> PERFORM OPERACION UNTIL NUMERO = 100.
           GO TO CONDICION.
       OPERACION.
           *>ADD 1 TO NUMERO. Sino tambe ho pots fer de la siguent manera:
           COMPUTE NUMERO = NUMERO + 0.5
           DISPLAY NUMERO.


       *> Una altra forma de fer-ho:
       CONDICION.
           PERFORM VARYING NUMERO FROM 1 BY 1 UNTIL NUMERO>100
           DISPLAY NUMERO
           END-PERFORM.
           STOP RUN.


       END PROGRAM YOUR-PROGRAM-NAME.
