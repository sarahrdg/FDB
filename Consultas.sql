-- ---------------------------------------------------------------------
-- 1. CONSULTAS 
-- ---------------------------------------------------------------------

-- (1) Alunos cujo plano de matrícula é "Anual"
SELECT a.nome, m.plano, m.status
FROM Alunos a
JOIN Matriculas m ON m.id_aluno = a.id_aluno
WHERE m.plano = 'Anual';

-- (2) Instrutores especializados em Crossfit
SELECT nome, especialidade, telefone
FROM Instrutores
WHERE especialidade = 'Crossfit';

-- (3) Pagamentos com valor acima de R$ 500,00
SELECT id_pagamento, id_matricula, valor, forma_pagamento
FROM Pagamentos
WHERE valor > 500.00;

-- (4) Turmas que ocorrem às segundas-feiras
SELECT id_turma, id_instrutor, id_modalidade, horario, dia_semana
FROM Turmas
WHERE dia_semana = 'Segunda';

-- (5) Matrículas com status diferente de "ativo"
SELECT id_matricula, id_aluno, plano, status
FROM Matriculas
WHERE status <> 'ativo';


-- ---------------------------------------------------------------------
-- 2. CONSULTAS COM JOIN — INNER / LEFT (5)
-- ---------------------------------------------------------------------

-- (1) INNER JOIN: lista de turmas com nome do instrutor e da modalidade
SELECT t.id_turma, i.nome AS instrutor, mo.nome AS modalidade, t.dia_semana, t.horario
FROM Turmas t
INNER JOIN Instrutores i ON i.id_instrutor = t.id_instrutor
INNER JOIN Modalidades mo ON mo.id_modalidade = t.id_modalidade;

-- (2) INNER JOIN: pagamentos com o nome do aluno e o plano da matrícula
SELECT p.id_pagamento, al.nome AS aluno, m.plano, p.valor, p.data_pagamento
FROM Pagamentos p
INNER JOIN Matriculas m ON m.id_matricula = p.id_matricula
INNER JOIN Alunos al ON al.id_aluno = m.id_aluno;

-- (3) INNER JOIN: alunos e as turmas em que estão matriculados (N:N)
SELECT al.nome AS aluno, t.id_turma, mo.nome AS modalidade, t.dia_semana, t.horario
FROM Aluno_turma at2
INNER JOIN Alunos al ON al.id_aluno = at2.id_aluno
INNER JOIN Turmas t ON t.id_turma = at2.id_turma
INNER JOIN Modalidades mo ON mo.id_modalidade = t.id_modalidade;

-- (4) LEFT JOIN: todos os alunos e suas matrículas (mostra também quem não tem matrícula, se houver)
SELECT al.nome AS aluno, m.id_matricula, m.plano, m.status
FROM Alunos al
LEFT JOIN Matriculas m ON m.id_aluno = al.id_aluno;

-- (5) LEFT JOIN: todas as turmas e os alunos vinculados (mostra turmas sem aluno também)
SELECT t.id_turma, mo.nome AS modalidade, at2.id_aluno
FROM Turmas t
LEFT JOIN Aluno_turma at2 ON at2.id_turma = t.id_turma
LEFT JOIN Modalidades mo ON mo.id_modalidade = t.id_modalidade
ORDER BY t.id_turma;


-- ---------------------------------------------------------------------
-- 3. CONSULTAS COM GROUP BY 
-- ---------------------------------------------------------------------

-- (1) GROUP BY: quantidade de matrículas por plano
SELECT plano, COUNT(*) AS qtd_matriculas
FROM Matriculas
GROUP BY plano;

-- (2) GROUP BY: valor total pago por forma de pagamento
SELECT forma_pagamento, SUM(valor) AS total_recebido
FROM Pagamentos
GROUP BY forma_pagamento;

-- (3) GROUP BY: quantidade de turmas por instrutor
SELECT i.nome AS instrutor, COUNT(t.id_turma) AS qtd_turmas
FROM Instrutores i
LEFT JOIN Turmas t ON t.id_instrutor = i.id_instrutor
GROUP BY i.id_instrutor, i.nome;

