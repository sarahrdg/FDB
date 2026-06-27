-- ---------------------------------------------------------------------
-- 1. CONSULTAS 
-- ---------------------------------------------------------------------

-- (1) Alunos cujo plano de matrícula é "Anual"
SELECT a.nome, m.plano, m.status
FROM Alunos a
JOIN Matriculas m ON m.id_aluno = a.id_aluno
WHERE m.plano = 'Anual';
/*
Saida:
Samuel Bandeira	Anual	cancelado
Maitê Carneiro	Anual	ativo
Arthur Miguel Sales	Anual	cancelado
Lavínia Rangel	Anual	ativo
Arthur Miguel Sales	Anual	cancelado
Gabriel Rocha	Anual	ativo
Vicente Galvão	Anual	cancelado
Benício Trindade	Anual	cancelado
Benício Trindade	Anual	ativo
Nicolas Falcão	Anual	ativo
Enzo Gabriel Teles	Anual	ativo
Esther Camargo	Anual	cancelado
Samuel Bandeira	Anual	inativo
*/

-- (2) Instrutores especializados em Crossfit
SELECT nome, especialidade, telefone
FROM Instrutores
WHERE especialidade = 'Crossfit';
/*
Ricardo Souza	Crossfit	85966665555
Júlio Salgado	Crossfit	85981691040
*/

-- (3) Pagamentos com valor acima de R$ 500,00
SELECT id_pagamento, id_matricula, valor, forma_pagamento
FROM Pagamentos
WHERE valor > 500.00;
/*
1	30	600.00	Boleto
6	16	1100.00	Pix
7	18	605.00	Boleto
12	45	1095.00	Pix
13	34	590.00	Cartão de Crédito
15	49	590.00	Boleto
18	26	1100.00	Cartão de Débito
19	43	610.00	Boleto
21	48	610.00	Cartão de Débito
22	45	1105.00	Cartão de Débito
24	21	1100.00	Dinheiro
25	49	600.00	Cartão de Crédito
29	19	1090.00	Cartão de Crédito
30	20	1100.00	Dinheiro
33	41	1100.00	Boleto
34	7	1100.00	Dinheiro
35	19	1105.00	Boleto
38	5	605.00	Pix
40	10	1090.00	Dinheiro
41	20	1100.00	Pix
45	29	595.00	Dinheiro
46	28	1095.00	Dinheiro
47	4	1110.00	Pix
48	49	590.00	Cartão de Crédito
50	16	1090.00	Pix
*/

-- (4) Turmas que ocorrem às segundas-feiras
SELECT id_turma, id_instrutor, id_modalidade, horario, dia_semana
FROM Turmas
WHERE dia_semana = 'Segunda';
/*
4	27	13	06:30:00	Segunda
24	33	34	07:00:00	Segunda
28	16	38	18:30:00	Segunda
34	30	21	20:00:00	Segunda
47	33	32	08:00:00	Segunda
*/

-- (5) Matrículas com status diferente de "ativo"
SELECT id_matricula, id_aluno, plano, status
FROM Matriculas
WHERE status <> 'ativo';
/*
1	29	Anual	cancelado
3	35	Semestral	cancelado
7	23	Anual	cancelado
11	18	Mensal	inativo
14	15	Trimestral	inativo
16	23	Anual	cancelado
20	47	Anual	cancelado
21	33	Anual	cancelado
22	13	Mensal	inativo
24	28	Semestral	cancelado
29	40	Semestral	inativo
31	14	Semestral	inativo
32	29	Trimestral	cancelado
37	16	Mensal	inativo
38	27	Trimestral	inativo
40	42	Mensal	inativo
42	36	Mensal	inativo
43	9	Semestral	inativo
44	40	Anual	cancelado
45	29	Anual	inativo
46	17	Semestral	cancelado
49	18	Semestral	cancelado
*/

-- ---------------------------------------------------------------------
-- 2. CONSULTAS COM JOIN — INNER / LEFT (5)
-- ---------------------------------------------------------------------

