      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALUMNOS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       77 C PIC 9(1).
       77 ENTRADA PIC 99 VALUE 99.

       01 ALUMNOS.
           02 ALUMNO.
               04 NOMBRE PIC A(10).
               04 APELLIDO PIC A(10).
               04 EDAD PIC 9(2).
               04 CURSO PIC X(24).
               04 NOTA PIC 99.



       01 QUALIFICACIONES.
           02 NOTA-I PIC 9(2)V99.
               88 INSUFICIENTE VALUE 1 2 3 4 5.
           02 NOTA-S PIC 9(2)V99.
               88 SUFICIENTE VALUE 5 6 7.
           02 NOTA-N PIC 9(2)V99.
               88 NOTABLE VALUE 8 9.
           02 NOTA-E PIC 9(2)V99.
               88 EXCELENTE VALUE 10.

       PROCEDURE DIVISION.

       00-INICIO.
       PERFORM 10-INTRODUCIR-NOTAS.

       *>PERFORM VARYING C FROM 1 BY 1 UNTIL C >= 5
       *>DISPLAY ALUMNOS(C)
       *>END-PERFORM.

       DISPLAY NOTA.
       DISPLAY ALUMNO.

       STOP RUN.
       00-INICIO-END.
       EXIT.


       10-INTRODUCIR-NOTAS.

       PERFORM UNTIL ENTRADA IS NUMERIC AND
       ENTRADA >= 0 AND ENTRADA < 10
           DISPLAY "Introduzca la nota del Sr." NOMBRE
           ACCEPT ENTRADA
           IF ENTRADA IS NOT NUMERIC OR ENTRADA < 0 OR ENTRADA > 10
               DISPLAY
               "Tienes que introducir un numero y que sea del 1 al 10"
           ELSE
               MOVE ENTRADA TO NOTA
               MOVE NOTA TO QUALIFICACIONES
               PERFORM 20-QUALIFICAR-NOTA
           END-IF
       END-PERFORM.

       10-INTRODUCIR-NOTAS-END.
       EXIT.


       20-QUALIFICAR-NOTA.

       EVALUATE TRUE
       WHEN INSUFICIENTE
       DISPLAY "Lo siento ha suspendido con un " ENTRADA.

       DISPLAY "HOLA".

       20-QUALIFICAR-NOTA-END.
       EXIT.

       END PROGRAM ALUMNOS.
