      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANCO.

       ENVIRONMENT DIVISION. *>*****************************************
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT CUENTA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\JDATOSCUENTA.txt"
       ORGANIZATION INDEXED
       ACCESS DYNAMIC
       RECORD KEY IS NUMCUENTA
       FILE STATUS IS WS-FILE-STATUS.

       SELECT SALIDA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\JIMPCUENTA.txt".


       DATA DIVISION. *>************************************************
       FILE SECTION.
       FD CUENTA.
           01 DATOS-CUENTA.
               05 NUMCUENTA PIC X(10).
               05 NOMBRE PIC X(10).
               05 APELLIDO PIC X(10).
               05 SALDO PIC S9(5).

       FD SALIDA
       RECORD CONTAINS 35 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 REGISTRO PIC X(35).

       WORKING-STORAGE SECTION.

       77 WS-DINERO-SACADO PIC 9(4).
       77 WS-FILE-STATUS PIC 99.
       77 WS-ENCONTRADO PIC X(1).
       77 WS-CREAR-CUENTA PIC X(5).
       77 WS-OPERACION PIC X.
       77 WS-C PIC 9(2).


       01 WS-DATOS-CUENTA.
           05 WS-NUMCUENTA PIC X(10).
           05 WS-NOMBRE PIC X(10).
           05 WS-APELLIDO PIC X(10).
           05 WS-SALDO PIC S9(5).


       01 WS-FINAL-IMP.
           05 WS-SUMA-IMPRIMIR.
               06 FILLER PIC X(10) VALUE "INGRESO: +".
               06 WS-DINERO-SUM PIC 9(5).
               06 FILLER PIC X VALUE "€".
           05 WS-RESTA-IMPRIMIR.
               06 FILLER PIC X(11) VALUE "RETIRADO: -".
               06 WS-DINERO-RES PIC 9(5).
               06 FILLER PIC X VALUE "€".
           05 WS-IMPRIMIR.
               06 WS-FECHA PIC X(18).
               06 FILLER PIC X(9) VALUE ALL "         ".
               06 WS-SALDOTOTAL PIC S9(5).
               06 FILLER PIC X(1) VALUE ALL "€".



       01 WS-ESTRUCTURA.
           05 WS-TITULO.
               06 FILLER PIC X(12) VALUE ALL "*".
               06 WS-BUSCAR-CUENTA PIC X(9).
               06 FILLER PIC X(12) VALUE ALL "*".
               06 FILLER PIC X VALUE X'0A'.
           05 WS-TITULAR.
               06 WS-TITULARN PIC X(10) VALUE "Titular: ".
               06 WS-TNOMBRE PIC X(10).
               06 WS-TAPELLIDO PIC X(10).
               06 FILLER PIC X VALUE X'0A'.
           05 WS-RAYAS1.
               06 FILLER PIC X(35) VALUE ALL "-".
               06 FILLER PIC X VALUE X'0A'.
           05 WS-VALORES.
               06 FILLER PIC X(35) VALUE
               "Fecha /                   /Dinero ".
               06 FILLER PIC X VALUE X'0A'.
           05 WS-RAYAS2.
               06 FILLER PIC X(35) VALUE ALL "-".
               06 FILLER PIC X VALUE X'0A'.

       PROCEDURE DIVISION.*>*******************************************

        00-INICIO.
           PERFORM 10-BUSCAR-CUENTA.
           IF WS-ENCONTRADO = "N"
               DISPLAY "Esta no es tu cuenta registrada."
               PERFORM 100-CERRAR
           ELSE IF WS-ENCONTRADO = "S"
               AND WS-CREAR-CUENTA NOT EQUAL "CREAR"
               DISPLAY "Numero de cuenta correcto."
           END-IF.


           IF WS-CREAR-CUENTA = "CREAR"
               PERFORM 20-CREAR-CUENTA
           END-IF.

           PERFORM 20-OPERACION

           CLOSE CUENTA SALIDA.
           STOP RUN.

       00-INICIO-END.
       EXIT.


       10-BUSCAR-CUENTA.
       DISPLAY "Intrudezca el numero de cuenta. (ESXX-XXXX)"
       ACCEPT WS-BUSCAR-CUENTA
       PERFORM 10-CUENTA.
       10-BUSCAR-CUENTA-END.
       EXIT.


       10-CUENTA.
       OPEN I-O CUENTA. *>Obra el archiu.
       IF WS-FILE-STATUS = "35"
           MOVE "S" TO WS-ENCONTRADO
           MOVE "CREAR" TO WS-CREAR-CUENTA
           OPEN OUTPUT CUENTA
           OPEN OUTPUT SALIDA
           DISPLAY "Bienvenido a tu nueva cuenta bancaria."
       ELSE
           PERFORM 20-LEER-CUENTA UNTIL WS-ENCONTRADO = "S" OR "N"
       END-IF.
       10-CUENTA-END.
       EXIT.


       20-LEER-CUENTA.
       MOVE WS-BUSCAR-CUENTA TO NUMCUENTA.    *>Guarda el registre que estas buscant a la clau primaria
       READ CUENTA RECORD  *> Busca la clau primaria
       INVALID KEY
       MOVE "N" TO WS-ENCONTRADO
       NOT INVALID KEY
       MOVE "S" TO WS-ENCONTRADO

       MOVE DATOS-CUENTA TO WS-DATOS-CUENTA    *>Guardem les dades que hi ha avans de borrar el registre
       DELETE CUENTA RECORD    *>Borrem el registre, ja que el voldrem ficar de nou a la primera linea,
       *>si no el fiquem sempre a la primera linea tindrem el problema que compara el numero de cuenta i el primer que troba el fica exposat
       *>aixi que si volem mes endavant recuperar el saldo del ultim registre no es podra cumplir mai, ja que sempre mostra el primer reg.
       INVALID KEY
       DISPLAY "Error eliminando el registro de Banco.".



       20-CREAR-CUENTA.
           DISPLAY "Introduzca el nombre del titular: "
           ACCEPT NOMBRE
           DISPLAY "Introduzca el apellido del titular: "
           ACCEPT APELLIDO
           DISPLAY "¿Cuanto dinero desea poner en su cuenta? "
           ACCEPT SALDO
           MOVE WS-BUSCAR-CUENTA TO NUMCUENTA.

           MOVE NOMBRE TO WS-TNOMBRE
           MOVE APELLIDO TO WS-TAPELLIDO
           MOVE DATOS-CUENTA TO WS-DATOS-CUENTA. *> xk?¿

           WRITE REGISTRO FROM WS-TITULO.
           WRITE REGISTRO FROM WS-TITULAR.
           WRITE REGISTRO FROM WS-RAYAS1 AFTER ADVANCING PAGE
           WRITE REGISTRO FROM WS-VALORES AFTER ADVANCING PAGE
           WRITE REGISTRO FROM WS-RAYAS2 AFTER ADVANCING PAGE

           DISPLAY "Tu cuenta se a creado con exito!".



       20-OPERACION.

       IF WS-CREAR-CUENTA NOT EQUAL "CREAR"
           OPEN EXTEND SALIDA

           DISPLAY "Desea Sacar dinero o Ingresar? (S/I)"
           ACCEPT WS-OPERACION

           DISPLAY "¿Cuanto dinero?"
           ACCEPT WS-DINERO-SACADO

           *>DISPLAY DATOS-CUENTA


           EVALUATE WS-OPERACION
           WHEN "S"
           COMPUTE WS-SALDO = WS-SALDO - WS-DINERO-SACADO
           DISPLAY "Has retirado " WS-DINERO-SACADO " Euros"
           MOVE WS-SALDO TO WS-SALDOTOTAL
           MOVE WS-DINERO-SACADO TO WS-DINERO-RES
           WRITE REGISTRO FROM WS-RESTA-IMPRIMIR AFTER ADVANCING PAGE
           WHEN "I"
           COMPUTE WS-SALDO = WS-SALDO + WS-DINERO-SACADO
           DISPLAY "Has ingresado " WS-DINERO-SACADO " Euros"
           MOVE WS-SALDO TO WS-SALDOTOTAL
           MOVE WS-DINERO-SACADO TO WS-DINERO-SUM *> guarda la quantitat de diners ingresats al ws per despres fer el write al registro.
           WRITE REGISTRO FROM WS-SUMA-IMPRIMIR AFTER ADVANCING PAGE

       ELSE
           MOVE SALDO TO WS-SALDOTOTAL *> sino no mostra el saldo.
       END-IF.



       CLOSE CUENTA SALIDA.

       CALL "FECHA-ACTUAL" USING WS-FECHA.
       OPEN EXTEND SALIDA.
       OPEN I-O CUENTA.

       MOVE WS-DATOS-CUENTA TO DATOS-CUENTA.
       WRITE DATOS-CUENTA.
       WRITE REGISTRO FROM WS-IMPRIMIR BEFORE ADVANCING PAGE.


       *>DISPLAY DATOS-CUENTA.
       *>DISPLAY SALDOTOTAL.

       20-OPERACION-END.
       EXIT.



       100-CERRAR. *> Nomes funciona per si el numero de cuenta no es correcte.
       CLOSE CUENTA
       STOP RUN.

       END PROGRAM BANCO.
