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
       01 NUM1 PIC 9(2) VALUE 10.
       01 NUM2 PIC 9(2) VALUE 14.

       01 NUM6 PIC 9(2) VALUE 7.
       01 NUM7 PIC 9(2) VALUE 16.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            IF NUM1 NOT > NUM2
                DISPLAY "NUM1 NO ES MAYOR QUE NUM2"
            END-IF.

            PERFORM UNTIL NUM1 NOT < NUM2 *>HASTA QUE NUM1 NO SEA MAS PEQUEÑO QUE NUM2
            *> ES IGUAL A NUM1 >= NUM2, HASTA QUE NUM1 SEA MAYOR O IGUAL A NUM2.
            *>TAMBIEN SE PUEDE HACER NOT LESS.
            COMPUTE NUM1 = NUM1 + 1 *> NO AJUNTAR ELS SIGNES AMB LES VARIABLES!
            END-PERFORM.

                DISPLAY "AHORA EL NUM1 VALE: " NUM1.

            PERFORM UNTIL NUM6 >= NUM7
            COMPUTE NUM6 = NUM6 + 1
            END-PERFORM.

               DISPLAY "AHORA EL NUM6 VALE: " NUM6.

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