-- (4) GROUP BY + HAVING: instrutores que dão mais de 1 turma
SELECT i.nome AS instrutor, COUNT(t.id_turma) AS qtd_turmas
FROM Instrutores i
JOIN Turmas t ON t.id_instrutor = i.id_instrutor
GROUP BY i.id_instrutor, i.nome
HAVING COUNT(t.id_turma) > 1;

-- (5) GROUP BY + HAVING: planos cujo somatório de pagamentos supera R$ 2000,00
SELECT m.plano, SUM(p.valor) AS total_pago
FROM Matriculas m
JOIN Pagamentos p ON p.id_matricula = m.id_matricula
GROUP BY m.plano
HAVING SUM(p.valor) > 2000.00;


-- ---------------------------------------------------------------------
-- 4. FUNÇÕES DE AGREGAÇÃO 
-- ---------------------------------------------------------------------

-- COUNT: total de alunos cadastrados
SELECT COUNT(*) AS total_alunos FROM Alunos;

-- AVG: valor médio dos pagamentos
SELECT AVG(valor) AS media_pagamentos FROM Pagamentos;

-- SUM: valor total recebido em pagamentos
SELECT SUM(valor) AS total_recebido FROM Pagamentos;

-- MIN e MAX: menor e maior valor pago
SELECT MIN(valor) AS menor_pagamento, MAX(valor) AS maior_pagamento FROM Pagamentos;


-- ---------------------------------------------------------------------
-- 5. FUNÇÕES MATEMÁTICAS
-- ---------------------------------------------------------------------

-- ROUND: valor médio dos pagamentos arredondado para 2 casas decimais
SELECT ROUND(AVG(valor), 2) AS media_arredondada FROM Pagamentos;

-- ABS: diferença absoluta entre cada pagamento e a média geral de pagamentos
SELECT id_pagamento, valor,
       ABS(valor - (SELECT AVG(valor) FROM Pagamentos)) AS diferenca_absoluta_da_media
FROM Pagamentos;

-- CEIL: arredonda para cima o valor médio dos pagamentos
SELECT CEIL(AVG(valor)) AS media_arredondada_para_cima FROM Pagamentos;

-- FLOOR: arredonda para baixo o valor médio dos pagamentos
SELECT FLOOR(AVG(valor)) AS media_arredondada_para_baixo FROM Pagamentos;


-- ---------------------------------------------------------------------
-- 6. FUNÇÕES DE MANIPULAÇÃO DE STRINGS
-- ---------------------------------------------------------------------

-- UPPER: nomes dos alunos em caixa alta
SELECT UPPER(nome) AS nome_maiusculo FROM Alunos;

-- LOWER: nomes dos instrutores em caixa baixa
SELECT LOWER(nome) AS nome_minusculo FROM Instrutores;

-- LENGTH: tamanho (quantidade de caracteres) do nome de cada modalidade
SELECT nome, LENGTH(nome) AS tamanho_nome FROM Modalidades;

-- CONCAT: aluno + plano da matrícula em uma só coluna
SELECT CONCAT(al.nome, ' - Plano: ', m.plano) AS aluno_e_plano
FROM Alunos al
JOIN Matriculas m ON m.id_aluno = al.id_aluno;


-- ---------------------------------------------------------------------
-- 7. FUNÇÕES DE DATA E HORA 
-- ---------------------------------------------------------------------

-- CURDATE: data atual do sistema
SELECT CURDATE() AS data_atual;

-- NOW: data e hora atuais do sistema
SELECT NOW() AS data_hora_atual;

-- DATE_FORMAT: mês/ano de cada pagamento, formatado
SELECT id_pagamento, data_pagamento,
       DATE_FORMAT(data_pagamento, '%Y-%m') AS ano_mes_pagamento
FROM Pagamentos;

-- EXTRACT: ano de nascimento de cada aluno
SELECT nome, data_nascimento,
       EXTRACT(YEAR FROM data_nascimento) AS ano_nascimento
FROM Alunos;

-- DATEDIFF: quantidade de dias entre o início da matrícula e o pagamento
-- (tempo até o aluno efetuar o pagamento)
SELECT p.id_pagamento, m.data_inicio, p.data_pagamento,
       DATEDIFF(p.data_pagamento, m.data_inicio) AS dias_para_pagar
FROM Pagamentos p
JOIN Matriculas m ON m.id_matricula = p.id_matricula;
