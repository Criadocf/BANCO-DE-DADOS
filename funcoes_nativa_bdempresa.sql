-- ----------------------------
-- Table structure for EMPREGADO
-- ----------------------------
CREATE TABLE empregado (
  ssn char(9) NOT NULL,
  pnome varchar(30) NOT NULL,
  inicialm char(1) default NULL,
  unome varchar(30) NOT NULL,
  sexo char(1) NOT NULL,
  endereco varchar(50) default NULL,
  datanasc date default NULL,
  superssn char(9) default NULL,
  dno char(1) NOT NULL,
  salario float default NULL,
  PRIMARY KEY  (ssn)
) ;

-- ----------------------------
-- Records of EMPREGADO
-- ----------------------------
INSERT INTO empregado VALUES ('123456789', 'Joao', 'B', 'Souza', 'M', 'R. 24 de maio, 1500 - Curitiba - PR', '1965-01-09', '333445555', '5', '30000.00');
INSERT INTO empregado VALUES ('333445555', 'Fabio', 'T', 'Will', 'M', 'R. Alagoas, 325 - Curitiba - PR', '1955-12-08', '888665555', '5', '40000.00');
INSERT INTO empregado VALUES ('999887777', 'Alice', 'J', 'Zebra', 'F', 'R. Ribeira, 98 - Pinhais - PR', '1968-01-19', '987654321', '4', '25000.00');
INSERT INTO empregado VALUES ('987654321', 'Jennifer', 'S', 'Wallace', 'F', 'R. Berry, 291 - Colombo - PR', '1941-06-20', '888665555', '4', '43000.00');
INSERT INTO empregado VALUES ('666884444', 'Ricardo', 'K', 'Nantes', 'M', 'Av. Figueira, 55 - Almirante Tamandare - PR', '1962-09-15', '333445555', '5', '38000.00');
INSERT INTO empregado VALUES ('453453453', 'Jussara', 'A', 'Pereira', 'F', 'Trav. da Lapa, 23 - Curitiba - PR', '1972-07-31', '333445555', '5', '25000.00');
INSERT INTO empregado VALUES ('987987987', 'Alberto', 'V', 'Medeiros', 'M', 'R. Ceará, 1245 - Curitiba - PR', '1969-03-29', '987654321', '4', '25000.00');
INSERT INTO empregado VALUES ('888665555', 'Joaquim', 'E', 'Brito', 'M', 'R. Stone, 450 - Curitiba - PR', '1937-11-10', null, '1', '55000.00');

-- ----------------------------
-- Table structure for DEPARTAMENTO
-- ----------------------------

CREATE TABLE departamento (
  dnumero char(1) NOT NULL,
  dnome varchar(30) NOT NULL,
  gerssn char(9) NOT NULL,
  gerdatainicio date NOT NULL,
  PRIMARY KEY  (dnumero)
) ;

-- ----------------------------
-- Records of DEPARTAMENTO
-- ----------------------------
INSERT INTO departamento VALUES ('5', 'Pesquisa', '333445555', '1988-05-22');
INSERT INTO departamento VALUES ('4', 'Administracao', '987654321', '1995-01-01');
INSERT INTO departamento VALUES ('1', 'Sede Administrativa', '888665555', '1981-06-19');

-- ----------------------------
-- Table structure for DEPENDENTE
-- ----------------------------

CREATE TABLE dependente (
  essn char(9) NOT NULL,
  nomedep varchar(30) NOT NULL default '',
  sexodep char(1) NOT NULL,
  datanascdep date NOT NULL,
  parentesco varchar(30) NOT NULL,
  PRIMARY KEY  (essn,nomedep)
) ;

-- ----------------------------
-- Records of DEPENDENTE
-- ----------------------------
INSERT INTO dependente VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'FILHA');
INSERT INTO dependente VALUES ('333445555', 'Teodoro', 'M', '1983-10-25', 'FILHO');
INSERT INTO dependente VALUES ('333445555', 'Joana', 'F', '1958-05-03', 'CONJUGE');
INSERT INTO dependente VALUES ('987654321', 'Abdala', 'M', '1942-02-28', 'CONJUGE');
INSERT INTO dependente VALUES ('123456789', 'Michel', 'M', '1988-01-04', 'FILHO');
INSERT INTO dependente VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'FILHA');
INSERT INTO dependente VALUES ('123456789', 'Elizabete', 'F', '1967-05-05', 'CONJUGE');

