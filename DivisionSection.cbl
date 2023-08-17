      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       AUTHOR NOMBRE-AUTOR.
       INSTALLATION *>Indicar donde esta instalado el programa.
       DATE-WRITTEN *> Data de creacio
       DATE-COMPILED *> Data que vam acavar el progama.
       REMARKS *> Comentari sobre el programa.


       ENVIRONMENT DIVISION. *> NO ES UNA DIVISIO OBLIGATORIA. S'utilitza per espesificar archius d'entrada o sortida del programa.
       CONFIGURATION SECTION. *> Proporciona informacio sobre el sistema en que el progama esta escrit i executat.
       SOURCE-COMPUTER. Msi Josep. *> Ordenado on s'ha escrit el codi.
       OBJECT-COMPUTER. Msi Josep. *> Ordenador on s'executara el codi

       INPUT-OUTPUT SECTION. *> Proporciona informacio sobre els archius que s'utilitzaran en aquest programa.
       FILE-CONTROL.
       *>SELECT nombre del archivo.
       *>ASSING TO tipo de dispositiu
       *>ORGANISATION IS tipo de organitzacio.
       *>ACCESS MODE IS tipo d'acces al archiu.
       *>RECORD KEY IS clau del registre.
       *>ALTERNATE RECORD KEY IS claus alternatives de registre.
       *>FILE STATUS IS variables de estado del archivo.


       DATA DIVISION.
        FILE SECTION. *> Aqui describim tots els camps que composen els registres de tots els archius que utilitzarem.
        WORKING-STORAGE SECTION. *> Declarar variables no referents a archius pero que utilitzarem durant el programa.
        LINKAGE SECTION. *> Aquesta es la seccio d'on es registraran les variables que ens serviran per entrellaçar el programa principal amb el que utilitzarem amb el
        *>COMMUNICATION SECTION. La seccio de communicacio entre 2 programes que s'executen simultaneament.
        SCREEN SECTION. *> Aquesta seccio podrem descriure els atributs i camps a utilitzar a les pantalles.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
