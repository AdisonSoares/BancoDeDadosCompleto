/*MODELAGEM BÁSICA - ENTIDADE = TABELA
**CAMPOS = ATRIBUTOS*/
/*OBS - ATALHO PARA O BRMODELO ORGANIZAR OS DADOS CTRL+O*/
Cliente
NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

/*PROCESSOS DE MODELAGEM*/
/*FASE 01 E 02 - AD ADM DE DADOS*/
MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/*FASE 03 - DBA OU ADM DE DADOS*/
MODELAGEM FÍSICA - SCRIPTS DE BANCO

/*INICIANDO A MODELAGEM FÍSICA*/
/*CRIANDO O BANCO DE DADOS*/
CREATE DATABASE EXEMPLO;
CREATE DATABASE PROJETO;

/*CONECTANDO-SE AO BANCO*/
USE PROJETO;

/*CRIANDO A TABELA DE CLIENTES*/
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	CPF INT(11),
	EMAIL VARCHAR(30),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),
	SEXO CHAR(1)	
);

/*SINTAXE BÁSICA DE INSERÇÃO - INSERT INTO TABELA....*/

/*VERIFICANDO AS TABELAS DO BANCO*/
SHOW TABLES;

/*DESCOBRINDO A ESTRUTURA DE UMA TABELA*/
DESC CLIENTE;

/*INSERINDO DADOS OMITINDO COLUNAS - FORMA 01*/
INSERT  INTO CLIENTE VALUES('JOAO', 'M', 'JOAO@GMAIL.COM', 988638273, '22923110', 
'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT  INTO CLIENTE VALUES('CELIA', 'F', 'CELIA@GMAIL.COM', 541521456,	'25078869', 
'RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT  INTO CLIENTE VALUES('JORGE', 'M', NULL, 885755896, '54748895',
'OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/*INSERINDO DADOS COLOCANDO COLUNAS - FORMA 02*/
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF)VALUES('LILIAN', 'F',
'SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ', '947785696', 887774856);

