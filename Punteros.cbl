      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MemoryPositionProgram.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X PIC 9(5) VALUE 12345.
       01 Y PIC 9(5) VALUE 12345.
       01 PUNTERO1 USAGE IS POINTER.
       01 PUNTERO2 USAGE IS POINTER.
       01 MEMORY-POSITION PIC S9(18) COMP.

       PROCEDURE DIVISION.

       MOVE ADDRESS OF X TO PUNTERO2.
       MOVE ADDRESS OF Y TO PUNTERO1.
       DISPLAY PUNTERO1.
       DISPLAY PUNTERO2.

       STOP RUN.