-- ----------------------------
-- Table structure for LOCALIZACAO
-- ----------------------------

CREATE TABLE localizacao (
  dnum char(1) NOT NULL,
  dlocalizacao varchar(30) NOT NULL,
  PRIMARY KEY  (dnum,dlocalizacao)
) ;

-- ----------------------------
-- Records of LOCALIZACAO
-- ----------------------------
INSERT INTO localizacao VALUES ('1', 'Curitiba');
INSERT INTO localizacao VALUES ('4', 'Colombo');
INSERT INTO localizacao VALUES ('5', 'Araucaria');
INSERT INTO localizacao VALUES ('5', 'Curitiba');
INSERT INTO localizacao VALUES ('5', 'Pinhais');

-- ----------------------------
-- Table structure for PROJETO
-- ----------------------------
CREATE TABLE projeto (
  pnumero char(2) NOT NULL,
  pjnome varchar(30) NOT NULL,
  plocal varchar(30) NOT NULL,
  dnum char(1) NOT NULL,
  PRIMARY KEY  (pnumero)
) ;

-- ----------------------------
-- Records of PROJETO
-- ----------------------------
INSERT INTO projeto VALUES ('1', 'ProdutoX', 'Pinhais', '5');
INSERT INTO projeto VALUES ('2', 'ProdutoY', 'Araucaria', '5');
INSERT INTO projeto VALUES ('3', 'ProdutoZ', 'Curitiba', '5');
INSERT INTO projeto VALUES ('10', 'Automatizacao', 'Pinhais', '4');
INSERT INTO projeto VALUES ('20', 'Reorganizacao', 'Curitiba', '1');
INSERT INTO projeto VALUES ('30', 'Novos Beneficios', 'Pinhais', '4');

-- ----------------------------
-- Table structure for TRABALHA
-- ----------------------------
CREATE TABLE trabalha (
  essn char(9) NOT NULL,
  pno char(2) NOT NULL,
  horas float default NULL,
  PRIMARY KEY  (essn,pno)
) ;

-- ----------------------------
-- Records of TRABALHA
-- ----------------------------
INSERT INTO trabalha VALUES ('123456789', '1', '32.5');
INSERT INTO trabalha VALUES ('123456789', '2', '7.5');
INSERT INTO trabalha VALUES ('666884444', '3', '40');
INSERT INTO trabalha VALUES ('453453453', '1', '20');
INSERT INTO trabalha VALUES ('453453453', '2', '20');
INSERT INTO trabalha VALUES ('333445555', '2', '10');
INSERT INTO trabalha VALUES ('333445555', '3', '10');
INSERT INTO trabalha VALUES ('333445555', '10', '10');
INSERT INTO trabalha VALUES ('333445555', '20', '10');
INSERT INTO trabalha VALUES ('999887777', '30', '30');
INSERT INTO trabalha VALUES ('999887777', '10', '10');
INSERT INTO trabalha VALUES ('987987987', '10', '35');
INSERT INTO trabalha VALUES ('987987987', '30', '5');
INSERT INTO trabalha VALUES ('987654321', '30', '20');
INSERT INTO trabalha VALUES ('987654321', '20', '15');
INSERT INTO trabalha VALUES ('888665555', '20', null);

-- ------------------------------
-- Restrições - CONSTRAINTS
-- ------------------------------
ALTER TABLE empregado ADD CONSTRAINT fk_empregado_empregado  FOREIGN KEY (superssn) REFERENCES  empregado (ssn);
ALTER TABLE empregado ADD CONSTRAINT fk_empregado_departamento FOREIGN KEY  (dno) REFERENCES  departamento (dnumero) ;

ALTER TABLE departamento ADD CONSTRAINT fk_departamento_empregado FOREIGN KEY (gerssn) REFERENCES  empregado (ssn) ;

ALTER TABLE dependente ADD CONSTRAINT fk_dependente_empregado FOREIGN KEY (essn) REFERENCES empregado (ssn) ;

ALTER TABLE localizacao ADD CONSTRAINT fk_localizacao_departamento FOREIGN KEY (dnum) REFERENCES  departamento (dnumero) ;



