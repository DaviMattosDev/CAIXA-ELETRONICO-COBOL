      ******************************************************************
      * Author: Davi Mattos
      * Date: 20/06/2024
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
              IDENTIFICATION DIVISION.
       PROGRAM-ID. CEP010.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           77 WS-OPCAO PIC X(2).
           77 WS-SALDO PIC 9(10)V99 VALUE 0.
           77 WS-DEPOSITO PIC 9(10)V99 VALUE 0.
           77 WS-SAQUE PIC 9(10)V99 VALUE 0.
       PROCEDURE DIVISION.
       P001-MENU1.
           DISPLAY "------------------".
           DISPLAY "- BANCO DO DAVI -".
           DISPLAY "------------------".
           DISPLAY "1 - DEPOSITO".
           DISPLAY "2 - SAQUE".
           DISPLAY "3 - CONSULTAR SALDO".
           DISPLAY "4 - SAIR".
           ACCEPT WS-OPCAO.

           EVALUATE WS-OPCAO
               WHEN '1'
                   DISPLAY "------------------"
                   DISPLAY "- BANCO DO DAVI -"
                   DISPLAY "------------------"
                   DISPLAY "DIGITE O VALOR DO DEPOSITO"
                   ACCEPT WS-DEPOSITO
                   COMPUTE WS-SALDO = WS-SALDO + WS-DEPOSITO
                   DISPLAY "DEPOSITO EFETIVADO"
                   PERFORM P001-MENU1
               WHEN '2'
                   DISPLAY "------------------"
                   DISPLAY "- BANCO DO DAVI -"
                   DISPLAY "------------------"
                   DISPLAY "DIGITE O VALOR PARA SAQUE"
                   ACCEPT WS-SAQUE
                   IF WS-SAQUE > WS-SALDO
                       DISPLAY "SALDO INSUFICIENTE PARA OPERACAO"
                   ELSE
                       COMPUTE WS-SALDO = WS-SALDO - WS-SAQUE
                   END-IF
                   PERFORM P001-MENU1
               WHEN '3'
                   DISPLAY "------------------"
                   DISPLAY "- BANCO DO DAVI -"
                   DISPLAY "------------------"
                   DISPLAY "O SALDO DISPONIVEL É DE: " WS-SALDO "."
                   PERFORM P001-MENU1

               WHEN '4'
                   DISPLAY "OBRIGADO POR UTILIZAR NOSSO SISTEMA."
                   GOBACK
               WHEN OTHER
                   PERFORM P001-MENU1
           END-EVALUATE.

           STOP RUN.

           END PROGRAM CEP010.
1
