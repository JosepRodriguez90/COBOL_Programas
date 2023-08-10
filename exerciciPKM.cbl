      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PKM.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
      *Archivo físico en modo dinámico.
       FILE-CONTROL. *>Part fisica del archiu, inclou el nom del archiu al disco i com s'organitzara.
       SELECT ARCHIVO-POKEMON
       ASSIGN TO "C:\Users\34636\Documents\COBOL-Crear-archivos\pkm.txt"
       ORGANIZATION IS INDEXED *> no es SEQUENTIAL per lo tant no guardara l'ultim registre que hem creat a l'ultim de forma sequencial, ja que ens interesa organitzar per KEY.
       RECORD KEY IS NUMEROPKM *> la clau sera el NUMEROPKM.
       ALTERNATE RECORD KEY IS NOMBREPKM
       ACCESS MODE IS DYNAMIC *>Se puede acceder a los registros del archivo de forma secuencial o aleatoria, dependiendo de la forma de la Instrucción específica de entrada-salida utilizada.
       FILE STATUS IS FILE-STATUS. *> Guarda el error l'estat del archiu. (Per si dona error de que no el trobe per exemple).

       DATA DIVISION.
       FILE SECTION. *>Variables de us del archiu. (La part logica, inclou el disseny del archiu).
       FD ARCHIVO-POKEMON.
          01 POKEMONS.
               07 NUMEROPKM PIC 9(3).
               07 NOMBREPKM PIC X(10).
               07 TIPO-PKM PIC X(20). *>Mes llarg per si el Pokemon es de 2 tipos.


       WORKING-STORAGE SECTION. *>Variables de us del programa.
       01  SI-NO PIC X.
       01  OPCIONMENU PIC 9(1).
       01  SALIRSUBMENU PIC 9(1).
       01  LEE-TODO PIC X.
       01 FILE-STATUS PIC 99.
       77  SI-A-ELIMINAR PIC X.
       01 COMPROBAR PIC X.
       01 CAMPO-NUMEROPKM PIC 9(3).
       01 CAMPO-NOMBREPKM PIC X(20).
       01  REGISTRO-ENCONTRADO PIC X.

       PROCEDURE DIVISION.

       *>MENU INICIAL.**************************************************
       PERFORM UNTIL OPCIONMENU = 4
        MOVE 0 TO SALIRSUBMENU
       DISPLAY "Bienvenido."
       DISPLAY "¿Que desea hacer?"
       DISPLAY 'Añadir pokemon (1)'
       DISPLAY 'Leer lista de pokemons (2)'
       DISPLAY 'Eliminar (3)'
       DISPLAY 'salir (4)'
       ACCEPT OPCIONMENU

           EVALUATE OPCIONMENU
            WHEN 1
               PERFORM AÑADIRPKM
            WHEN 2
               PERFORM LISTAPKM
            WHEN 3
               PERFORM ELIMINAR
            WHEN 4
               PERFORM SALIRPROGM
            WHEN OTHER
                DISPLAY 'Opción no válida.'
           END-EVALUATE

       END-PERFORM.

       SALIRPROGM.*>************************************************************
       CLOSE ARCHIVO-POKEMON.
       STOP RUN.

       AÑADIRPKM.*>************************************************************
       OPEN I-O ARCHIVO-POKEMON. *>Obra el archiu.

       IF FILE-STATUS = "35" *>Si dona error 35 es que no troba l'archiu, per tant crearem un de nou amb el OUTPUT.
       DISPLAY "Archivo no encontrado. Se creará uno nuevo."
       OPEN OUTPUT ARCHIVO-POKEMON.

       PERFORM UNTIL SALIRSUBMENU = 4
           DISPLAY "AÑADIR pokemon"
           DISPLAY "Numero del Pokemon"
           ACCEPT NUMEROPKM
           DISPLAY "Nombre del Pokemon"
           ACCEPT NOMBREPKM
           DISPLAY "Tipo de Pokemon"
           ACCEPT TIPO-PKM
           DISPLAY "¿Desea salir?"
           DISPLAY "SI (4), NO (INTRO)"
           ACCEPT SALIRSUBMENU
           WRITE POKEMONS
           IF SALIRSUBMENU = 4
               PERFORM CERRARARCHIVO
       END-PERFORM.


       LISTAPKM. *>************************************************************
       *>MOVE ZERO TO NUMEROPKM MOVE SPACE TO NOMBREPKM *>Refresco perque aixi no es mostre l'ultim camp introduit, i nomes mostri el que conte el archiu, no el que conte actualment la variable. Nomes el que conte el archiu.
       *>OVE SPACE TO TIPO-PKM
       INITIALIZE NUMEROPKM NOMBREPKM TIPO-PKM. *>Refresca les variables.

       DISPLAY "****LISTAR pokemon****"
       MOVE "0" TO LEE-TODO.
       OPEN I-O ARCHIVO-POKEMON
       PERFORM UNTIL SALIRSUBMENU = 4

           IF LEE-TODO = "0" *> Voldra dir que encara no a llegit res.
               IF NUMEROPKM NOT EQUAL ZERO *> No es mostren els DISPLAYS avans d'arribar al READ.
               DISPLAY "Nombre del Pokemon: " NOMBREPKM
               DISPLAY "Numero del Pokemon: " NUMEROPKM
               DISPLAY "Tipo del Pokemon: " TIPO-PKM
               DISPLAY SPACE
               END-IF
           READ ARCHIVO-POKEMON NEXT RECORD
           AT END MOVE "1" TO LEE-TODO

       IF LEE-TODO EQUAL "1" AND NUMEROPKM EQUAL ZERO  *>Quan ho ha llegit i a mostrat tot + no conte res al NUMEROPKM, vol dir que no hi ha contingut al ficher. Fiquem un 4 al SALIRSUBMENU per a que acabi el perform.
           DISPLAY "No hay registros."
           DISPLAY SPACE
           MOVE 4 TO SALIRSUBMENU
           PERFORM CERRARARCHIVO
       ELSE IF LEE-TODO EQUAL "1"  *>Quan ho ha llegit i a mostrat tot fiquem un 4 al SALIRSUBMENU per a que acabi el perform.
           MOVE 4 TO SALIRSUBMENU
           PERFORM CERRARARCHIVO

       END-PERFORM.


       ELIMINAR.*>************************************************************
       OPEN I-O ARCHIVO-POKEMON

       DISPLAY "Introduce el numero que tiene el Pokemon." .
       ACCEPT CAMPO-NOMBREPKM
       MOVE CAMPO-NOMBREPKM TO NOMBREPKM   *>Mous el numero entrat al NUMEROPKM que es la key
       READ ARCHIVO-POKEMON KEY IS NOMBREPKM *>PER DEFECTE BUSCARA LA KEY PRIMARIA, AMB EL "KEY IS" LO QUE FEM ES DIR-LI QUE UTILITZAREM LA ALTERNA, PER CLAU PRIMARIA S'HA DE FICAR: READ ARCHIVO-POKEMON RECORD.
       INVALID KEY
       MOVE "N" TO REGISTRO-ENCONTRADO.
       IF REGISTRO-ENCONTRADO EQUAL "N"
           DISPLAY "No se encontro ningun registro con ese ID."
           PERFORM CERRARARCHIVO
           GOBACK  *>Per seguretat si passa aixo tanca el programa.
       END-IF.
       PERFORM MOSTRAR-NOMBRE-POKEMON.


       MOSTRAR-NOMBRE-POKEMON. *> Mostra el numero, nom i tipo del pokemon que vols eliminar.
       DISPLAY SPACE
       DISPLAY "NUMERO: " NUMEROPKM.
       DISPLAY "NOMBRE: " NOMBREPKM.
       DISPLAY "TIPO: " TIPO-PKM.

       DISPLAY "¿SEGURO QUE QUIERES ELIMINAR ESTE REGISTRO (S/N)?"
       ACCEPT SI-A-ELIMINAR

       IF SI-A-ELIMINAR= "S"   *>Amb aquest IF elimina el registre en cas que haguis dit que Si.
       DELETE ARCHIVO-POKEMON RECORD
       INVALID KEY
       DISPLAY "Error eliminando el registro de Pokemon."

       IF SI-A-ELIMINAR= "N"   *> No elimina el registre
       DISPLAY "No se a borrado."
       END-IF.
       IF SI-A-ELIMINAR NOT = "S" AND  *> Seguritat per saber si has ficar S o N, sino et mostra missatge de error: Debes introducir S/N.
       SI-A-ELIMINAR NOT = "N"
       DISPLAY "Debes introducir S/N."
       END-IF.
       DISPLAY SPACE
       PERFORM CERRARARCHIVO.

       *>**** Tancar el archiu.
       CERRARARCHIVO.
       CLOSE ARCHIVO-POKEMON.

       END PROGRAM PKM.
