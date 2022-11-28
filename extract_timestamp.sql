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



SELECT EXTRACT(day FROM now());

SELECT EXTRACT(century FROM now());

SELECT EXTRACT(doy FROM now());

SELECT pnome,
	EXTRACT(year FROM now())-
	EXTRACT(year FROM datanasc) as idade
FROM empregado;

SELECT pnome, AGE(datanasc) as idade
	FROM empregado;



--DATE_PART(text, timestamp)
SELECT EXTRACT(century FROM now()) as seculo,
	DATE_PART('doy', now()) as dias_ano,
	DATE_PART('day', now()) as dias_atual,
	DATE_PART('hour', now()) as hora,
	DATE_PART('month', now()) as mes_atual;

SELECT date '2022-11-10' as compra,
	date '2022-11-10' + 30 as vencimento;

SELECT date '2014-03-28' - date '2014-03-12' as diferenca;

SELECT time '05:00:30' - time '03:00:46' ;

SELECT timestamp '2001-09-20 23:00' - interval '28 hours';  --timestamp é "DATA E HORA"

SELECT 500 * interval '1 seconds';