-- (1) INNER JOIN: lista de turmas com nome do instrutor e da modalidade
SELECT t.id_turma, i.nome AS instrutor, mo.nome AS modalidade, t.dia_semana, t.horario
FROM Turmas t
INNER JOIN Instrutores i ON i.id_instrutor = t.id_instrutor
INNER JOIN Modalidades mo ON mo.id_modalidade = t.id_modalidade;
/*
1	Wesley Bezerra	Treino Indoor	Sexta	07:30
2	Diego Martins	Spinning Musical	Sexta	18:30
3	Vitor Hugo Macedo	Ballet Fitness	Quinta	20:00
4	Daniel Correia	Alongamento	Segunda	06:30
5	Wesley Bezerra	Defesa Pessoal	Quinta	09:00
6	Daniel Correia	Treino Funcional com Halteres	Sábado	20:30
7	Juliana Pereira	Treino de Potência	Sábado	19:00
8	Bruno Carvalho	Pilates	Sábado	10:00
9	Bianca Cunha	Jiu-Jitsu	Terça	07:30
10	Felipe Nunes	Pilates Solo	Terça	17:00
11	Mariana Aguiar	Muay Thai	Quinta	08:00
12	Priscila Dantas	Natação	Sexta	17:00
13	Bruno Carvalho	Pilates	Sexta	19:00
14	Carlos Silva	Spinning	Terça	20:00
15	Eduardo Tavares	Spinning Avançado	Quinta	17:00
16	Vanessa Caldas	Cross Training	Terça	06:00
17	Gustavo Lopes	Musculação	Quarta	10:00
18	Carolina Freitas	Step	Sábado	10:00
19	Caio Fontoura	Pilates com Aparelhos	Sábado	19:00
20	Débora Siqueira	Boxe	Quarta	07:30
21	Vanessa Caldas	Pilates	Sábado	18:30
22	Igor Sampaio	Pilates	Quarta	19:30
23	Juliana Pereira	Pilates	Quinta	18:30
24	Marcelo Cavalcante	Treino de Resistência	Segunda	07:00
25	Marcelo Cavalcante	Spinning	Terça	20:30
26	Marcos Andrade	Treino Outdoor	Sábado	06:30
27	Priscila Dantas	Cross Training	Sexta	06:30
28	Priscila Dantas	Boxe Fitness	Segunda	18:30
29	Paula Esteves	Spinning	Sábado	10:00
30	Simone Albuquerque	Jiu-Jitsu Infantil	Quarta	18:00
31	Leandro Pinto	Hidroginástica	Sábado	19:00
32	Rodrigo Castro	Ballet Fitness	Quinta	08:00
33	Diego Martins	Natação Adaptada	Quarta	19:00
34	Carolina Freitas	Ginástica Artística	Segunda	20:00
35	Carlos Silva	Treino Funcional com Halteres	Sexta	18:30
36	Bruno Carvalho	Natação	Terça	18:00
37	Marcelo Cavalcante	Capoeira	Quarta	07:00
38	Marcos Andrade	Ballet Fitness	Quarta	09:00
39	Eduardo Tavares	Natação Infantil	Sexta	20:30
40	Sabrina Holanda	Aero Combat	Sábado	18:30
41	Amanda Ribeiro	Musculação	Sexta	19:00
42	Tatiane Moreira	Natação Adaptada	Terça	06:30
43	Leandro Pinto	Dança	Sábado	06:30
44	Luana Pacheco	Boxe	Quarta	08:00
45	Hugo Leite	Hidroginástica	Quarta	19:30
46	Vanessa Caldas	Treino de Potência	Quarta	19:00
47	Marcelo Cavalcante	Treino Indoor	Segunda	08:00
48	Patrícia Gomes	Treino Funcional Iniciante	Quarta	10:00
49	Ricardo Souza	Musculação	Terça	09:00
50	Fábio Quaresma	Capoeira	Sábado	07:00
*/

-- (2) INNER JOIN: pagamentos com o nome do aluno e o plano da matrícula
SELECT p.id_pagamento, al.nome AS aluno, m.plano, p.valor, p.data_pagamento
FROM Pagamentos p
INNER JOIN Matriculas m ON m.id_matricula = p.id_matricula
INNER JOIN Alunos al ON al.id_aluno = m.id_aluno;
/*
1	Maitê Carneiro	Semestral	600.00	2026-01-05
2	Lucas Gabriel Souza	Trimestral	330.00	2026-05-17
3	Sarah Quintela	Mensal	120.00	2026-01-31
4	Larissa Mendes	Trimestral	335.00	2026-02-19
5	Agatha Siqueira	Trimestral	340.00	2026-06-18
6	Arthur Miguel Sales	Anual	1100.00	2026-07-13
7	Ana Clara Figueiredo	Semestral	605.00	2026-06-05
8	Valentina Aragão	Mensal	130.00	2026-05-23
9	Davi Lucca Pires	Mensal	120.00	2026-03-22
10	Lucas Gabriel Souza	Trimestral	335.00	2026-05-07
11	Laura Beatriz Nóbrega	Mensal	115.00	2026-01-16
12	Samuel Bandeira	Anual	1095.00	2026-02-27
13	Benício Trindade	Semestral	590.00	2026-06-21
14	Agatha Siqueira	Trimestral	335.00	2026-06-25
15	Manuela Rezende	Semestral	590.00	2026-04-18
16	Maitê Carneiro	Mensal	120.00	2026-03-20
17	João Pedro Alves	Mensal	120.00	2026-02-07
18	Benício Trindade	Anual	1100.00	2026-03-28
19	Rafael Barbosa	Semestral	610.00	2026-05-10
20	Davi Lucca Pires	Mensal	130.00	2026-02-18
21	Samuel Bandeira	Semestral	610.00	2026-01-30
22	Samuel Bandeira	Anual	1105.00	2026-02-18
23	Laura Beatriz Nóbrega	Mensal	110.00	2026-01-11
24	Benício Trindade	Anual	1100.00	2026-02-22
25	Manuela Rezende	Semestral	600.00	2026-04-01
26	Enzo Gabriel Teles	Trimestral	330.00	2026-01-22
27	Agatha Siqueira	Trimestral	340.00	2026-07-04
28	Agatha Siqueira	Trimestral	325.00	2026-04-16
29	Gabriel Rocha	Anual	1090.00	2026-06-13
30	Vicente Galvão	Anual	1100.00	2026-04-13
31	Ana Clara Figueiredo	Mensal	115.00	2026-04-17
32	Davi Lucca Pires	Mensal	115.00	2026-03-01
33	Enzo Gabriel Teles	Anual	1100.00	2026-03-11
34	Arthur Miguel Sales	Anual	1100.00	2026-05-24
35	Gabriel Rocha	Anual	1105.00	2026-06-17
36	Davi Lucca Pires	Mensal	110.00	2026-04-06
37	Laura Beatriz Nóbrega	Mensal	120.00	2026-01-23
38	Lucas Gabriel Souza	Semestral	605.00	2026-04-04
39	Valentina Aragão	Mensal	120.00	2026-05-23
40	Lavínia Rangel	Anual	1090.00	2026-04-21
41	Vicente Galvão	Anual	1100.00	2026-03-29
42	Davi Lucca Pires	Mensal	120.00	2026-02-20
43	Agatha Siqueira	Trimestral	330.00	2026-05-02
44	Larissa Mendes	Trimestral	340.00	2026-02-17
45	Esther Camargo	Semestral	595.00	2026-06-22
46	Nicolas Falcão	Anual	1095.00	2026-07-08
47	Maitê Carneiro	Anual	1110.00	2026-03-09
48	Manuela Rezende	Semestral	590.00	2026-04-16
49	Laura Beatriz Nóbrega	Mensal	120.00	2026-01-10
50	Arthur Miguel Sales	Anual	1090.00	2026-07-01
*/

