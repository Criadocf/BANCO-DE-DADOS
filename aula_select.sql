CREATE TABLE public.categoria (
    codigo_categoria integer NOT NULL,
    descricao character varying(30) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 56742)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cpf numeric(11,0) NOT NULL,
    rg numeric(14,0) NOT NULL,
    nome character varying(30) NOT NULL,
    data_nascimento date NOT NULL,
    ativo boolean DEFAULT true
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 56773)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    codigo_prod integer NOT NULL,
    nome_produto character varying(30) NOT NULL,
    valor numeric(9,2),
    cod_cat integer,
    CONSTRAINT produto_valor_check CHECK ((valor > (0)::numeric))
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 3002 (class 0 OID 56766)
-- Dependencies: 201
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoria (codigo_categoria, descricao) VALUES (2, 'alimentos');
INSERT INTO public.categoria (codigo_categoria, descricao) VALUES (3, 'bebidas');
INSERT INTO public.categoria (codigo_categoria, descricao) VALUES (4, 'utilidaddes');


--
-- TOC entry 3001 (class 0 OID 56742)
-- Dependencies: 200
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (4444444, 12213443, 'Pedro Lucas', '2010-01-10', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (6666666, 10101010, 'Sandra Cabral', '2001-01-01', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (7777777, 12210043, 'Ana Silva', '2012-02-12', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (5555555, 12213444, 'Mario Silva Filho', '2010-10-10', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (123456789, 98765, 'Maria Luiza', '2000-10-10', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (123456543, 76543, 'Paulo Lopes', '2000-12-15', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (232323232, 54545, 'Antonio Soares', '2000-10-30', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (87957654, 34567, 'Paula Lima', '1999-01-23', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (111111, 123456, 'Fabio Melo', '2000-12-10', false);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (2222222, 654321, 'Fabio Melo', '2000-12-10', false);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (96756, 1298, 'Ana', '2005-09-10', true);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (222, 1235, 'Ana Silva', '2020-12-09', NULL);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (12345678, 876543, 'Antonio Rodrigues', '2005-09-08', NULL);
INSERT INTO public.cliente (cpf, rg, nome, data_nascimento, ativo) VALUES (21436587, 785634, 'Ana Maria', '2009-05-23', NULL);


--
-- TOC entry 3003 (class 0 OID 56773)
-- Dependencies: 202
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.produto (codigo_prod, nome_produto, valor, cod_cat) VALUES (2, 'vassoura', 6.00, 2);


-- Completed on 2022-10-05 17:00:35

--
-- PostgreSQL database dump complete
--

/*Criar consultas para responder as perguntas
Quais os registros da tabela cliente que iniciam com a letra P?
Quais os registros da tabela cliente que terminam como nome Silva?
Quais os registros da tabela cliente que possuem data de nascimento nos dias '2001/01/01' ou '1999/01/23' ou '2005/09/08' ou '2020/12/09'?
Quais os registros da tabela cliente que possuem Silva no nome?
Quais os registros da tabela cliennte em que suas datas de nascimento não sejam '2000/10/10', nem '2000/12/10', nem '2010/10/10'?
Quais os registros da tabela cliente que não possuem valor NULL no campo ativo?
Quais os registros da tabela cliente que nasceram no ano 2010?*/


/*REGISTROS DA TABELA QUE INICIAM COM A LETRA P*/
SELECT * FROM cliente
WHERE nome LIKE 'P%'

/*REGISTROS DA TABELA QUE TERMINA COMO NOME SILVA*/
SELECT * FROM cliente
WHERE nome LIKE '%Silva'

/*REGISTROS DA TABELA QUE POSSUEM A DATA DE NASCIMENTO NOS DIAS '2001/01/01' OU '1999/01/23' OU '2005/09/08' OU '2020/12/09'*/
SELECT * FROM cliente
WHERE data_nascimento IN ('01/01/2001','23/01/1999','08/09/2005','09/12/2020')

/*REGISTROS DA TABELA QUE POSSUEM SILVA NO NOME*/
SELECT * FROM cliente
WHERE nome LIKE '%Silva%'

/*REGISTROS DA TABELA QUE NÃO POSSUEM A DATA DE NASCIMENTO '2000/10/10', NEM '2000/12/10',NEM '2010/10/10'*/
SELECT * FROM cliente
WHERE data_nascimento NOT IN ('10/10/2000', '10/12/2000','10/10/2010')

/*REGISTROS DA TABELA QUE NAO SÃO NULOS NO CAMPO ATIVO*/
SELECT * FROM cliente
WHERE ativo IS NOT NULL

/*REGISTROS DA TABELA QUE NASCERAM NO ANO DE 2010*/
SELECT * FROM cliente
WHERE data_nascimento BETWEEN '01/01/2010' AND '31/12/2010'





