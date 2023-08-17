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
       01 CHECK-GENDER.
           05 GENDER PIC X(1).
               88 MALE VALUE 'M'.
               88 FEMALE VALUE 'F'.
               88 UNIDENTIFIED VALUE 'U'.

       PROCEDURE DIVISION.
       SET MALE TO TRUE.
       EVALUATE GENDER
           WHEN 'M'
               DISPLAY "ES UN HOMBRE"
           WHEN 'F'
               DISPLAY "ES UNA MUJER"
           WHEN 'U'
               DISPLAY "LA PERSONA NO ESTA DEFINIDA"

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