-- (3) INNER JOIN: alunos e as turmas em que estão matriculados (N:N)
SELECT al.nome AS aluno, t.id_turma, mo.nome AS modalidade, t.dia_semana, t.horario
FROM Aluno_turma at2
INNER JOIN Alunos al ON al.id_aluno = at2.id_aluno
INNER JOIN Turmas t ON t.id_turma = at2.id_turma
INNER JOIN Modalidades mo ON mo.id_modalidade = t.id_modalidade;
/*
Heitor Salviano	45	Hidroginástica	Quarta	19:30
Mariana Cordeiro	14	Spinning	Terça	20:00
Alice Bittencourt	27	Cross Training	Sexta	06:30
Murilo Espíndola	30	Jiu-Jitsu Infantil	Quarta	18:00
Ana Clara Figueiredo	14	Spinning	Terça	20:00
Heitor Salviano	50	Capoeira	Sábado	07:00
Esther Camargo	2	Spinning Musical	Sexta	18:30
Heitor Salviano	31	Hidroginástica	Sábado	19:00
Arthur Miguel Sales	20	Boxe	Quarta	07:30
Mariana Cordeiro	35	Treino Funcional com Halteres	Sexta	18:30
Anthony Vidal	15	Spinning Avançado	Quinta	17:00
Enzo Gabriel Teles	18	Step	Sábado	10:00
Agatha Siqueira	2	Spinning Musical	Sexta	18:30
Arthur Miguel Sales	43	Dança	Sábado	06:30
Heitor Salviano	21	Pilates	Sábado	18:30
Larissa Mendes	31	Hidroginástica	Sábado	19:00
Ana Clara Figueiredo	2	Spinning Musical	Sexta	18:30
Antonella Brasil	37	Capoeira	Quarta	07:00
Maria Eduarda Costa	6	Treino Funcional com Halteres	Sábado	20:30
Esther Camargo	9	Jiu-Jitsu	Terça	07:30
Ana Clara Figueiredo	4	Alongamento	Segunda	06:30
Heitor Salviano	26	Treino Outdoor	Sábado	06:30
Larissa Mendes	21	Pilates	Sábado	18:30
Laura Beatriz Nóbrega	25	Spinning	Terça	20:30
Laura Beatriz Nóbrega	27	Cross Training	Sexta	06:30
Beatriz Oliveira	31	Hidroginástica	Sábado	19:00
Sarah Quintela	35	Treino Funcional com Halteres	Sexta	18:30
Esther Camargo	15	Spinning Avançado	Quinta	17:00
Lucas Gabriel Souza	49	Musculação	Terça	09:00
Larissa Mendes	16	Cross Training	Terça	06:00
Isabela Santos	37	Capoeira	Quarta	07:00
Beatriz Oliveira	37	Capoeira	Quarta	07:00
Heitor Salviano	45	Hidroginástica	Quarta	19:30
Maria Luiza Botelho	24	Treino de Resistência	Segunda	07:00
Davi Miguel Rios	3	Ballet Fitness	Quinta	20:00
Antonella Brasil	39	Natação Infantil	Sexta	20:30
Davi Miguel Rios	11	Muay Thai	Quinta	08:00
Gabriel Rocha	38	Ballet Fitness	Quarta	09:00
Alice Bittencourt	37	Capoeira	Quarta	07:00
Larissa Mendes	25	Spinning	Terça	20:30
Esther Camargo	38	Ballet Fitness	Quarta	09:00
Laura Beatriz Nóbrega	7	Treino de Potência	Sábado	19:00
Sarah Quintela	22	Pilates	Quarta	19:30
Murilo Espíndola	3	Ballet Fitness	Quinta	20:00
Davi Miguel Rios	28	Boxe Fitness	Segunda	18:30
Vicente Galvão	5	Defesa Pessoal	Quinta	09:00
Mariana Cordeiro	47	Treino Indoor	Segunda	08:00
Nicolas Falcão	27	Cross Training	Sexta	06:30
Maria Luiza Botelho	11	Muay Thai	Quinta	08:00
Cecília Drumond	5	Defesa Pessoal	Quinta	09:00
Yasmin Pacheco	9	Jiu-Jitsu	Terça	07:30
*/

