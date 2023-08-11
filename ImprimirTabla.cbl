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


       01 WS-TABLA.
           05 WS-ATAQUE OCCURS 4 TIMES.
               10 ATAQUE1   PIC X(10).
               10 ATAQUE2   PIC X(10).
               10 ATAQUE3   PIC X(10).
               10 ATAQUE4   PIC X(10).

       01 COPYTAB.
           05 COPYTAB1   PIC X(10).
           05 COPYTAB2   PIC X(10).
           05 COPYTAB3   PIC X(10).
           05 COPYTAB4   PIC X(10).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           00-CONTROL.
               PERFORM 00-ABRIR-ARCHIVO.
               PERFORM 10-CARGAR-TABLA VARYING C FROM 1 BY 1
               UNTIL C GREATER 4.


               PERFORM 20-MOSTRAR-TABLA VARYING C FROM 1 BY 1
               UNTIL C GREATER 4.

               PERFORM 30-IMPRIMIR.

               CLOSE IMPRIMIRTABLA.
               STOP RUN.
           00-CONTROL-FIN.
           EXIT.


           00-ABRIR-ARCHIVO.
               OPEN I-O IMPRIMIRTABLA.

               IF FILE-STATUS ="35"
                   DISPLAY "Archivo no encontrado. Se creara uno nuevo."
                   OPEN OUTPUT IMPRIMIRTABLA
               END-IF.
           00-ABRIR-ARCHIVO-END.
           EXIT.


           10-CARGAR-TABLA.
               DISPLAY "Inserte el ataque "C.
               ACCEPT WS-ATAQUE(C).
           10-CARGAR-TABLA-END.
           EXIT.


           20-MOSTRAR-TABLA.
               EVALUATE C
                   WHEN 1
                   MOVE WS-ATAQUE(C) TO COPYTAB1
                   WHEN 2
                   MOVE WS-ATAQUE(C) TO COPYTAB2
                   WHEN 3
                   MOVE WS-ATAQUE(C) TO COPYTAB3
                   WHEN 4
                   MOVE WS-ATAQUE(C) TO COPYTAB4
               END-EVALUATE.

               DISPLAY WS-ATAQUE(C).

           20-MOSTRAR-TABLA-END.
           EXIT.


           30-IMPRIMIR.
               WRITE FD-TABLA FROM COPYTAB1.
               WRITE FD-TABLA FROM COPYTAB2 AFTER ADVANCING PAGE.
               WRITE FD-TABLA FROM COPYTAB3 AFTER ADVANCING PAGE.
               WRITE FD-TABLA FROM COPYTAB4 AFTER ADVANCING PAGE.
           30-IMPRIMIR-END.


       END PROGRAM YOUR-PROGRAM-NAME.