-- /*FUNÇÕES NATIVAS
Informações do sistema e de sessão
Obter versão do SGBD, data/hora do sistema, usuário e database atuais.*/

--Retorna a versão do PostgreSQL
SELECT version();
--Retorna a data e hora atual do Servidor
SELECT now();
--Retorna o usuário atual
SELECT current_user;
--Retorna a banco de dados conectado
SELECT current_database();

--Manipulação de data/hora
/*Obter data e hora atuais e 
obter partes do timestamp 
(Padrão SQL-2003).*/
SELECT current_date, 
	   current_time, 
	   localtimestamp;

/*EXTRACT(field FROM timestamp)
Onde field pode ser qualquer um dos seguintes identificadores:
century, day, decade
dow / isodow: dia da semana
sendo Sunday(0/1) to Saturday(6/7)
doy: dia do ano (1: 365/366)
epoch, hour, microseconds, millennium
milliseconds, minute, Month, quarter
second, timezone, timezone_hour, timezone_minute
week, year / isoyear*/

-- Uso de operador para calcular a 
-- diferença de anos.
SELECT pnome,
EXTRACT(YEAR FROM NOW()) -
EXTRACT(YEAR FROM datanasc)
AS idade
FROM empregado;

--Função AGE
SELECT pnome, AGE(datanasc) AS idade
FROM empregado;

--Função DATE_PART utiliza os mesmos 
--identificadores de EXTRACT
--DATE_PART(text, timestamp)

SELECT EXTRACT(CENTURY FROM NOW()) as seculo,
	   DATE_PART('doy', NOW()) as diasano, 
	   DATE_PART('day', NOW()) as diaatual,
	   DATE_PART('hour', NOW()) as hora, 
	   DATE_PART('month', NOW()) as mesatual,
	   DATE_PART('epoch', NOW()) as seconds;

--Calcular nova data a partir de um 
--intervalo específico:
SELECT date '2022-11-10' AS compra,
date '2022-11-10' + 30 AS vencimento;

--Calcular intervalo de dias entre datas.
SELECT date '2014-03-28' - 
	   date '2014-03-12' as diferenca;

--Calcular intervalo de tempo entre horas, minutos e segundos.
SELECT time '05:00:30' - 
	   time '03:00:46';
--Calcular novo tempo a partir de intervalo
SELECT timestamp '2001-09-28 23:00' – 
       interval '28 hours';

SELECT 500 * interval '1 second';

--Manipulação de String
--Concatenação: operador ||.
SELECT pnome || ' ' || inicialm || '. ' || unome
AS “Nome Completo” FROM empregado;

--Conversão caixa alta–UPPER e caixa baixa-LOWER.
SELECT UPPER('banco'), LOWER('BANCO');

SELECT * 
FROM empregado
WHERE UPPER(pnome) = 'JOAO';

SELECT * 
FROM empregado
WHERE LOWER(pnome) = 'joao';

--Busca de string em caixa alta ou baixa
-- Função ILIKE (nativa postgres)
SELECT  * from  empregado
where pnome ILIKE 'JOAO';

--Obter número de caracteres em uma string 
--(length).
SELECT CHAR_LENGTH('banco '); -- 6

--Converte a 1ª letra de cada palavra em 
--caixa alta.
SELECT INITCAP('oi MUNDO');


/*Extensão UNACCENT
O unaccent é um dicionário de pesquisa de 
texto que remove os acentos (sotaques) dos lexemes. 
É um dicionário de filtragem, isso permite o processamento
insensível ao acento/sotaque para pesquisa 
completa de texto.*/

CREATE extension unaccent;

SELECT unaccent('sebastião');

SELECT * FROM empregado
where unaccent(pnome) ILIKE 'joao';

--Manipulação de números

