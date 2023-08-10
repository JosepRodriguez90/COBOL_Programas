
      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PKM1.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT LISTA-PKM ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\LISTAPKM.txt".

       SELECT PKM-HALLFAMA ASSIGN TO
       "C:\Users\34636\Documents\COBOL-Crear-archivos\PKMHALLFAMA.txt".

       DATA DIVISION.
       FILE SECTION.
       FD LISTA-PKM
       RECORD CONTAINS 30 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 REG-LISTAPKM PIC X(30).

       FD PKM-HALLFAMA
       RECORD CONTAINS 32 CHARACTERS
       BLOCK CONTAINS 0 RECORDS.
       01 REG-HALLFAMA PIC X(32).

       WORKING-STORAGE SECTION.

       77 ATEND PIC X(3) VALUE "CNT".
       77 C PIC 9 VALUE 1.
       77 REG-SUMA PIC 9(2).

       01 WS-HALLFAMA.
           02 WS-POKEMON.
               05 WS-NUMERO PIC 9(3).
               05 WS-NOMBRE PIC X(12).
               05 WS-TIPO PIC X(15).


       01 ESTRUCTURA.
           05 TITULO.
               06 FILLER PIC X(5) VALUE ALL "*".
               06 FILLER PIC X(22) VALUE " WINNERS BATTLE TOWER ".
               06 FILLER PIC X(5) VALUE ALL "*".
               06 FILLER PIC X VALUE X'0A'.
           05 VALORES.
               06 FILLER PIC X(32) VALUE
               "NUM / NOMBRE / TIPO        ".
               06 FILLER PIC X VALUE X'0A'.
           05 RAYAS.
               06 FILLER PIC X(32) VALUE ALL "-".
           05 ESPACIO PIC X VALUE X'0A'.
           05 TOTAL-REGISTROS.
               06 FILLER PIC X(17) VALUE "Total registros: ".
               06 TOTAL-REG PIC Z9.


       PROCEDURE DIVISION.

       00-INCIO.
           PERFORM 10-ABRIR-ARCHIVOS.
           PERFORM 20-FORMAR-ARCHIVO.
           PERFORM 30-LEER-IMPRIMIR UNTIL ATEND EQUAL "FIN".
           PERFORM 40-IMPRIMIR-REG-TOTAL.
           PERFORM 50-CERRAR-ARCHIVOS.
       00-INICIO-END.
       EXIT.

       10-ABRIR-ARCHIVOS.
           OPEN INPUT LISTA-PKM.
           OPEN OUTPUT PKM-HALLFAMA.
       10-ABRIR-ARCHIVOS-END.
       EXIT.


       20-FORMAR-ARCHIVO.
           WRITE REG-HALLFAMA FROM TITULO.
           WRITE REG-HALLFAMA FROM ESPACIO.
           WRITE REG-HALLFAMA FROM VALORES AFTER ADVANCING PAGE.
           WRITE REG-HALLFAMA FROM RAYAS AFTER ADVANCING PAGE.
       20-FORMAR-ARCHIVO-END.
       EXIT.


       30-LEER-IMPRIMIR.
           READ LISTA-PKM INTO WS-POKEMON AT END MOVE "FIN" TO ATEND
           NOT AT END
           *>IF ATEND NOT EQUAL "FIN"
               WRITE REG-HALLFAMA FROM WS-POKEMON AFTER ADVANCING PAGE
               ADD 1 TO REG-SUMA.
           *>END-IF.
       30-LEER-IMPRIMIR-END.
       EXIT.


       40-IMPRIMIR-REG-TOTAL.
           MOVE REG-SUMA TO TOTAL-REG.
           WRITE REG-HALLFAMA FROM RAYAS AFTER ADVANCING PAGE.
           WRITE REG-HALLFAMA FROM TOTAL-REGISTROS AFTER ADVANCING PAGE.
       40-IMPRIMIR-REG-TOTAL-END.
       EXIT.


       50-CERRAR-ARCHIVOS.
           CLOSE LISTA-PKM PKM-HALLFAMA.
       STOP RUN.
       50-CERRAR-ARCHIVOS-END.
       EXIT.

       END PROGRAM PKM1.
