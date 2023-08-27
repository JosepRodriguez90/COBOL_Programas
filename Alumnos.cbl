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
           02 ALUMNO1.
               04 NOMBRE1 PIC A(10).
               04 APELLIDO1 PIC A(10).
               04 EDAD1 PIC 9(2).
               04 CURSO1 PIC X(24).
               04 NOTA1 PIC 99.
           02 ALUMNO2.
               04 NOMBRE2 PIC A(10).
               04 APELLIDO2 PIC A(10).
               04 EDAD2 PIC 9(2).
               04 CURSO2 PIC X(24).
               04 NOTA2 PIC 9(2)V99.
           02 ALUMNO3.
               04 NOMBRE3 PIC A(10).
               04 APELLIDO3 PIC A(10).
               04 EDAD3 PIC 9(2).
               04 CURSO3 PIC X(24).
               04 NOTA3 PIC 9(2)V99.
           02 ALUMNO4.
               04 NOMBRE4 PIC A(10).
               04 APELLIDO4 PIC A(10).
               04 EDAD4 PIC 9(2).
               04 CURSO4 PIC X(24).
               04 NOTA4 PIC 9(2)V99.
           02 ALUMNO5.
               04 NOMBRE5 PIC A(10).
               04 APELLIDO5 PIC A(10).
               04 EDAD5 PIC 9(2).
               04 CURSO5 PIC X(24).
               04 NOTA5 PIC 9(2)V99.


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

       DISPLAY NOTA1.
       DISPLAY ALUMNO1.

       STOP RUN.
       00-INICIO-END.
       EXIT.


       10-INTRODUCIR-NOTAS.

       PERFORM UNTIL ENTRADA IS NUMERIC AND
       ENTRADA >= 0 AND ENTRADA < 10
           DISPLAY "Introduzca la nota del Sr." NOMBRE1
           ACCEPT ENTRADA
           IF ENTRADA IS NOT NUMERIC OR ENTRADA < 0 OR ENTRADA > 10
               DISPLAY
               "Tienes que introducir un numero y que sea del 1 al 10"
           ELSE
               MOVE ENTRADA TO NOTA1
               MOVE NOTA1 TO QUALIFICACIONES
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