-- (4) LEFT JOIN: todos os alunos e suas matrículas (mostra também quem não tem matrícula, se houver)
SELECT al.nome AS aluno, m.id_matricula, m.plano, m.status
FROM Alunos al
LEFT JOIN Matriculas m ON m.id_aluno = al.id_aluno;
/*
João Pedro Alves	2	Mensal	ativo
João Pedro Alves	23	Trimestral	ativo
Maria Eduarda Costa	NULL	NULL	NULL
Lucas Gabriel Souza	5	Semestral	ativo
Lucas Gabriel Souza	12	Trimestral	ativo
Beatriz Oliveira	NULL	NULL	NULL
Pedro Henrique Lima	NULL	NULL	NULL
Larissa Mendes	50	Trimestral	ativo
Gabriel Rocha	19	Anual	ativo
Isabela Santos	NULL	NULL	NULL
Rafael Barbosa	43	Semestral	inativo
Sophia Carvalho	NULL	NULL	NULL
Matheus Cardoso	NULL	NULL	NULL
Ana Clara Figueiredo	9	Mensal	ativo
Ana Clara Figueiredo	18	Semestral	ativo
Davi Lucca Pires	36	Mensal	ativo
Davi Lucca Pires	22	Mensal	inativo
Helena Vargas	31	Semestral	inativo
Enzo Gabriel Teles	41	Anual	ativo
Enzo Gabriel Teles	14	Trimestral	inativo
Valentina Aragão	37	Mensal	inativo
Bernardo Cunha	46	Semestral	cancelado
Manuela Rezende	11	Mensal	inativo
Manuela Rezende	49	Semestral	cancelado
Lorenzo Azevedo	NULL	NULL	NULL
Alice Bittencourt	NULL	NULL	NULL
Théo Wagner	25	Mensal	ativo
Laura Beatriz Nóbrega	15	Mensal	ativo
Laura Beatriz Nóbrega	17	Mensal	ativo
Arthur Miguel Sales	7	Anual	cancelado
Arthur Miguel Sales	16	Anual	cancelado
Arthur Miguel Sales	6	Trimestral	ativo
Cecília Drumond	NULL	NULL	NULL
Heitor Salviano	NULL	NULL	NULL
Mariana Cordeiro	27	Trimestral	ativo
Nicolas Falcão	28	Anual	ativo
Nicolas Falcão	38	Trimestral	inativo
Yasmin Pacheco	24	Semestral	cancelado
Samuel Bandeira	1	Anual	cancelado
Samuel Bandeira	45	Anual	inativo
Samuel Bandeira	48	Semestral	ativo
Samuel Bandeira	32	Trimestral	cancelado
Luiza Honorato	13	Semestral	ativo
Caleb Marinho	33	Mensal	ativo
Agatha Siqueira	39	Trimestral	ativo
Agatha Siqueira	47	Trimestral	ativo
Benício Trindade	26	Anual	ativo
Benício Trindade	21	Anual	cancelado
Benício Trindade	34	Semestral	ativo
Liz Patrícia Goulart	NULL	NULL	NULL
Joaquim Estevão	3	Semestral	cancelado
Maitê Carneiro	4	Anual	ativo
Maitê Carneiro	42	Mensal	inativo
Maitê Carneiro	30	Semestral	ativo
Davi Miguel Rios	NULL	NULL	NULL
Antonella Brasil	NULL	NULL	NULL
Anthony Vidal	NULL	NULL	NULL
Esther Camargo	44	Anual	cancelado
Esther Camargo	29	Semestral	inativo
Pietro Albano	NULL	NULL	NULL
Sarah Quintela	40	Mensal	inativo
Bryan Olímpio	NULL	NULL	NULL
Melissa Vidigal	NULL	NULL	NULL
Emanuel Castelo	NULL	NULL	NULL
Júlia Marinho Reis	NULL	NULL	NULL
Vicente Galvão	20	Anual	cancelado
Lavínia Rangel	10	Anual	ativo
Lavínia Rangel	8	Trimestral	ativo
Murilo Espíndola	35	Semestral	ativo
Maria Luiza Botelho	NULL	NULL	NULL

Observação: vários alunos aparecem com NULL porque, embora cadastrados na tabela Alunos,
não possuem registro correspondente em Matriculas. É exatamente isso que o LEFT JOIN evidencia.
*/

-- (5) LEFT JOIN: todas as turmas e os alunos vinculados (mostra turmas sem aluno também)
SELECT t.id_turma, mo.nome AS modalidade, at2.id_aluno
FROM Turmas t
LEFT JOIN Aluno_turma at2 ON at2.id_turma = t.id_turma
LEFT JOIN Modalidades mo ON mo.id_modalidade = t.id_modalidade
ORDER BY t.id_turma;
/*
1	Treino Indoor	NULL
2	Spinning Musical	32
2	Spinning Musical	35
2	Spinning Musical	45
3	Ballet Fitness	37
4	Alongamento	12
5	Defesa Pessoal	24
6	Treino Funcional com Halteres	2
7	Treino de Potência	16
8	Pilates	NULL
9	Jiu-Jitsu	28
9	Jiu-Jitsu	30
10	Pilates Solo	40
11	Muay Thai	50
12	Natação	NULL
13	Pilates	16
14	Spinning	4
14	Spinning	46
15	Spinning Avançado	23
15	Spinning Avançado	39
16	Cross Training	NULL
17	Musculação	NULL
18	Step	15
19	Pilates com Aparelhos	NULL
20	Boxe	23
21	Pilates	25
21	Pilates	30
22	Pilates	42
23	Pilates	NULL
24	Treino de Resistência	28
24	Treino de Resistência	50
25	Spinning	49
26	Treino Outdoor	25
27	Cross Training	27
27	Cross Training	49
28	Boxe Fitness	35
29	Spinning	NULL
30	Jiu-Jitsu Infantil	35
31	Hidroginástica	6
31	Hidroginástica	9
31	Hidroginástica	25
32	Ballet Fitness	27
33	Natação Adaptada	NULL
34	Ginástica Artística	NULL
35	Treino Funcional com Halteres	27
35	Treino Funcional com Halteres	48
36	Natação	NULL
37	Capoeira	8
37	Capoeira	20
37	Capoeira	38
38	Ballet Fitness	5
38	Ballet Fitness	7
39	Natação Infantil	39
39	Natação Infantil	44
40	Aero Combat	NULL
41	Musculação	NULL
42	Natação Adaptada	NULL
43	Dança	22
44	Boxe	NULL
45	Hidroginástica	25
45	Hidroginástica	30
46	Treino de Potência	NULL
47	Treino Indoor	26
48	Treino Funcional Iniciante	NULL
49	Musculação	3
50	Capoeira	5
50	Capoeira	25
*/

