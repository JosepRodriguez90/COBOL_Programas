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
               05 NOMBRE PIC X(10).
               05 APELLIDO PIC X(10).
               05 NUMCUENTA PIC X(10).
               05 SALDO PIC 9(5).

       FD SALIDA
       RECORD CONTAINS 35 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 REGISTRO PIC X(35).

       WORKING-STORAGE SECTION.

       77 DINERO-SACADO PIC 9(4).
       01 FILE-STATUS PIC 99.
       77 ENCONTRADO PIC X(1).
       01 CREAR-CUENTA PIC X(5).
       77 OPERACION PIC X.
       77 SALDOVIEJO PIC 9(4) VALUE 2000.
       77 C PIC 9(2).


       01 IMPRIMIR.
           06 WS-FECHA PIC X(17).
           06 ESPACIO PIC X(7) VALUE "  -  ".
           06 WS-SALDO PIC 9(5).
           06 FILLER PIC X(6) VALUE "Euros".


       01 ESTRUCTURA.
           05 TITULO.
               06 FILLER PIC X(12) VALUE ALL "*".
               06 BUSCAR-CUENTA PIC X(9).
               06 FILLER PIC X(12) VALUE ALL "*".
               06 FILLER PIC X VALUE X'0A'.
           05 VALORES.
               06 FILLER PIC X(35) VALUE
               "Fecha /                /Dinero ".
               06 FILLER PIC X VALUE X'0A'.
           05 RAYAS.
               06 FILLER PIC X(35) VALUE ALL "-".
               06 FILLER PIC X VALUE X'0A'.

       PROCEDURE DIVISION.

       00-INICIO.
           PERFORM 10-BUSCAR-CUENTA.
           IF ENCONTRADO = "N"
               DISPLAY "Esta no es tu cuenta registrada."
           ELSE IF ENCONTRADO = "S"
               DISPLAY "Numero de cuenta correcto."
           END-IF.

           IF CREAR-CUENTA = "CREAR"
               PERFORM 20-CREAR-CUENTA
           END-IF.

           PERFORM 20-OPERACION

           CLOSE CUENTA.
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
           *>DISPLAY DATOS-CUENTA BUSCAR-CUENTA
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
       MOVE "S" TO ENCONTRADO.
       10-LEER-CUENTA-END.
       EXIT.


       20-CREAR-CUENTA.
           DISPLAY "Introduzca el nombre del titular: "
           ACCEPT NOMBRE
           DISPLAY "Introduzca el apellido del titular: "
           ACCEPT APELLIDO
           DISPLAY "¿Cuanto dinero desea poner en su cuenta? "
           ACCEPT SALDO
           MOVE BUSCAR-CUENTA TO NUMCUENTA.

           WRITE REGISTRO FROM TITULO.
           WRITE REGISTRO FROM VALORES.
           WRITE REGISTRO FROM RAYAS AFTER ADVANCING PAGE.


       20-OPERACION.
           DISPLAY "Desea Sacar dinero o Ingresar? (S/I)"
           ACCEPT OPERACION

           MOVE SALDO TO WS-SALDO.

           EVALUATE OPERACION
           WHEN "S"
           COMPUTE WS-SALDO = SALDOVIEJO - WS-SALDO
           WHEN "I"
           COMPUTE WS-SALDO = SALDOVIEJO + WS-SALDO.
           DISPLAY DATOS-CUENTA.


           CLOSE CUENTA.
           IF CREAR-CUENTA="CREAR"
               CLOSE SALIDA
           END-IF.
           CALL "FECHA-ACTUAL" USING WS-FECHA.
           OPEN EXTEND SALIDA.
           OPEN I-O CUENTA.

           WRITE DATOS-CUENTA.
           WRITE REGISTRO FROM IMPRIMIR.

           CLOSE SALIDA CUENTA.

       20-OPERACION-END.


       END PROGRAM BANCO.
