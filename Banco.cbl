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
       "C:\Users\34636\Documents\COBOL-Crear-archivos\CUENTA.txt"
       ORGANIZATION INDEXED
       ACCESS DYNAMIC
       RECORD KEY IS NUMCUENTA
       FILE STATUS IS FILE-STATUS.


       DATA DIVISION.
       FILE SECTION.

       FD CUENTA.
           01 DATOS-CUENTA.
               05 NOMBRE PIC X(10).
               05 APELLIDO PIC X(10).
               05 NUMCUENTA PIC X(10).
               05 SALDO PIC 9(5).

       WORKING-STORAGE SECTION.

       77 DINERO-SACADO PIC 9(4).
       77 BUSCAR-CUENTA PIC X(9).
       01 FILE-STATUS PIC 99.
       77 ENCONTRADO PIC X(1) VALUE "N".
       01 CREAR-CUENTA PIC X(5).
       77 OPERACION PIC X.
       77 SALDOVIEJO PIC 9(4) VALUE 2000.
       *>77 WS-SALDO PIC 9(5).
       *>77 WS-NUMCUENTA PIC X(10).


       01 FECHA.
           06 FECHA_NOMBRE PIC X(7) VALUE "Fecha: ".
           06 WS-FECHA PIC X(17).


       01 WS-DATOS-CUENTA.
           05 WS-NOMBRE PIC X(10).
           05 WS-APELLIDO PIC X(10).
           05 WS-NUMCUENTA PIC X(10).
           05 WS-SALDO PIC 9(5).

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
           DISPLAY "Bienvenido a tu nueva cuenta bancaria."
       ELSE
           PERFORM 20-LEER-CUENTA UNTIL ENCONTRADO = "S"
       END-IF.
       10-CUENTA-END.
       EXIT.


       20-LEER-CUENTA.
       MOVE BUSCAR-CUENTA TO NUMCUENTA

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


       20-OPERACION.
           DISPLAY "Desea Sacar dinero o Ingresar? (S/I)"
           ACCEPT OPERACION

           EVALUATE OPERACION
           WHEN "S"
           COMPUTE WS-SALDO = SALDOVIEJO - WS-SALDO
           WHEN "I"
           COMPUTE WS-SALDO = SALDOVIEJO + WS-SALDO.

           CLOSE CUENTA.
           CALL "FECHA-ACTUAL" USING WS-FECHA.
           OPEN I-O CUENTA.


           WRITE DATOS-CUENTA FROM WS-FECHA.

           WRITE DATOS-CUENTA FROM WS-SALDO.
           READ
           DISPLAY DATOS-CUENTA.

       20-OPERACION-END.


       END PROGRAM BANCO.
