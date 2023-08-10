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
       SELECT FIGURE-ARCHIVE
       ASSIGN TO "C:\Users\34636\Documents\COBOL-Crear-archivos\figuras.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE RANDOM
           RECORD KEY IS FIGURE-ID
           ALTERNATE RECORD KEY IS FIGURE-NAME WITH DUPLICATES.

       DATA DIVISION.
       FILE SECTION.
       FD FIGURE-ARCHIVE
       01 FIGURE-ARCHIVE
           05 FIGURE-ID PIC 9(10)
           05 FIGURE-NAME PIC X(10)
           05 FIGURE-WEIGHT PIC X(10)
           05 FIGURE-HIGH PIC X(10)

       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
         MOVE 1234 TO FIGURE-ID.
         READ FIGURE-ARCHIVE KEY IS FIGURE-ID INVALID KEY GO TO ERROR.
         DISPLAY "EL NOMBRE DEL EMPLEADO ES: " FIGURE-NAME.
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
