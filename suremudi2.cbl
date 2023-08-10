      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SUREMUDI2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 NUM1 PIC 9(4).
       01 NUM2 PIC 9(4).

       01 OPERADOR PIC X(1).
           88 SUMAR VALUE "+".
           88 RESTAR VALUE "-".
           88 MULTIPLICAR VALUE "*".
           88 DIVIDIR VALUE "/".
       01 RESULTADO PIC 9(5).
       01 SIGLINEA PIC X VALUE X'0A'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       00-CONTROL.
           PERFORM 10-INICIO.
           PERFORM 20-RESOLVER.
           STOP RUN.
       00-CONTROL-END.
       EXIT.


       10-INICIO.

           DISPLAY "BIENVENID@.".
           DISPLAY SIGLINEA.

           DISPLAY "Introduzca el primer valor:"
           ACCEPT NUM1.
           DISPLAY "a continuacion, introduzca el "
           "segundo valor:"
           ACCEPT NUM2.
           DISPLAY"Que operacion desea realizar: sumer(+),"
           " restar(-), multiplicar(*), dividir(/)."
           ACCEPT OPERADOR.

       10-INICIO-END.
       EXIT.



       20-RESOLVER.

           EVALUATE TRUE
               WHEN SUMAR
               ADD NUM1 TO NUM2 GIVING RESULTADO
               WHEN RESTAR
               SUBTRACT NUM1 FROM NUM2 GIVING RESULTADO
               WHEN MULTIPLICAR
               MULTIPLY NUM1 BY NUM2 GIVING RESULTADO
               WHEN DIVIDIR
               DIVIDE NUM1 BY NUM2 GIVING RESULTADO
           END-EVALUATE.

           DISPLAY "El resultado de " NUM1 OPERADOR NUM2 " es: "
           RESULTADO.

       20-RESOLVER-END.
       EXIT.


       END PROGRAM SUREMUDI2.
