      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANCO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT CUENTA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\JDATOSCUENTA.txt"
       ORGANIZATION INDEXED
       ACCESS DYNAMIC
       RECORD KEY IS NUMCUENTA
       FILE STATUS IS FILE-STATUS.

       SELECT SALIDA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\JIMPCUENTA.txt".


       DATA DIVISION.
       FILE SECTION.
       FD CUENTA.
           01 DATOS-CUENTA.
               05 NUMCUENTA PIC X(10).
               05 NOMBRE PIC X(10).
               05 APELLIDO PIC X(10).
               05 SALDO PIC 9(5).

       FD SALIDA
       RECORD CONTAINS 35 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 REGISTRO PIC X(35).

       WORKING-STORAGE SECTION.

       01 WS-DATOS-CUENTA.
           05 WS-NUMCUENTA PIC X(10).
           05 WS-NOMBRE PIC X(10).
           05 WS-APELLIDO PIC X(10).
           05 WS-SALDO PIC 9(5).


       77 WS-SALDO2 PIC 9(5).
       77 DINERO-SACADO PIC 9(3).
       01 FILE-STATUS PIC 99.
       77 ENCONTRADO PIC X(1).
       01 CREAR-CUENTA PIC X(5).
       77 OPERACION PIC X.
       77 C PIC 9(2).


       01 FINAL-IMP.
           05 SUMA-IMPRIMIR.
               06 FILLER PIC X(10) VALUE "INGRESO: +".
               06 SALDOTOTAL-SUM PIC 9(5).
               06 FILLER PIC X VALUE "€".
           05 RESTA-IMPRIMIR.
               06 FILLER PIC X(10) VALUE "RETIRAD: -".
               06 SALDOTOTAL-RES PIC 9(5).
               06 FILLER PIC X VALUE "€".
           05 IMPRIMIR.
               06 WS-FECHA PIC X(18).
               06 FILLER PIC X(9) VALUE ALL "         ".
               06 SALDOTOTAL PIC 9(5).
               06 FILLER PIC X(1) VALUE ALL "€".



       01 ESTRUCTURA.
           05 TITULO.
               06 FILLER PIC X(12) VALUE ALL "*".
               06 BUSCAR-CUENTA PIC X(9).
               06 FILLER PIC X(12) VALUE ALL "*".
               06 FILLER PIC X VALUE X'0A'.
           05 TITULAR.
               06 TITULARN PIC X(10) VALUE "Titular: ".
               06 TNOMBRE PIC X(10).
               06 TAPELLIDO PIC X(10).
               06 FILLER PIC X VALUE X'0A'.
           05 RAYAS1.
               06 FILLER PIC X(35) VALUE ALL "-".
               06 FILLER PIC X VALUE X'0A'.
           05 VALORES.
               06 FILLER PIC X(35) VALUE
               "Fecha /                /Dinero ".
               06 FILLER PIC X VALUE X'0A'.
           05 RAYAS2.
               06 FILLER PIC X(35) VALUE ALL "-".
               06 FILLER PIC X VALUE X'0A'.

       PROCEDURE DIVISION.

        00-INICIO.
           PERFORM 10-BUSCAR-CUENTA.
           IF ENCONTRADO = "N"
               DISPLAY "Esta no es tu cuenta registrada."
               PERFORM 100-CERRAR
           ELSE IF ENCONTRADO = "S" AND CREAR-CUENTA NOT EQUAL "CREAR"
               DISPLAY "Numero de cuenta correcto."
           END-IF.


           IF CREAR-CUENTA = "CREAR"
               PERFORM 20-CREAR-CUENTA
           END-IF.

           PERFORM 20-OPERACION

           CLOSE CUENTA SALIDA.
           STOP RUN.

       00-INICIO-END.
       EXIT.


       10-BUSCAR-CUENTA.
       DISPLAY "Intrudezca el numero de cuenta. (ESXX-XXXX)"
       ACCEPT BUSCAR-CUENTA
       PERFORM 10-CUENTA.
       10-BUSCAR-CUENTA-END.
       EXIT.


       10-CUENTA.
       OPEN I-O CUENTA. *>Obra el archiu.
       IF FILE-STATUS = "35"
           MOVE "S" TO ENCONTRADO
           MOVE "CREAR" TO CREAR-CUENTA
           OPEN OUTPUT CUENTA
           OPEN OUTPUT SALIDA
           DISPLAY "Bienvenido a tu nueva cuenta bancaria."
       ELSE
           PERFORM 20-LEER-CUENTA UNTIL ENCONTRADO = "S" OR "N"
       END-IF.
       10-CUENTA-END.
       EXIT.


       20-LEER-CUENTA.
       MOVE BUSCAR-CUENTA TO NUMCUENTA.
       READ CUENTA RECORD
       INVALID KEY
       MOVE "N" TO ENCONTRADO
       NOT INVALID KEY
       MOVE "S" TO ENCONTRADO

       MOVE DATOS-CUENTA TO WS-DATOS-CUENTA
       DELETE CUENTA RECORD
       INVALID KEY
       DISPLAY "Error eliminando el registro de Banco.".



       20-CREAR-CUENTA.
           DISPLAY "Introduzca el nombre del titular: "
           ACCEPT NOMBRE
           DISPLAY "Introduzca el apellido del titular: "
           ACCEPT APELLIDO
           DISPLAY "¿Cuanto dinero desea poner en su cuenta? "
           ACCEPT SALDO
           MOVE BUSCAR-CUENTA TO NUMCUENTA.

           MOVE NOMBRE TO TNOMBRE
           MOVE APELLIDO TO TAPELLIDO
           MOVE DATOS-CUENTA TO WS-DATOS-CUENTA. *> xk?¿

           WRITE REGISTRO FROM TITULO.
           WRITE REGISTRO FROM TITULAR.
           WRITE REGISTRO FROM RAYAS1 AFTER ADVANCING PAGE
           WRITE REGISTRO FROM VALORES AFTER ADVANCING PAGE
           WRITE REGISTRO FROM RAYAS2 AFTER ADVANCING PAGE

           DISPLAY "Tu cuenta se a creado con exito!".

       20-OPERACION.


           IF CREAR-CUENTA NOT EQUAL "CREAR"
               OPEN EXTEND SALIDA

               DISPLAY "Desea Sacar dinero o Ingresar? (S/I)"
               ACCEPT OPERACION

               DISPLAY "¿Cuanto dinero?"
               ACCEPT DINERO-SACADO

               *>DISPLAY DATOS-CUENTA


               EVALUATE OPERACION
               WHEN "S"
               COMPUTE WS-SALDO = DINERO-SACADO - WS-SALDO
               DISPLAY "Has retirado " DINERO-SACADO " Euros"
               MOVE WS-SALDO TO SALDOTOTAL
               MOVE DINERO-SACADO TO SALDOTOTAL-RES
               WRITE REGISTRO FROM RESTA-IMPRIMIR AFTER ADVANCING PAGE
               WHEN "I"
               COMPUTE WS-SALDO = DINERO-SACADO + WS-SALDO
               DISPLAY "Has ingresado " DINERO-SACADO " Euros"
               MOVE WS-SALDO TO SALDOTOTAL
               MOVE DINERO-SACADO TO SALDOTOTAL-SUM
               WRITE REGISTRO FROM SUMA-IMPRIMIR AFTER ADVANCING PAGE

           ELSE
               MOVE SALDO TO SALDOTOTAL *> sino no mostra el saldo.
           END-IF.



           CLOSE CUENTA SALIDA.

           CALL "FECHA-ACTUAL" USING WS-FECHA.
           OPEN EXTEND SALIDA.
           OPEN I-O CUENTA.

           MOVE WS-DATOS-CUENTA TO DATOS-CUENTA.
           WRITE DATOS-CUENTA.
           WRITE REGISTRO FROM IMPRIMIR BEFORE ADVANCING PAGE.


           DISPLAY DATOS-CUENTA.

       20-OPERACION-END.
       EXIT.


       100-CERRAR. *> Nomes funciona per si el numero de cuenta no es correcte.
       CLOSE CUENTA
       STOP RUN.

       END PROGRAM BANCO.
