      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAY-SIMULATION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       *>La declaración con nivel de numeración 01 se utiliza para definir la estructura principal o el contenedor principal que agrupa otros elementos. Es similar a la declaración de una clase en lenguajes orientados a objetos o a la declaración de una estructura en otros lenguajes de programación.
       01 I PIC 9(1) VALUE 1.
       01 MY-TABLE.
           05 TABLE-ENTRY OCCURS 5 TIMES PIC X(10).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "Ingrese el valor para el elemento "
               I" del array: "
               ACCEPT TABLE-ENTRY(I)
            END-PERFORM.

            DISPLAY "Los valores ingresados son:".
            PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY TABLE-ENTRY(I)
            END-PERFORM.

            STOP RUN.
       END PROGRAM ARRAY-SIMULATION.
