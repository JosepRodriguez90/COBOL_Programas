      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       SELECT EMPLEADOS-ARCHIVO
       ASSIGN TO "C:\Users\34636\Documents\COBOL-Crear-archivos\emp.dat"
       ORGANIZATION IS INDEXED
       RECORD KEY IS EMPLEADOS-ID
       ACCESS MODE IS DYNAMIC.
