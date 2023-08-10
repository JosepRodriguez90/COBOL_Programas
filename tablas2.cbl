      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.                PRSEARCH.
      *> PROGRAMA QUE PRUEBA LA SENTENCIA SEARCH
      *> ------------------------------------------------------

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.           IBM-3083.
       OBJECT-COMPUTER.           IBM-3083.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       77  WS-MES                 PIC 9(02).
       01  WS-TABLA-MESES.
           05 FILLER              PIC X(12) VALUE '01ENERO     '.
           05 FILLER              PIC X(12) VALUE '02FEBRERO   '.
           05 FILLER              PIC X(12) VALUE '03MARZO     '.
           05 FILLER              PIC X(12) VALUE '04ABRIL     '.
           05 FILLER              PIC X(12) VALUE '05MAYO      '.
           05 FILLER              PIC X(12) VALUE '06JUNIO     '.
           05 FILLER              PIC X(12) VALUE '07JULIO     '.
           05 FILLER              PIC X(12) VALUE '08AGOSTO    '.
           05 FILLER              PIC X(12) VALUE '09SEPTIEMBRE'.
           05 FILLER              PIC X(12) VALUE '10OCTUBRE   '.
           05 FILLER              PIC X(12) VALUE '11NOVIEMBRE '.
           05 FILLER              PIC X(12) VALUE '12DICIEMBRE '.

       01  FILLER REDEFINES WS-TABLA-MESES.
           05 TAB-INFO-MES OCCURS 12 TIMES INDEXED BY I.
              10  TAB-NUMERO-MES  PIC 9(02).
              10  TAB-NOMBRE-MES  PIC X(10).

       PROCEDURE DIVISION.
       010-BUSQUEDA.
           DISPLAY "DIGITE EL MES A BUSCAR: "
           ACCEPT WS-MES

           SET I TO 1 *>Indica que la búsqueda en la tabla TAB-INFO-MES comenzará desde la primera ocurrencia de la tabla. (Podrias poner por ejemplo que empezara a partir del 8 que es Agosto por ejemplo).
           SEARCH TAB-INFO-MES
                  AT END DISPLAY "MES NO ENCONTRADO"
                  WHEN TAB-NUMERO-MES (I) = WS-MES
                  DISPLAY "EL MES ES: " TAB-NOMBRE-MES (I)
           END-SEARCH
           GOBACK.