-- ---------------------------------------------------------------------
-- 3. CONSULTAS COM GROUP BY 
-- ---------------------------------------------------------------------

-- (1) GROUP BY: quantidade de matrículas por plano
SELECT plano, COUNT(*) AS qtd_matriculas
FROM Matriculas
GROUP BY plano;
/*
Anual	13
Mensal	12
Semestral	14
Trimestral	11
*/

-- (2) GROUP BY: valor total pago por forma de pagamento
SELECT forma_pagamento, SUM(valor) AS total_recebido
FROM Pagamentos
GROUP BY forma_pagamento;
/*
Boleto	5665.00
Cartão de Crédito	3990.00
Cartão de Débito	4270.00
Dinheiro	7110.00
Pix	6565.00
*/

-- (3) GROUP BY: quantidade de turmas por instrutor
SELECT i.nome AS instrutor, COUNT(t.id_turma) AS qtd_turmas
FROM Instrutores i
LEFT JOIN Turmas t ON t.id_instrutor = i.id_instrutor
GROUP BY i.id_instrutor, i.nome;
/*
Carlos Silva	2
Fernanda Lima	0
Ricardo Souza	1
Juliana Pereira	2
Marcos Andrade	2
Patrícia Gomes	1
Bruno Carvalho	3
Aline Rodrigues	0
Diego Martins	2
Camila Ferreira	0
Eduardo Tavares	2
Renata Brito	0
Felipe Nunes	1
Vanessa Caldas	3
Thiago Moura	0
Priscila Dantas	3
Leandro Pinto	2
Cláudia Ramos	0
Vinícius Teixeira	0
Tatiane Moreira	1
Rodrigo Castro	1
Bianca Cunha	1
André Farias	0
Letícia Vasconcelos	0
Gustavo Lopes	1
Natália Borges	0
Daniel Correia	2
Mariana Aguiar	1
Rafael Coelho	0
Carolina Freitas	2
Vitor Hugo Macedo	1
Débora Siqueira	1
Marcelo Cavalcante	4
Amanda Ribeiro	1
Igor Sampaio	1
Luana Pacheco	1
Eduardo Brandão	0
Simone Albuquerque	1
Hugo Leite	1
Paula Esteves	1
Fábio Quaresma	1
Cristina Monteiro	0
Wesley Bezerra	2
Adriana Melo	0
Otávio Guedes	0
Sabrina Holanda	1
Caio Fontoura	1
Yasmin Drummond	0
Júlio Salgado	0
Renata Vilar	0
*/

-- (4) GROUP BY + HAVING: instrutores que dão mais de 1 turma
SELECT i.nome AS instrutor, COUNT(t.id_turma) AS qtd_turmas
FROM Instrutores i
JOIN Turmas t ON t.id_instrutor = i.id_instrutor
GROUP BY i.id_instrutor, i.nome
HAVING COUNT(t.id_turma) > 1;
/*
Carlos Silva	2
Juliana Pereira	2
Marcos Andrade	2
Bruno Carvalho	3
Diego Martins	2
Eduardo Tavares	2
Vanessa Caldas	3
Priscila Dantas	3
Leandro Pinto	2
Daniel Correia	2
Carolina Freitas	2
Marcelo Cavalcante	4
Wesley Bezerra	2
*/

-- (5) GROUP BY + HAVING: planos cujo somatório de pagamentos supera R$ 2000,00
SELECT m.plano, SUM(p.valor) AS total_pago
FROM Matriculas m
JOIN Pagamentos p ON p.id_matricula = m.id_matricula
GROUP BY m.plano
HAVING SUM(p.valor) > 2000.00;
/*
Anual	16480.00
Semestral	5995.00
Trimestral	3340.00
*/

-- ---------------------------------------------------------------------
-- 4. FUNÇÕES DE AGREGAÇÃO 
-- ---------------------------------------------------------------------

-- COUNT: total de alunos cadastrados
SELECT COUNT(*) AS total_alunos FROM Alunos;
/*
50
*/

-- AVG: valor médio dos pagamentos
SELECT AVG(valor) AS media_pagamentos FROM Pagamentos;
/*
552.000000
*/

-- SUM: valor total recebido em pagamentos
SELECT SUM(valor) AS total_recebido FROM Pagamentos;
/*
27600.00
*/

-- MIN e MAX: menor e maior valor pago
SELECT MIN(valor) AS menor_pagamento, MAX(valor) AS maior_pagamento FROM Pagamentos;
/*
110.00	1110.00
*/

-- ---------------------------------------------------------------------
-- 5. FUNÇÕES MATEMÁTICAS
-- ---------------------------------------------------------------------

-- ROUND: valor médio dos pagamentos arredondado para 2 casas decimais
SELECT ROUND(AVG(valor), 2) AS media_arredondada FROM Pagamentos;
/*
552.00
*/

-- ABS: diferença absoluta entre cada pagamento e a média geral de pagamentos
SELECT id_pagamento, valor,
       ABS(valor - (SELECT AVG(valor) FROM Pagamentos)) AS diferenca_absoluta_da_media
