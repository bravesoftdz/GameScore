DROP    PROCEDURE BUSCAR_RESULTADOS
GO

CREATE  PROCEDURE BUSCAR_RESULTADOS
(
        @INP_STATUS     VARCHAR(003)    --,
        
        --@INP_DATAJOGO   DATETIME
)

WITH
ENCRYPTION
AS

DECLARE
        @V_QTD_JOGOS            INTEGER ,
        @V_TOT_PONTOS_TEMP      INTEGER ,
        @V_MEDIA_PONTOS_JOGO    INTEGER ,
        @V_MAIOR_PONTUACAO_JOGO INTEGER ,
        @V_MENOR_PONTUACAO_JOGO INTEGER ,
        @V_RECORD               INTEGER ,
        @V_QTD_BATEU_RECORD     INTEGER ,
        @V_DATA                 DATETIME 


        IF      @INP_STATUS     =       'JGD'   GOTO    JOGOS_DISPUTADOS
        IF      @INP_STATUS     =       'PNT'   GOTO    TOTAL_PONTOS_TEMPORADA
        IF      @INP_STATUS     =       'MPJ'   GOTO    MEDIA_PONTOS_POR_JOGO
        IF      @INP_STATUS     =       'MAI'   GOTO    MAIOR_PONTUACAO_JOGO
        IF      @INP_STATUS     =       'MEN'   GOTO    MENOR_PONTUACAO_JOGO
        IF      @INP_STATUS     =       'BRC'   GOTO    BATEU_RECORD

                                                GOTO    FAZNADA


/*===========================================================================================*/
JOGOS_DISPUTADOS:
/*===========================================================================================*/
        SELECT  @V_QTD_JOGOS    =       0

        SELECT  V_QTD_JOGOS    =       COUNT(ID)
        FROM    JOGOES

        GOTO    FAZNADA
/*===========================================================================================*/
TOTAL_PONTOS_TEMPORADA:
/*===========================================================================================*/
        SELECT  @V_TOT_PONTOS_TEMP      =       0

        SELECT  @V_TOT_PONTOS_TEMP      =       SUM(PontuacaoJogo)
        FROM    JOGOES          

        GOTO    FAZNADA
/*===========================================================================================*/
MEDIA_PONTOS_POR_JOGO:
/*===========================================================================================*/
        SELECT  @V_MEDIA_PONTOS_JOGO      =       0

        SELECT  @V_MEDIA_PONTOS_JOGO    =       AVG(PontuacaoJogo)    
        FROM    JOGOES

        GOTO    FAZNADA
/*===========================================================================================*/
MAIOR_PONTUACAO_JOGO:
/*===========================================================================================*/
        SELECT  @V_MAIOR_PONTUACAO_JOGO      =       0

        SELECT  @V_MAIOR_PONTUACAO_JOGO    =       MAX(PontuacaoJogo)    
        FROM    JOGOES

/*===========================================================================================*/
MENOR_PONTUACAO_JOGO:
/*===========================================================================================*/
        SELECT  @V_MENOR_PONTUACAO_JOGO      =       0

        SELECT  @V_MENOR_PONTUACAO_JOGO    =       MIN(PontuacaoJogo)    
        FROM    JOGOES

        GOTO    FAZNADA
/*===========================================================================================*/
BATEU_RECORD:
/*===========================================================================================*/
        SELECT  @V_RECORD               =       0
        SELECT  @V_QTD_BATEU_RECORD     =       0
        SELECT  @V_DATA                 =       ''

        SELECT  @V_RECORD       =       MAX(PontuacaoJogo)    
        FROM    JOGOES
        
        SELECT  TOP 1 @V_DATA   =       DataJogo
        FROM    JOGOES          
        WHERE   PontuacaoJogo   =       @V_RECORD   

        SELECT  @V_QTD_JOGOS    =       @V_QTD_JOGOS    +       1
        FROM    JOGOES
        WHERE   PontuacaoJogo   >       @V_RECORD       AND
                DataJogo        >       @V_DATA       

        GOTO    FAZNADA
/*===========================================================================================*/
FAZNADA:
/*===========================================================================================*/                    
RETURN
