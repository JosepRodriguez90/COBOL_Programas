      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALUMNOS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT ALUMNOS
       ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\Alumnos.txt"
       ORGANIZATION IS INDEXED
       RECORD KEY IS APELLIDO
       ACCESS MODE IS DYNAMIC.


       DATA DIVISION.
       FILE SECTION.
       FD ALUMNOS.
           01 ALUMNO.
               04 NOMBRE PIC A(10).
               04 APELLIDO PIC A(10).
               04 NOTA PIC 9(2)V99.


       WORKING-STORAGE SECTION.

       77 WS-NUMERO PIC 9(3).
       77 C PIC 9(2).
       77 Z PIC 9(2).
       77 ESTERISCOS PIC X(24) VALUE ALL "*".
       77 WS-RECORRER PIC X(3).
       77 WS-SALIR PIC X(2) VALUE "SI".

       01 QUALIFICACIONES.
           02 NOTAQ PIC 9(2)V99.
               88 INSUFICIENTE VALUE 1 THRU 4.99.
               88 SUFICIENTE VALUE 5 THRU 7.99.
               88 NOTABLE VALUE 8 THRU 9.99.
               88 EXCELENTE VALUE 10.

       01 WS-ALUMNOS.
           02 WS-ALUMNO.
               04 WS-NOMBRE PIC A(10).
               04 WS-APELLIDO PIC A(10).
               04 WS-NOTA PIC 9(2)V99.


       PROCEDURE DIVISION.

       00-INICIO.

       OPEN OUTPUT ALUMNOS.
       PERFORM 10-INTRODUCIR-NOTAS
       CLOSE ALUMNOS.

       INITIALIZE ALUMNO.
       PERFORM 30-LEER-ARCHIVO.

       STOP RUN.
       00-INICIO-END.
       EXIT.


       10-INTRODUCIR-NOTAS.
       PERFORM UNTIL WS-SALIR = "NO"
           DISPLAY "Entra el nombre del Alumno: "
           ACCEPT WS-NOMBRE
           DISPLAY "Entra el apellido del Alumno: "
           ACCEPT WS-APELLIDO
           DISPLAY "Introduzca la nota del Sr." WS-NOMBRE
           ACCEPT WS-NOTA
           IF WS-NOTA IS NOT NUMERIC OR
               WS-NOTA < 0 OR WS-NOTA > 10
               DISPLAY
               "Tienes que introducir un numero y que sea del 1 al 10"
           GO TO 10-INTRODUCIR-NOTAS
           END-IF


           WRITE ALUMNO FROM WS-ALUMNO
           ADD 1 TO C
           DISPLAY "¿Desea insertar otro alumno?"
           ACCEPT WS-SALIR
       END-PERFORM.
       10-INTRODUCIR-NOTAS-END.
       EXIT.



       30-LEER-ARCHIVO.
       OPEN I-O ALUMNOS.

       PERFORM UNTIL Z EQUAL C

           IF Z EQUAL 0
               DISPLAY "***********************"
               DISPLAY "NOTAS ALUMNOS: "
               DISPLAY "***********************"
           END-IF

           READ ALUMNOS NEXT RECORD
           *>DISPLAY NOMBRE APELLIDO", nota: " NOTA


           MOVE NOTA TO QUALIFICACIONES

           EVALUATE TRUE
           WHEN INSUFICIENTE
           DISPLAY
           NOMBRE APELLIDO
           ", suspendido con un " NOTA
           WHEN SUFICIENTE
           DISPLAY
           NOMBRE APELLIDO
           ", aprobado con suficiente, su nota: " NOTA
           WHEN NOTABLE
           DISPLAY
           NOMBRE APELLIDO
           ", aprobado con notable, su nota: " NOTA
           WHEN EXCELENTE
           DISPLAY
           NOMBRE APELLIDO
           ", aprobado con excelente, su nota: " NOTA
           END-EVALUATE

           INITIALIZE QUALIFICACIONES




           ADD 1 TO Z

       END-PERFORM.

       CLOSE ALUMNOS.
       END PROGRAM ALUMNOS.
