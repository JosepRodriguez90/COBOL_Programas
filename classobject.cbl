      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CUENTA.

       ENVIRONMENT DIVISION.

       DATA DIVISION.

       CLASS-CONTROL.
           Cuenta IS CLASS "Cuenta"

       WORKING-STORAGE SECTION.

       01  MI-CUENTA OBJECT REFERENCE Cuenta.

       PROCEDURE DIVISION.

      * Crear una nueva instancia de la clase Cuenta
           MOVE NEW Cuenta TO MI-CUENTA

      * Depositar 100 en la cuenta
           INVOKE MI-CUENTA "depositar" USING 100

      * Retirar 50 de la cuenta
           INVOKE MI-CUENTA "retirar" USING 50

      * Mostrar el saldo de la cuenta
           DISPLAY "Saldo: " MI-CUENTA::saldo

           STOP RUN.

       CLASS-ID. CUENTA.

       OBJECT.
           01  saldo PIC S9(9) COMP-5 VALUE ZEROES.

       METHOD-ID. "depositar".
       LINKAGE SECTION.
           01  cantidad PIC S9(9) COMP-5.
       PROCEDURE DIVISION.
           ADD cantidad TO saldo
           .

       METHOD-ID. "retirar".
       LINKAGE SECTION.
           01  cantidad PIC S9(9) COMP-5.
       PROCEDURE DIVISION.
           SUBTRACT cantidad FROM saldo
           .

       END CLASS CUENTA.
