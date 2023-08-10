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
       01 NUMERO PIC 9(9)V99.
       01 RESULTADO PIC 9(9)V99.
       01 OPERADOR PIC X.
       01 OTRO-NUMERO PIC 9(9)V99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Ingrese un numero: ".
            ACCEPT NUMERO.

            DISPLAY "Ingrese una operacion (+, -, *, /)".
            ACCEPT OPERADOR.

            DISPLAY "Ingrese otro numero: ".
            ACCEPT OTRO-NUMERO.

            IF OPERADOR = "+" THEN
                COMPUTE RESULTADO = NUMERO + OTRO-NUMERO
            ELSE IF OPERADOR = "-" THEN
                COMPUTE RESULTADO = NUMERO - OTRO-NUMERO
            ELSE IF OPERADOR = "*" THEN
                COMPUTE RESULTADO = NUMERO * OTRO-NUMERO
            ELSE IF OPERADOR = "/" THEN
                COMPUTE RESULTADO = NUMERO / OTRO-NUMERO
            ELSE
                DISPLAY "Operador invalido."
                GOBACK
            END-IF.

                DISPLAY "El resultado es: " RESULTADO.
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