FROM Pagamentos;
/*
1	600.00	48.000000
2	330.00	222.000000
3	120.00	432.000000
4	335.00	217.000000
5	340.00	212.000000
6	1100.00	548.000000
7	605.00	53.000000
8	130.00	422.000000
9	120.00	432.000000
10	335.00	217.000000
11	115.00	437.000000
12	1095.00	543.000000
13	590.00	38.000000
14	335.00	217.000000
15	590.00	38.000000
16	120.00	432.000000
17	120.00	432.000000
18	1100.00	548.000000
19	610.00	58.000000
20	130.00	422.000000
21	610.00	58.000000
22	1105.00	553.000000
23	110.00	442.000000
24	1100.00	548.000000
25	600.00	48.000000
26	330.00	222.000000
27	340.00	212.000000
28	325.00	227.000000
29	1090.00	538.000000
30	1100.00	548.000000
31	115.00	437.000000
32	115.00	437.000000
33	1100.00	548.000000
34	1100.00	548.000000
35	1105.00	553.000000
36	110.00	442.000000
37	120.00	432.000000
38	605.00	53.000000
39	120.00	432.000000
40	1090.00	538.000000
41	1100.00	548.000000
42	120.00	432.000000
43	330.00	222.000000
44	340.00	212.000000
45	595.00	43.000000
46	1095.00	543.000000
47	1110.00	558.000000
48	590.00	38.000000
49	120.00	432.000000
50	1090.00	538.000000
*/

-- CEIL: arredonda para cima o valor médio dos pagamentos
SELECT CEIL(AVG(valor)) AS media_arredondada_para_cima FROM Pagamentos;
/*
552
*/

-- FLOOR: arredonda para baixo o valor médio dos pagamentos
SELECT FLOOR(AVG(valor)) AS media_arredondada_para_baixo FROM Pagamentos;
/*
552
*/

-- ---------------------------------------------------------------------
-- 6. FUNÇÕES DE MANIPULAÇÃO DE STRINGS
-- ---------------------------------------------------------------------

-- UPPER: nomes dos alunos em caixa alta
SELECT UPPER(nome) AS nome_maiusculo FROM Alunos;
/*
JOÃO PEDRO ALVES
MARIA EDUARDA COSTA
LUCAS GABRIEL SOUZA
BEATRIZ OLIVEIRA
PEDRO HENRIQUE LIMA
LARISSA MENDES
GABRIEL ROCHA
ISABELA SANTOS
RAFAEL BARBOSA
SOPHIA CARVALHO
MATHEUS CARDOSO
ANA CLARA FIGUEIREDO
DAVI LUCCA PIRES
HELENA VARGAS
ENZO GABRIEL TELES
VALENTINA ARAGÃO
BERNARDO CUNHA
MANUELA REZENDE
LORENZO AZEVEDO
ALICE BITTENCOURT
THÉO WAGNER
LAURA BEATRIZ NÓBREGA
ARTHUR MIGUEL SALES
CECÍLIA DRUMOND
HEITOR SALVIANO
MARIANA CORDEIRO
NICOLAS FALCÃO
YASMIN PACHECO
SAMUEL BANDEIRA
LUIZA HONORATO
CALEB MARINHO
AGATHA SIQUEIRA
BENÍCIO TRINDADE
LIZ PATRÍCIA GOULART
JOAQUIM ESTEVÃO
MAITÊ CARNEIRO
DAVI MIGUEL RIOS
ANTONELLA BRASIL
ANTHONY VIDAL
ESTHER CAMARGO
PIETRO ALBANO
SARAH QUINTELA
BRYAN OLÍMPIO
MELISSA VIDIGAL
EMANUEL CASTELO
JÚLIA MARINHO REIS
VICENTE GALVÃO
LAVÍNIA RANGEL
MURILO ESPÍNDOLA
MARIA LUIZA BOTELHO
*/

-- LOWER: nomes dos instrutores em caixa baixa
SELECT LOWER(nome) AS nome_minusculo FROM Instrutores;
/*
carlos silva
fernanda lima
ricardo souza
juliana pereira
marcos andrade
patrícia gomes
bruno carvalho
aline rodrigues
diego martins
camila ferreira
eduardo tavares
renata brito
felipe nunes
vanessa caldas
thiago moura
priscila dantas
leandro pinto
cláudia ramos
vinícius teixeira
tatiane moreira
rodrigo castro
bianca cunha
andré farias
letícia vasconcelos
gustavo lopes
natália borges
daniel correia
mariana aguiar
rafael coelho
carolina freitas
vitor hugo macedo
débora siqueira
marcelo cavalcante
amanda ribeiro
igor sampaio
luana pacheco
eduardo brandão
simone albuquerque
hugo leite
paula esteves
fábio quaresma
cristina monteiro
wesley bezerra
adriana melo
otávio guedes
sabrina holanda
caio fontoura
yasmin drummond
júlio salgado
renata vilar
*/

-- LENGTH: tamanho (quantidade de caracteres) do nome de cada modalidade
SELECT nome, LENGTH(nome) AS tamanho_nome FROM Modalidades;
/*
Musculação	10
Yoga	4
Crossfit	8
Pilates	7
Natação	7
Spinning	8
Jiu-Jitsu	9
Dança	5
Funcional	9
Boxe	4
Zumba	5
Muay Thai	9
Alongamento	11
Hidroginástica	14
Treino Funcional Avançado	25
Ballet Fitness	14
Capoeira	8
Treino HIIT	11
Step	4
Aero Combat	11
Ginástica Artística	19
Treino com Elástico	19
Mobilidade Articular	20
Treino de Core	14
Power Yoga	10
Cross Training	14
Spinning Avançado	17
Defesa Pessoal	14
Natação Infantil	16
Treino Funcional com Halteres	29
Aero Dance	10
Treino Indoor	13
Spinning para Iniciantes	24
Treino de Resistência	21
Pilates Solo	12
Pilates com Aparelhos	21
Jiu-Jitsu Infantil	18
Boxe Fitness	12
Treino Outdoor	14
Alongamento Dinâmico	20
Treino Funcional Iniciante	26
Yoga Restaurativo	17
Natação Adaptada	16
Treino de Potência	18
Dança de Salão	14
Treino Funcional em Dupla	25
Spinning Musical	16
Crossfit Iniciante	18
Treino de Mobilidade	20
Aero Jump	9

Observação: a contagem considera caracteres acentuados como 1 caractere cada
(comportamento padrão do MySQL com charset utf8mb4, que foi reproduzido aqui).
*/