/*INSERINDO DADOS DE FORMA COMPACTA - FORMA 03 - SOMENTE MYSQL*/
INSERT INTO CLIENTE VALUES('ANA', 'F', 'ANA@GLOBO.COM', 85548962, '548556985',
'PRES ANTONIO CARLOS - CENTRO - SÃO PAULO - SP'),('CARLA', 'F', 'CARLA@TERATI.COM', 7745828, '66587458',
'SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/*COMANDO SELECT - SELEÇÃO-PROJEÇÃO-JUNÇÃO
SELECT FAZ PARTE DE PROJEÇÃO*/
SELECT NOW() DATA_HORA;
SELECT 'FELIPE MAFRA';
SELECT 'BANCO DE DADOS';

/*ALIAS DE COLUNAS*/
SELECT NOME, SEXO, EMAIL FROM CLIENTE;
SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;
SELECT EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;
SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;/*ALIAS - PROJEÇÃO DE DADOS*/
SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;/*ALIAS - PROJEÇÃO DE DADOS*/

/*CONSULTAR A TABELA INTEIRA*/
SELECT * FROM CLIENTE;

/*FILTRANDO DADOS COM WHERE E LIKE*/
SELECT NOME, TELEFONE FROM CLIENTE;

/*FILTRANDO
UTILIZANDO WHERE*/
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';/*ESSA PESQUISA ESTÁ INCOMPLETA, PRECISAVA DO ENDEREÇO TODO*/

/*UTILIZANDO WHERE E LIKE*/
SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';/*ACONTECE O MESMO ERRO*/

/*UTILIZANDO LIKE
TRABALHA COM O CARACTER CORINGA '%' SIGNIFICA QUALQUER COISA*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';
SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';/*O '%' INDICA O PREENCHIMENTO DE CONTEÚDO ANTES JÁ QUE O 'RJ' ESTÁ NO FINAL*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%';/*O '%' PODE SER COLOCADO DEPOIS*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';/*O '%' PODE SER COLOCADO ANTES E DEPOIS*/

/*FILTRANDO VALORES NULOS
IS NULL OU IS NOT NULL*/
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

/*FILTRANDO VALORES NÃO NULOS
IS NULL OU IS NOT NULL*/
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/*UTILIZANDO UPDATE PARA ATUALIZAR DADOS QUE PODEM NÃO ESTAR PREENCHIDOS OU DESATUALIZADOS
NO EXEMPLO VAI ATUALIZAR EM TODOS OS REGISTROS NÃO APENAS NOS NULOS*/
/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;

/*COMANDO UPDATE GERAL*/
UPDATE CLIENTE
SET EMAIL = 'LILIAN@GMAIL.COM';

/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;

/*UTILIZANDO UPDATE PARA ATUALIZAR DADOS QUE PODEM NÃO ESTAR PREENCHIDOS OU DESATUALIZADOS
NO EXEMPLO VAI ATUALIZAR SELECIONANDO AS TABELAS COM WHERE*/
/*EXISTE UMA FORMA DE VOLTAR COM UMA ATUALIZAÇÃO MAL FEITA POR MEIO DOS COMANDOS
COMMIT E ROLLBACK*/
/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;

/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'JOAO@GMAIL.COM'
WHERE NOME = 'JOÃO';

/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'CELIA@GMAIL.COM'
WHERE NOME = 'CELIA';

/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'JORGE@GMAIL.COM'
WHERE NOME = 'JORGE';

/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'ANA@GMAIL.COM'
WHERE NOME = 'ANA';

/*COMANDO UPDATE ESPECIFICO*/
UPDATE CLIENTE
SET EMAIL = 'CARLA@GMAIL.COM'
WHERE NOME = 'CARLA';

/*CONSULTAR*/
SELECT NOME, EMAIL
FROM CLIENTE;


/*ANTES DE DELETAR É PRECISO CONTAR OS REGISTROS DA TABELA*/
SELECT COUNT(*) FROM CLIENTE;

/*OBSERVAÇÃO:
--TOTAL DE REGISTROS = 6*/

/*PROBLEMA QUERO DELETAR O REGISTRO 'ANA', ANTES SELECIONO A TABELA*/
SELECT * FROM CLIENTE WHERE NOME = 'ANA';

/*CASO SEJA MUITAS TABELAS A CONSULTA TEM QUE SER ESPECIFICA*/
SELECT COUNT(*) FROM CLIENTE
WHERE NOME = 'ANA';

/*OBSERVAÇÃO:
--O TOTAL DE REGISTROS DEPOIS DE DELETADO DEVERÁ SER DE 5*/

/*DELETANDO REGISTROS COM A CLAUSULA DELETE
COM WHERE O COMANDO SERÁ ESPECIFICO, NESSE CASO DELETANDO TODA A TABELA COM NOME = 'ANA' APENAS*/
DELETE FROM CLIENTE
WHERE NOME = 'ANA';

/*DEPOIS DE DELETAR É PRECISO CONTAR OS REGISTROS DA TABELA*/
SELECT COUNT(*) FROM CLIENTE;

/*OBSERVAÇÃO:
--TOTAL DE REGISTROS = 5*/

/*DELETANDO REGISTROS COM A CLAUSULA DELETE
SEM WHERE O COMANDO SERÁ GERAL, NESSE CASO DELETANDO TODA A TABELA CLIENTE*/
DELETE FROM CLIENTE;

/*COMANDOS DE CALCULADORA NO MYSQL*/
SELECT 6-1;

/*DESCREVER A TABELA PARA SABER O TIPO DE CADA DADO*/
DESC CLIENTE;

/*INSERINDO DADOS NA TABELA*/
INSERT INTO CLIENTE VALUES ('CARLA', 'F', 'CARLA.LOPES@GMAIL.COM', 45638854, '4575-0048', 'QNH 40, CASA 20, LOTE 03');

/*PROBLEMA: DELETAR O REGISTRO CARLA COM O EMAIL CARLA@GMAIL.COM
ANALISE DO CONTEUDO CERTO A SER DELETADO PARA NÃO HAVER ERROS*/

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'CARLA@GMAIL.COM';

/*OBSERVAÇÃO: A CONSULTA MOSTROU OS DOIS REGISTROS DA CARLA QUE EXISTEM
QUANDO SE USA O CONECTIVO OR É MOSTRADO TODOS OS REGISTROS COM PELO MENOS UMA DAS CONDIÇÕES*/

/*USO DO DELETE DE ACORDO COM O SELECT FEITO - OBS NÃO USAR NO EXEMPLO*/

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'CARLA@GMAIL.COM';

/*OBSERVAÇÃO: O DELETE EXCLUIU OS DOIS REGISTROS DA CARLA QUE EXISTEM
QUANDO SE USA O CONECTIVO OR É DELETADO TODOS OS REGISTROS COM PELO MENOS UMA DAS CONDIÇÕES
COMO SÓ QUERIA DELETAR UM REGISTRO ERA NECESSÁRIO ESPECIFICAR*/

/*PROBLEMA: DELETAR APENAS O REGISTRO CARLA COM O EMAIL CARLA@GMAIL.COM
ANALISE DO CONTEUDO CERTO A SER DELETADO PARA NÃO HAVER ERROS*/

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@GMAIL.COM';

/*OBSERVAÇÃO: A CONSULTA MOSTROU APENAS O REGISTROS DA CARLA COM O EMAIL = CARLA@GMAIL.COM
QUANDO SE USA O CONECTIVO AND É MOSTRADO O(S) REGISTRO(S) QUE ATENDE(M) AS DUAS CONDIÇÕES*/


/*USO DO DELETE DE ACORDO COM O SELECT FEITO */

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
AND EMAIL = 'CARLA@GMAIL.COM';

/*OBSERVAÇÃO: O DELETE EXCLUIU O REGISTRO DA CARLA COM EMAIL = CARLA@GMAIL.COM
QUANDO SE USA O CONECTIVO AND É DELETADO TODOS OS REGISTROS QUE ATENDEM AS CONDIÇÕES
DELETANDO UM REGISTRO ESPECIFICO*/

/*CONSULTAR DADOS COMPLETOS DA TABELA*/
SELECT * FROM CLIENTE;

/*COLOCANDO MAIS DADOS NO BANCO - SOBRESCREVENDO*/
UPDATE CLIENTE
SET TELEFONE = '997865421'
WHERE NOME = 'JOAO';

/*CONSULTAR DADOS COMPLETOS DA TABELA*/
SELECT * FROM CLIENTE;

/*PRIMEIRA FORMA NORMAL
 REGRAS:

 1 - TODO CAMPO VETORIZADO VAI SE TORNAR OUTRA TABELA QUE PRECISAM SER DO
 MESMO TIPO OU MESMA FAMILIA COMO DADOS NUMERICOS OU STRINGS.

 2 - TODO CAMPO MULTIVALORADO VAI SE TORNAR OUTRA TABELA OU QUANDO O CAMPO
 FOR DIVISIVEL, NÃO É UM VETOR POR TER ELEMENTOS DE TIPOS VARIADOS.

 3 - TODA A TABELA NECESSITA DE PELO MENOS UM CAMPO QUE INDENTIFIQUE TODO O REGISTRO
 COMO SENDO UNICO, OU SEJA, PRECISA DE UMA CHAVE PRIMARIA OU PRIMARY KEY.

 OBSERVACAO:
  -  QUANDO SE FAZ MODELAGEM DE NÉGOCIOS SE VALORIZA O PROCEDIMENTO INTERNOT
 DE CRIAÇÃO DE PROCESSOS E NÃO APROVEITAMENTO NO CASO DE PROCEDIMENTOS, PARA SE DEFINIR
 UMA CHAVE PRIMARIA O MAIS RECOMENDADO É CRIAR UM PRÓPRIO E NÃO APROVEITAR, COMO NO CASO
 DO CPF.
  -  EXISTEM DOIS TIPOS DE CHAVES PRIMARIAS AS NATURAIS (COMO O CPF) E AS ARTIFICIAIS (CRIADAS)
 
 */
