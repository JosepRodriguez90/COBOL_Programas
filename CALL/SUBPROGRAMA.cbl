      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUBPROGRAMA.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 NUMSUB1 PIC 9(3) VALUE 100.

       LINKAGE SECTION.
       01 PARAM1 PIC 9(5).
       01 PARAM2 PIC 9(5).
       01 PARAM-RESULT PIC 9(7).


       PROCEDURE DIVISION USING PARAM1, PARAM2, PARAM-RESULT.
       MAIN-PROCEDURE.

       DISPLAY "Subprograma - Inicio".

       COMPUTE PARAM-RESULT = PARAM1 + PARAM2 + NUMSUB1.

       DISPLAY "Subprograma - Fin".

       EXIT PROGRAM.