-- CONCAT: aluno + plano da matrícula em uma só coluna
SELECT CONCAT(al.nome, ' - Plano: ', m.plano) AS aluno_e_plano
FROM Alunos al
JOIN Matriculas m ON m.id_aluno = al.id_aluno;
/*
Samuel Bandeira - Plano: Anual
João Pedro Alves - Plano: Mensal
Joaquim Estevão - Plano: Semestral
Maitê Carneiro - Plano: Anual
Lucas Gabriel Souza - Plano: Semestral
Arthur Miguel Sales - Plano: Trimestral
Arthur Miguel Sales - Plano: Anual
Lavínia Rangel - Plano: Trimestral
Ana Clara Figueiredo - Plano: Mensal
Lavínia Rangel - Plano: Anual
Manuela Rezende - Plano: Mensal
Lucas Gabriel Souza - Plano: Trimestral
Luiza Honorato - Plano: Semestral
Enzo Gabriel Teles - Plano: Trimestral
Laura Beatriz Nóbrega - Plano: Mensal
Arthur Miguel Sales - Plano: Anual
Laura Beatriz Nóbrega - Plano: Mensal
Ana Clara Figueiredo - Plano: Semestral
Gabriel Rocha - Plano: Anual
Vicente Galvão - Plano: Anual
Benício Trindade - Plano: Anual
Davi Lucca Pires - Plano: Mensal
João Pedro Alves - Plano: Trimestral
Yasmin Pacheco - Plano: Semestral
Théo Wagner - Plano: Mensal
Benício Trindade - Plano: Anual
Mariana Cordeiro - Plano: Trimestral
Nicolas Falcão - Plano: Anual
Esther Camargo - Plano: Semestral
Maitê Carneiro - Plano: Semestral
Helena Vargas - Plano: Semestral
Samuel Bandeira - Plano: Trimestral
Caleb Marinho - Plano: Mensal
Benício Trindade - Plano: Semestral
Murilo Espíndola - Plano: Semestral
Davi Lucca Pires - Plano: Mensal
Valentina Aragão - Plano: Mensal
Nicolas Falcão - Plano: Trimestral
Agatha Siqueira - Plano: Trimestral
Sarah Quintela - Plano: Mensal
Enzo Gabriel Teles - Plano: Anual
Maitê Carneiro - Plano: Mensal
Rafael Barbosa - Plano: Semestral
Esther Camargo - Plano: Anual
Samuel Bandeira - Plano: Anual
Bernardo Cunha - Plano: Semestral
Agatha Siqueira - Plano: Trimestral
Samuel Bandeira - Plano: Semestral
Manuela Rezende - Plano: Semestral
Larissa Mendes - Plano: Trimestral
*/

-- ---------------------------------------------------------------------
-- 7. FUNÇÕES DE DATA E HORA 
-- ---------------------------------------------------------------------

-- CURDATE: data atual do sistema
SELECT CURDATE() AS data_atual;
/*
2026-06-27

Observação: este valor depende da data em que o comando for executado.
O valor acima corresponde à data em que este gabarito foi gerado.
*/

-- NOW: data e hora atuais do sistema
SELECT NOW() AS data_hora_atual;
/*
2026-06-27 14:32:10

Observação: a hora exata varia a cada execução; o valor é apenas ilustrativo.
*/

-- DATE_FORMAT: mês/ano de cada pagamento, formatado
SELECT id_pagamento, data_pagamento,
       DATE_FORMAT(data_pagamento, '%Y-%m') AS ano_mes_pagamento
FROM Pagamentos;
/*
1	2026-01-05	2026-01
2	2026-05-17	2026-05
3	2026-01-31	2026-01
4	2026-02-19	2026-02
5	2026-06-18	2026-06
6	2026-07-13	2026-07
7	2026-06-05	2026-06
8	2026-05-23	2026-05
9	2026-03-22	2026-03
10	2026-05-07	2026-05
11	2026-01-16	2026-01
12	2026-02-27	2026-02
13	2026-06-21	2026-06
14	2026-06-25	2026-06
15	2026-04-18	2026-04
16	2026-03-20	2026-03
17	2026-02-07	2026-02
18	2026-03-28	2026-03
19	2026-05-10	2026-05
20	2026-02-18	2026-02
21	2026-01-30	2026-01
22	2026-02-18	2026-02
23	2026-01-11	2026-01
24	2026-02-22	2026-02
25	2026-04-01	2026-04
26	2026-01-22	2026-01
27	2026-07-04	2026-07
28	2026-04-16	2026-04
29	2026-06-13	2026-06
30	2026-04-13	2026-04
31	2026-04-17	2026-04
32	2026-03-01	2026-03
33	2026-03-11	2026-03
34	2026-05-24	2026-05
35	2026-06-17	2026-06
36	2026-04-06	2026-04
37	2026-01-23	2026-01
38	2026-04-04	2026-04
39	2026-05-23	2026-05
40	2026-04-21	2026-04
41	2026-03-29	2026-03
42	2026-02-20	2026-02
43	2026-05-02	2026-05
44	2026-02-17	2026-02
45	2026-06-22	2026-06
46	2026-07-08	2026-07
47	2026-03-09	2026-03
48	2026-04-16	2026-04
49	2026-01-10	2026-01
50	2026-07-01	2026-07
*/

