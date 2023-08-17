      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULARSALARIOS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 WSC-CONSTANTES.
           05 WSC-SENIORITY.
               10 WSC-SENIOR      PIC X(06) VALUE "SENIOR".
               10 WSC-SEMISR       PIC X(06) VALUE "SEMSR".
               10 WSC-JUNIOR       PIC X(06) VALUE "JUNIOR".
           05 WSC-SUELDOS.
               10 WSC-SUELDO-JUNIOR PIC 9(06) VALUE 100000.
               10 WSC-SUELDO-SEMISR PIC 9(06) VALUE 160000.
               10 WSC-SUELDO-SENIOR PIC 9(06) VALUE 200000.

       01 WSV-VARIABLES.
           05 WS-POSTULANTES.
               10 WSV-POSTU1.
                   15 WSV-NOMBRE1          PIC X(5) VALUE "PEDRO".
                   15 WSV-EXPERIENCIA1     PIC 9(02) VALUE 02.
                   15 WSV-SUELDO1          PIC 9(06).
                   15 WSV-SUELDO-ANUAL-1   PIC 9(07).
                   15 WSV-BONO1            PIC 9(06).
               10 WSV-POSTU2.
                   15 WSV-NOMBRE2        PIC X(5) VALUE "SOFIA".
                   15 WSV-EXPERIENCIA2     PIC 9(02) VALUE 07.
                   15 WSV-SUELDO2          PIC 9(06).
                   15 WSV-SUELDO-ANUAL-2   PIC 9(07).
                   15 WSV-BONO2            PIC 9(06).
               10 WSV-POSTU3.
                   15 WSV-NOMBRE3        PIC X(5) VALUE "LALA".
                   15 WSV-EXPERIENCIA3     PIC 9(02) VALUE 04.
                   15 WSV-SUELDO3          PIC 9(06).
                   15 WSV-SUELDO-ANUAL-3   PIC 9(07).
                   15 WSV-BONO3            PIC 9(06).

       05 WSV-POSTULANTE-AUX.
           10 WSV-NOMBRE-AUX           PIC X(5).
           10 WSV-EXPERIENCIA-AUX      PIC 9(02).
               88 WSS-EXP-JUNIOR       VALUE 0 1 2.
               88 WSS-EXP-SEMISR       VALUE 3 4 5.
           10 WSV-SUELDO-AUX           PIC 9(06).
           10 WSV-SUELDO-ANUAL-AUX     PIC 9(07).
           10 WSV-BONO-AUX             PIC 9(06).


       PROCEDURE DIVISION.

       00-CONTROL.
           PERFORM 10-INICIO.
           PERFORM 20-PROCESO.
       STOP RUN.
       00-CONTROL-END.
       EXIT.


       10-INICIO.
           DISPLAY "HOLA NERDERLA 2023"
           INITIALIZE WSV-POSTULANTE-AUX.
       10-INICIO-END.
       EXIT.



       20-PROCESO.

           MOVE WSV-POSTU1 TO WSV-POSTULANTE-AUX.
           PERFORM 25-EVALUAR-SENIORITY.
           PERFORM 30-CALCULAR-SUELDO.

           MOVE WSV-POSTU2 TO WSV-POSTULANTE-AUX.
           PERFORM 25-EVALUAR-SENIORITY.
           PERFORM 30-CALCULAR-SUELDO.

           MOVE WSV-POSTU3 TO WSV-POSTULANTE-AUX.
           PERFORM 25-EVALUAR-SENIORITY.
           PERFORM 30-CALCULAR-SUELDO.

       20-PROCESO-END.
       EXIT.



       25-EVALUAR-SENIORITY.

           DISPLAY "---------------------------------------------"
           EVALUATE TRUE
           WHEN WSS-EXP-JUNIOR
               MOVE WSC-SUELDO-JUNIOR TO WSV-SUELDO-AUX
               DISPLAY WSV-NOMBRE-AUX " ESTE PUSTULANTE ES " WSC-JUNIOR
               DISPLAY "SU SUELDO $" WSV-SUELDO-AUX
           WHEN WSS-EXP-SEMISR
               MOVE WSC-SUELDO-SEMISR TO WSV-SUELDO-AUX
               DISPLAY WSV-NOMBRE-AUX " ESTE POSTULANTE ES " WSC-SEMISR
               DISPLAY "SU SUELDO $" WSV-SUELDO-AUX
           WHEN OTHER
               MOVE WSC-SUELDO-SENIOR TO WSV-SUELDO-AUX
               DISPLAY WSV-NOMBRE-AUX " ESTE POSTULANTE ES " WSC-SENIOR
               DISPLAY "SU SUELDO $" WSV-SUELDO-AUX
           END-EVALUATE.

       25-EVALUAR-SENIOTIRY-END.
       EXIT.




       30-CALCULAR-SUELDO.

           MULTIPLY 12 BY WSV-SUELDO-AUX GIVING WSV-SUELDO-ANUAL-AUX

           EVALUATE WSV-EXPERIENCIA-AUX
               WHEN 0
                   MOVE 0 TO WSV-BONO-AUX
               WHEN 1
                   COMPUTE WSV-BONO-AUX = WSV-SUELDO-AUX * 150 / 100
               WHEN 2 *>SI VOLS QUE SIGUI LO MATEIX PER VALOR 2 O 3 HO FIQUES SEGUIT COM AQUI.
               WHEN 3
                   COMPUTE WSV-BONO-AUX = WSV-SUELDO-AUX * 200 / 100
               WHEN 4 *>SI VOLS QUE SIGUI LO MATEIX PER VALOR 4, 5 O 6 HO FIQUES SEGUIT COM AQUI.
               WHEN 5
               WHEN 6
                   COMPUTE WSV-BONO-AUX = WSV-SUELDO-AUX * 250 / 100
               WHEN OTHER
                   COMPUTE WSV-BONO-AUX = WSV-SUELDO-AUX * 300 / 100
           END-EVALUATE.

           DISPLAY "Su sueldo anual es de $" WSV-SUELDO-ANUAL-AUX
           DISPLAY "Su bono es de $" WSV-BONO-AUX.

           INITIALIZE WSV-POSTULANTE-AUX.

       30-CALCULAR-SUELDO-END.
           EXIT.


       END PROGRAM CALCULARSALARIOS.
