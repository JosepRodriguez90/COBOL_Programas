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

       SELECT PRIMER ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\PRIMER.txt"
       ORGANISATION IS SEQUENTIAL
       ACCESS IS SEQUENTIAL.

       SELECT SEGON ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\SEGON.txt"
       ORGANISATION IS SEQUENTIAL
       ACCESS IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD PRIMER
       RECORD CONTAINS 30 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 NUM1 PIC X(30).


       WORKING-STORAGE SECTION.
       01 NUMERO1 PIC X(30).


       PROCEDURE DIVISION.

       OPEN I-O PRIMER. *> El EXTEND per archius un sol registre no funciona, despres el llegir nomes funciona si no has fet cap salt de linea amb archius de un sol registre, a l'hora d'escriure ja es una altra cosa, perque escrius de la forma que et dona la gana, pero al llegir es diferent.


       READ PRIMER INTO NUMERO1
       DISPLAY NUMERO1

       CLOSE PRIMER.

       END PROGRAM YOUR-PROGRAM-NAME.