-- EXTRACT: ano de nascimento de cada aluno
SELECT nome, data_nascimento,
       EXTRACT(YEAR FROM data_nascimento) AS ano_nascimento
FROM Alunos;
/*
João Pedro Alves	1995-03-12	1995
Maria Eduarda Costa	1998-07-25	1998
Lucas Gabriel Souza	1990-01-30	1990
Beatriz Oliveira	2000-11-05	2000
Pedro Henrique Lima	1993-09-18	1993
Larissa Mendes	1997-04-22	1997
Gabriel Rocha	1989-12-09	1989
Isabela Santos	1996-06-14	1996
Rafael Barbosa	1992-02-27	1992
Sophia Carvalho	1999-10-03	1999
Matheus Cardoso	1999-07-09	1999
Ana Clara Figueiredo	2007-09-08	2007
Davi Lucca Pires	1986-04-27	1986
Helena Vargas	1995-07-09	1995
Enzo Gabriel Teles	1991-10-23	1991
Valentina Aragão	1991-11-16	1991
Bernardo Cunha	2005-08-05	2005
Manuela Rezende	1989-04-24	1989
Lorenzo Azevedo	2002-05-24	2002
Alice Bittencourt	1998-10-13	1998
Théo Wagner	1992-03-17	1992
Laura Beatriz Nóbrega	1987-01-28	1987
Arthur Miguel Sales	1989-11-06	1989
Cecília Drumond	2004-02-13	2004
Heitor Salviano	2004-08-17	2004
Mariana Cordeiro	2002-01-22	2002
Nicolas Falcão	2006-09-25	2006
Yasmin Pacheco	2005-06-04	2005
Samuel Bandeira	1998-03-15	1998
Luiza Honorato	1993-09-25	1993
Caleb Marinho	2001-02-28	2001
Agatha Siqueira	1994-11-17	1994
Benício Trindade	1991-03-12	1991
Liz Patrícia Goulart	2002-09-01	2002
Joaquim Estevão	1995-08-01	1995
Maitê Carneiro	1996-05-08	1996
Davi Miguel Rios	1992-10-03	1992
Antonella Brasil	2000-02-25	2000
Anthony Vidal	1989-03-22	1989
Esther Camargo	2002-03-09	2002
Pietro Albano	2004-07-07	2004
Sarah Quintela	2007-04-23	2007
Bryan Olímpio	1997-11-21	1997
Melissa Vidigal	1999-09-15	1999
Emanuel Castelo	1992-04-03	1992
Júlia Marinho Reis	1985-10-18	1985
Vicente Galvão	2003-04-01	2003
Lavínia Rangel	2007-11-02	2007
Murilo Espíndola	1987-01-28	1987
Maria Luiza Botelho	1987-09-08	1987
*/

-- DATEDIFF: quantidade de dias entre o início da matrícula e o pagamento
-- (tempo até o aluno efetuar o pagamento)
SELECT p.id_pagamento, m.data_inicio, p.data_pagamento,
       DATEDIFF(p.data_pagamento, m.data_inicio) AS dias_para_pagar
FROM Pagamentos p
JOIN Matriculas m ON m.id_matricula = p.id_matricula;
/*
1	2026-01-01	2026-01-05	4
2	2026-05-01	2026-05-17	16
3	2026-01-02	2026-01-31	29
4	2026-02-05	2026-02-19	14
5	2026-06-10	2026-06-18	8
6	2026-06-14	2026-07-13	29
7	2026-05-29	2026-06-05	7
8	2026-05-02	2026-05-23	21
9	2026-03-07	2026-03-22	15
10	2026-05-01	2026-05-07	6
11	2026-01-08	2026-01-16	8
12	2026-02-10	2026-02-27	17
13	2026-06-19	2026-06-21	2
14	2026-06-10	2026-06-25	15
15	2026-03-27	2026-04-18	22
16	2026-03-05	2026-03-20	15
17	2026-01-29	2026-02-07	9
18	2026-03-21	2026-03-28	7
19	2026-04-29	2026-05-10	11
20	2026-02-07	2026-02-18	11
21	2026-01-20	2026-01-30	10
22	2026-02-10	2026-02-18	8
23	2026-01-08	2026-01-11	3
24	2026-01-30	2026-02-22	23
25	2026-03-27	2026-04-01	5
26	2026-01-07	2026-01-22	15
27	2026-06-10	2026-07-04	24
28	2026-04-13	2026-04-16	3
29	2026-06-02	2026-06-13	11
30	2026-03-22	2026-04-13	22
31	2026-04-16	2026-04-17	1
32	2026-02-07	2026-03-01	22
33	2026-02-15	2026-03-11	24
34	2026-05-24	2026-05-24	0
35	2026-06-02	2026-06-17	15
36	2026-03-07	2026-04-06	30
37	2026-01-08	2026-01-23	15
38	2026-03-20	2026-04-04	15
39	2026-05-02	2026-05-23	21
40	2026-03-27	2026-04-21	25
41	2026-03-22	2026-03-29	7
42	2026-02-07	2026-02-20	13
43	2026-04-13	2026-05-02	19
44	2026-02-05	2026-02-17	12
45	2026-05-26	2026-06-22	27
46	2026-06-20	2026-07-08	18
47	2026-02-07	2026-03-09	30
48	2026-03-27	2026-04-16	20
49	2026-01-08	2026-01-10	2
50	2026-06-14	2026-07-01	17
*/
