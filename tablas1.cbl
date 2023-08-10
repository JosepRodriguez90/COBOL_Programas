      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PROGTABL.
      *> ------------------------------------------------------
      *> PROGRAMA QUE CARGA INFORMACION EN UNA TABLA INTERNA
      *> Y DESPUES LA MUESTRA POR PANTALLA (3 ELEMENTOS)
      *> ------------------------------------------------------

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  WS-TABLAS.
           05 WS-EMPLEADOS OCCURS 5 TIMES.
              10 WS-NUMERO        PIC 9(05).
              10 WS-NOMBRE        PIC X(10).
              10 WS-SALARIO       PIC 9(5)V99.
       01 FILLER REDEFINES WS-TABLAS.
           05 WS-TABLAS-SEARCH OCCURS 5 TIMES INDEXED BY I.
              10 WS-NUMERO-SEARCH        PIC 9(05).
              10 WS-NOMBRE-SEARCH        PIC X(10).
              10 WS-SALARIO-SEARCH       PIC 9(5)V99.

       01 WS-NOMBRE-FINAL        PIC X(35).
       01 EMPLEADO-SEARCH  PIC X(35).
       01 WS-AREAS.
           05 C          PIC 9(02).
       01 CNT2 PIC 9(35).

       PROCEDURE DIVISION.
       010-RAIZ.
           PERFORM 020-CARGA-TABLA THRU 020-FIN
                   VARYING C FROM 1 BY 1
                   UNTIL C GREATER 3

           PERFORM 025-BUSCAR-TABLA THRU 025-FIN

           DISPLAY SPACE
           DISPLAY "TODOS LOS DATOS: "

           PERFORM 030-VACIA-TABLA THRU 030-FIN
                   VARYING C FROM 1 BY 1
                   UNTIL C GREATER 3

           STOP RUN.

       020-CARGA-TABLA.
           DISPLAY "NUMERO: "
           ACCEPT WS-NUMERO (C)
           DISPLAY "NOMBRE: "
           ACCEPT WS-NOMBRE (C)
           DISPLAY "SALARIO: "
           ACCEPT WS-SALARIO (C).
       020-FIN.  EXIT.



       025-BUSCAR-TABLA.
           DISPLAY "INSERTE EL NOMBRE DEL EMPLEADO A BUSCAR: "
           ACCEPT EMPLEADO-SEARCH.

           SET I TO 1
           SEARCH WS-TABLAS-SEARCH AT END DISPLAY
           "EMPLEADO NO ENCONTRADO."
               WHEN WS-NOMBRE-SEARCH(I) EQUAL EMPLEADO-SEARCH
               DISPLAY
           "EL SALARIO DE " WS-NOMBRE-SEARCH(I)
           WS-SALARIO-SEARCH(I) " Euros"
           END-SEARCH.
       025-FIN. EXIT.



       030-VACIA-TABLA.
           DISPLAY "NUMERO: "  WS-NUMERO (C)
           DISPLAY "NOMBRE: "  WS-NOMBRE (C)
           DISPLAY "SALARIO: " WS-SALARIO (C)" Euros."
           DISPLAY " ".
       030-FIN.  EXIT.
