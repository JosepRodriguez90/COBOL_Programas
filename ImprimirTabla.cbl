      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT IMPRIMIRTABLA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\imprimirtabla.txt"
       FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD IMPRIMIRTABLA
       RECORD CONTAINS 40 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 FD-TABLA.
           05 FD-ATAQUE1   PIC X(10).
           05 FD-ATAQUE2   PIC X(10).
           05 FD-ATAQUE3   PIC X(10).
           05 FD-ATAQUE4   PIC X(10).


       WORKING-STORAGE SECTION.
       01 C    PIC 9(1).
       01 SIGLINIA PIC X VALUE X'0A'.
       01 FILE-STATUS PIC 99.
       01 NUMATAQUES PIC 9(3).


       01 WS-TABLA.
           05 WS-ATAQUE OCCURS 1 TO 100 DEPENDING ON NUMATAQUES.
               10 ATAQUE1   PIC X(10).
               10 ATAQUE2   PIC X(10).
               10 ATAQUE3   PIC X(10).
               10 ATAQUE4   PIC X(10).

       PROCEDURE DIVISION.

           00-CONTROL.
               OPEN EXTEND IMPRIMIRTABLA.
               PERFORM 00-INICIO.

               PERFORM 10-CARGAR-TABLA VARYING C FROM 1 BY 1
               UNTIL C GREATER NUMATAQUES.

               PERFORM 20-MOSTRAR-TABLA VARYING C FROM 1 BY 1
               UNTIL C GREATER NUMATAQUES.

               CLOSE IMPRIMIRTABLA.
               STOP RUN.
           00-CONTROL-FIN.
           EXIT.
           *>***********************************************************

           00-INICIO.
               DISPLAY "Introduzca el numero de ataques: "
               ACCEPT NUMATAQUES.
           00-INICIO-END.
           EXIT.


           10-CARGAR-TABLA.
               DISPLAY "Inserte el ataque "C.
               ACCEPT WS-ATAQUE(C).
           10-CARGAR-TABLA-END.
           EXIT.


           20-MOSTRAR-TABLA.
           WRITE FD-TABLA FROM WS-ATAQUE(C) BEFORE ADVANCING PAGE.
           DISPLAY WS-ATAQUE(C).

           20-MOSTRAR-TABLA-END.
           EXIT.


       END PROGRAM YOUR-PROGRAM-NAME.