Operador Descrição 		Exemplo   Resultado
+ 	  adição    		2 + 3   	=5
– 	  subtração 		2 – 3   	=1
* 	  multiplicação 	2 * 3	 	=6
/ 	  divisão (divisão 
	  inteira trunca o 
	  resultado 		04/fev  	=2
% 	  módulo (resto) 	5 % 4 	 	=1
^ 	  exponenciação 	2.0 ^ 3.0 	=8
|/ 	  raiz quadrada 	|/ 27.0 	=5
||/ 	  raiz cúbica 	||/ 27.0 	=3
! 	  fatorial 		5 ! 		=120
!! 	  fatorial (operador
	  de prefixo) 	!! 5 		=120
@ 	  Valor absoluto 	@ - 5.0 	=5
& 	  AND bit a bit 	91 & 15 	=11
| 	  OR bit a bit 	32 | 3 	=35
# 	  XOR bit a bit 	17 # 5 	=20
~ 	  NOT bit a bit 	~ 1 		=-2
<< 	  deslocamento à 
	  esquerda bit a bit 1 << 4 	16
>> 	  deslocamento à 
	  direita bit a bit 	20 >> 4 	1

-- FUNÇÕES
Função Descrição Exemplo Resultado
abs() valor absoluto abs(-17.4) 17.4
cbrt() raiz cúbica cbrt(27.0) 3
ceil() o menor inteiro não menor que
o argumento ceil(-42.8) -42
exp() exponenciação exp(1.0) 2.71828182845905
floor() o maior inteiro não maior que o
argumento floor(-42.8) -43
log() logaritmo na base 10 log(100.0) 2
mod(x,y) resto de y/x mod(9,4) 1
pi() constante “π” pi() 3.14159265358979
power(a,b) a elevado a b power(9.0, 3.0) 729
random() valor randômico entre 0.0 e 1.0 random()
round() arredondar para o inteiro mais
próximo round(42.4) 42
round(v,s) arredondar para s casas decimais
round(42.4382, 2) 42.44
setseed() define a semente para as chamadas
a random() setseed(0.54823) 1177314959
sqrt() raiz quadrada sqrt(2.0) 1.4142135623731
trunc() trunca em direção ao zero trunc(42.8) 42
trunc(v,s) trunca com s casas decimais trunc(42.4382, 2) 42.43

/* SUBCONSULTAS
Existem três tipos de subconsultas: q
ESCALAR: retorna um único valor.
ÚNICA LINHA: retorna uma lista de valores.
TABELA: retorna uma ou mais colunas e múltiplas 
linhas.
É importante lembrar que as subconsultas devem ser sempre escritas entre
parênteses: ‘(q)’.*/



--Exemplos de Subconsultas ESCALAR
/*Listar os empregados que trabalham no 
departamento de Pesquisa.*/

SELECT ssn, pnome, salario
FROM empregado
WHERE dno = (SELECT dnumero
		FROM departamento
		WHERE dnome = 'Pesquisa')
;

/*Listar os empregados cujos salários são 
maiores do que o salário médio, mostrando 
o quanto são maiores (a diferença).*/

SELECT ssn, pnome, 
       salario - (SELECT AVG(salario)
		    FROM empregado) AS difSal
FROM empregado
WHERE salario > (SELECT AVG(salario)
		   FROM empregado)
;

/*Listar o nome do empregado e do departamento 
onde o empregado mais novo do sexo masculino 
está alocado.*/

SELECT e.pnome, d.dnome, AGE(e.datanasc)
FROM empregado e INNER JOIN departamento d 
		   ON d.dnumero = e.dno
WHERE AGE(e.datanasc) = (SELECT MIN(age(e.datanasc))
			    FROM empregado e
			    WHERE e.sexo = 'M')
;

--Exemplos de Subconsulta ÚNICA LINHA

Funcoes Nativas.sql
Exibindo Funcoes Nativas.sql…
Funções Nativas
Eduilson Livio Neves
•
22 de nov.
Arquivo com vários exemplos de Funções Nativas para operações de Data, Hora, String e Números.
Exemplos de Subconsultas

Funcoes Nativas.sql
Texto
Comentários da turma


ALTER TABLE proejto ADD CONSTRAINT fk_proejto_departamento FOREIGN KEY (dnum) REFERENCES  departamento (dnumero) ;

ALTER TABLE trabalha ADD CONSTRAINT fk_trabalha_empregado FOREIGN KEY (essn) REFERENCES  empregado (ssn) ;
ALTER TABLE trabalha ADD CONSTRAINT fk_trabalha_proejto FOREIGN KEY (pno) REFERENCES  proejto (pnumero) ;