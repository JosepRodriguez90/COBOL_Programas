       IDENTIFICATION DIVISION.
       PROGRAM-ID. CAPITULO-12.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  NUMERO PIC 99.
       01  MULTIPLICADOR  PIC 99.
       01  RESULTADO PIC ZZZ99. *> Z al dabat es per treure zeros al resultat, pero nomes es pot ficar a les variables de mostrar, no pots fer ni sumes ni res.
       01  SALIDA PIC XXXXX.
       01  IS-EMPTY PIC X.

       PROCEDURE DIVISION.

           MOVE "" TO IS-EMPTY.

           INICIO.
           PERFORM LEER_DATOS.

           CONTINUAR.
           PERFORM REINICIA-PROGRAMA.
           PERFORM INTRODUCE-NUMERO.
           PERFORM MOSTRAR-TABLA.


           LEER_DATOS.
           DISPLAY "Para salir introduce 'salir' en la consola.".
           DISPLAY "Para multiplicar pulsa INTRO.".
           ACCEPT SALIDA.
           IF SALIDA = "salir"
               GO TO FINALIZAR
           ELSE IF SALIDA = SPACE *>SPACE es un vacio.
               GO TO CONTINUAR
           ELSE
               DISPLAY "Lo que as introducido es invalido".
               GOBACK.

           FINALIZAR.
            STOP RUN.

           REINICIA-PROGRAMA.
                MOVE 0 TO MULTIPLICADOR.

           INTRODUCE-NUMERO.
           DISPLAY "INTRODUCE UN NUMERO.".
               ACCEPT NUMERO.

           MOSTRAR-TABLA.
                DISPLAY "LA TABLA DEL " NUMERO ":".
                PERFORM CALCULOS 10 TIMES.
                PERFORM INICIO.

           CALCULOS.
               ADD 1 TO MULTIPLICADOR.
               COMPUTE RESULTADO = NUMERO * MULTIPLICADOR.
               DISPLAY NUMERO " * " MULTIPLICADOR " = " RESULTADO.


       END PROGRAM CAPITULO-12.
