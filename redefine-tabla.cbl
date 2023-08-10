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
       01 WS-TABLAS.
           05 WS-TAB-MES PIC X(36) VALUE
           "ENEFEBMARABRMAYJUNJULAGOSEPOCTNOVDIC".
           05 FILLER REDEFINES WS-TAB-MES OCCURS 12 TIMES.
               10 WS-MES PIC X(03).
       01 C PIC 9(2).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       PERFORM VARYING C FROM 1 BY 1 UNTIL C > 12
       DISPLAY WS-MES(C)
       END-PERFORM.

       STOP RUN.


       *>***********TAMBE ES POT FER DE LA SIGUENT MANERA: ***********


       PERFORM MESES VARYING C FROM 1 BY 1 UNTIL C > 12
       STOP RUN.
       *> MAI EL STOP RUN SOTA LA RUTINA DE MESES, SINO NO SAP QUAN ES EL END-PERFORM Y CONTINUA PARA AL STOP RUN SENSE MOSTRAR TOT.

       MESES.
       DISPLAY WS-MES(C).

       END PROGRAM YOUR-PROGRAM-NAME.
