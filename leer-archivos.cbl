      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-FILES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT OPTIONAL EMPLEADOS-ARCHIVO
       ASSIGN TO "C:\Users\34636\Documents\COBOL-Crear-archivos\emp.dat"
       ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EMPLEADOS-ARCHIVO.   *>Te que estar declarat al enviroment division, al select.
       01 EMPLEADOS-REGISTRO.
           05 EMPLEADOS-ID PIC X(6).
           05 EMPLEADOS-NOMBRE PIC X(25).
           05 EMPLEADOS-APELLIDOS PIC X(35).
           05 EMPLEADOS-EDAD PIC 9(3).
           05 EMPLEADOS-TELEFONO PIC X(9).
           05 EMPLEADOS-DIRECCION PIC X(35).

       WORKING-STORAGE SECTION.
       01  PRESENTACION.
           05 TEXTO-ID PIC X(3) VALUE "ID:".
           05 MUESTRA-ID PIC X(6).
           05 TEXTO-NOMBRE PIC X(7) VALUE "Nombre:".
           05 MUESTRA-NOMBRE PIC X(15).
           05 TEXTO-APELLIDOS PIC X(10) VALUE "Apellidos:".
           05 MUESTRA-APELLIDOS PIC X(20).
           05 TEXTO-EDAD PIC X(5) VALUE "Edad:".
           05 MUESTRA-EDAD PIC X(3).
           05 TEXTO-TELEFONO PIC X(9) VALUE "Telefono:".
           05 MUESTRA-TELEFONO PIC X(10).
           05 TEXTO-DIRECCION PIC X(10) VALUE "Direccion:".
           05 MUESTRA-DIRECCION PIC X(35).

           01  FIN-DEL-ARCHIVO PIC X.
           01  MAXIMO-REGISTROS PIC 99.
           01  GUARDA-ENTER PIC X.


           PROCEDURE DIVISION.

           EMPIEZA-PROGRAMA.
           PERFORM APERTURA-ARCHIVO.
           MOVE ZEROES TO MAXIMO-REGISTROS.
           MOVE "1" TO FIN-DEL-ARCHIVO.
           PERFORM LEE-SIGUIENTE-REGISTRO.
           PERFORM MUESTRA-REGISTROS
           UNTIL FIN-DEL-ARCHIVO = "0".
           PERFORM CIERRE-ARCHIVO.
           PROGRAM-DONE.
           STOP RUN.

           APERTURA-ARCHIVO.
           OPEN INPUT EMPLEADOS-ARCHIVO.

           CIERRE-ARCHIVO.
           CLOSE EMPLEADOS-ARCHIVO.

           MUESTRA-REGISTROS.
           PERFORM MUESTRA-CAMPOS.
           PERFORM LEE-SIGUIENTE-REGISTRO.

           MUESTRA-CAMPOS.
           IF MAXIMO-REGISTROS = 10
           PERFORM PULSAR-ENTER.
           MOVE EMPLEADOS-ID TO MUESTRA-ID.
           MOVE EMPLEADOS-NOMBRE TO MUESTRA-NOMBRE.
           MOVE EMPLEADOS-APELLIDOS TO MUESTRA-APELLIDOS.
           MOVE EMPLEADOS-EDAD TO MUESTRA-EDAD.
           MOVE EMPLEADOS-TELEFONO TO MUESTRA-TELEFONO.
           MOVE EMPLEADOS-DIRECCION TO MUESTRA-DIRECCION.
           DISPLAY PRESENTACION.
           ADD 1 TO MAXIMO-REGISTROS.

           LEE-SIGUIENTE-REGISTRO.
           READ EMPLEADOS-ARCHIVO NEXT RECORD *> Llegeix una linia de registros.
           AT END  *> Si se alcanza el final del archivo (AT END), se ejecuta el siguiente bloque de c�digo.
           MOVE "0" TO FIN-DEL-ARCHIVO.

           PULSAR-ENTER.
           DISPLAY
           "Presione la tecla ENTER para ver la siguiente pagina...".
           ACCEPT GUARDA-ENTER.
           MOVE ZEROES TO MAXIMO-REGISTROS.
