CREATE DATABASE academia CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE academia;

-- ---------------------------------------------------------------------
-- Tabela: Instrutores
-- ---------------------------------------------------------------------
CREATE TABLE Instrutores (
    id_instrutor    INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    especialidade   VARCHAR(50),
    telefone        VARCHAR(15)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Tabela: Modalidades
-- ---------------------------------------------------------------------
CREATE TABLE Modalidades (
    id_modalidade   INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(50) NOT NULL,
    descricao       VARCHAR(200)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Tabela: Alunos
-- ---------------------------------------------------------------------
CREATE TABLE Alunos (
    id_aluno        INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    cpf             VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    telefone        VARCHAR(14)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Tabela: Turmas
-- ---------------------------------------------------------------------
CREATE TABLE Turmas (
    id_turma        INT AUTO_INCREMENT PRIMARY KEY,
    id_instrutor    INT NOT NULL,
    id_modalidade   INT NOT NULL,
    horario         TIME NOT NULL,
    dia_semana      VARCHAR(20) NOT NULL,
    CONSTRAINT fk_turmas_instrutor FOREIGN KEY (id_instrutor) REFERENCES Instrutores (id_instrutor)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_turmas_modalidade FOREIGN KEY (id_modalidade) REFERENCES Modalidades (id_modalidade)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Tabela: Aluno_turma 
-- ---------------------------------------------------------------------
CREATE TABLE Aluno_turma (
    id_aluno             INT NOT NULL,
    id_turma             INT NOT NULL,
    data_matricula_turma DATE NOT NULL,
    PRIMARY KEY (id_aluno, id_turma),
    CONSTRAINT fk_alunoturma_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_alunoturma_turma FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Tabela: Matriculas
-- ---------------------------------------------------------------------
CREATE TABLE Matriculas (
    id_matricula    INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno        INT NOT NULL,
    data_inicio     DATE NOT NULL,
    plano           VARCHAR(30) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'ativo',
    CONSTRAINT fk_matriculas_aluno FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Tabela: Pagamentos
-- ---------------------------------------------------------------------
CREATE TABLE Pagamentos (
    id_pagamento    INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula    INT NOT NULL,
    data_pagamento  DATE NOT NULL,
    valor           DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(20) NOT NULL,
    CONSTRAINT fk_pagamentos_matricula FOREIGN KEY (id_matricula) REFERENCES Matriculas (id_matricula)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- DML - INSERÇÃO DE DADOS 
-- ---------------------------------------------------------------------

INSERT INTO Instrutores (nome, especialidade, telefone) VALUES
('Carlos Silva', 'Musculação', '85988887777'),
('Fernanda Lima', 'Yoga', '85977776666'),
('Ricardo Souza', 'Crossfit', '85966665555'),
('Juliana Pereira', 'Pilates', '85955554444'),
('Marcos Andrade', 'Natação', '85944443333'),
('Patrícia Gomes', 'Spinning', '85933332222'),
('Bruno Carvalho', 'Jiu-Jitsu', '85922221111'),
('Aline Rodrigues', 'Dança', '85911110000'),
('Diego Martins', 'Funcional', '85900009999'),
('Camila Ferreira', 'Boxe', '85988889999'),
('Eduardo Tavares', 'Yoga', '85913356886'),
('Renata Brito', 'Natação', '85942868828'),
('Felipe Nunes', 'Pilates', '85928728463'),
('Vanessa Caldas', 'Yoga', '85983197857'),
('Thiago Moura', 'Yoga', '85989254563'),
('Priscila Dantas', 'Jiu-Jitsu', '85914265799'),
('Leandro Pinto', 'Musculação', '85922575562'),
('Cláudia Ramos', 'Pilates', '85941227216'),
('Vinícius Teixeira', 'Funcional', '85990801586'),
('Tatiane Moreira', 'Musculação', '85985329037'),
('Rodrigo Castro', 'Pilates', '85997226012'),
('Bianca Cunha', 'Funcional', '85966306997'),
('André Farias', 'Pilates', '85970291817'),
('Letícia Vasconcelos', 'Boxe', '85947338124'),
('Gustavo Lopes', 'Musculação', '85931429110'),
('Natália Borges', 'Jiu-Jitsu', '85955667651'),
('Daniel Correia', 'Natação', '85930868105'),
('Mariana Aguiar', 'Pilates', '85955176955'),
('Rafael Coelho', 'Yoga', '85922448136'),
('Carolina Freitas', 'Jiu-Jitsu', '85922981052'),
('Vitor Hugo Macedo', 'Spinning', '85956164955'),
('Débora Siqueira', 'Boxe', '85945503389'),
('Marcelo Cavalcante', 'Musculação', '85971662963'),
('Amanda Ribeiro', 'Funcional', '85926753883'),
('Igor Sampaio', 'Jiu-Jitsu', '85920576383'),
('Luana Pacheco', 'Funcional', '85949349722'),
('Eduardo Brandão', 'Boxe', '85958537831'),
('Simone Albuquerque', 'Boxe', '85935808537'),
('Hugo Leite', 'Yoga', '85916150444'),
('Paula Esteves', 'Pilates', '85948840994'),
('Fábio Quaresma', 'Yoga', '85941244663'),
('Cristina Monteiro', 'Yoga', '85961019678'),
('Wesley Bezerra', 'Natação', '85970855700'),
('Adriana Melo', 'Spinning', '85931831063'),
('Otávio Guedes', 'Spinning', '85957683626'),
('Sabrina Holanda', 'Pilates', '85999949389'),
('Caio Fontoura', 'Natação', '85996977837'),
('Yasmin Drummond', 'Yoga', '85991756179'),
('Júlio Salgado', 'Crossfit', '85981691040'),
('Renata Vilar', 'Pilates', '85931931511');

INSERT INTO Modalidades (nome, descricao) VALUES
('Musculação', 'Treino de força com pesos livres e máquinas'),
('Yoga', 'Exercícios de respiração, postura e relaxamento'),
('Crossfit', 'Treinamento funcional de alta intensidade'),
('Pilates', 'Exercícios de fortalecimento e flexibilidade'),
('Natação', 'Aulas de natação para todos os níveis'),
('Spinning', 'Aula de bicicleta indoor em ritmo de música'),
('Jiu-Jitsu', 'Arte marcial focada em luta no solo'),
('Dança', 'Aulas de dança para condicionamento físico'),
('Funcional', 'Treinamento funcional com peso corporal'),
('Boxe', 'Treino de boxe e condicionamento físico'),
('Zumba', 'Dança aeróbica com ritmos latinos'),
('Muay Thai', 'Arte marcial tailandesa com golpes de impacto'),
('Alongamento', 'Sessão focada em flexibilidade e mobilidade'),
('Hidroginástica', 'Exercícios aeróbicos realizados na piscina'),
('Treino Funcional Avançado', 'Circuito de alta intensidade com peso corporal'),
('Ballet Fitness', 'Movimentos de ballet aplicados ao condicionamento físico'),
('Capoeira', 'Arte marcial brasileira com elementos de dança'),
('Treino HIIT', 'Intervalos de alta intensidade intercalados com descanso'),
('Step', 'Aula aeróbica usando plataforma elevada'),
('Aero Combat', 'Combinação de boxe e aeróbica'),
('Ginástica Artística', 'Treino de força, flexibilidade e equilíbrio'),
('Treino com Elástico', 'Exercícios de resistência usando faixas elásticas'),
('Mobilidade Articular', 'Sessão para melhora de amplitude de movimento'),
('Treino de Core', 'Foco em fortalecimento da região abdominal e lombar'),
('Power Yoga', 'Yoga dinâmico com foco em força'),
('Cross Training', 'Treinamento cruzado combinando várias modalidades'),
('Spinning Avançado', 'Aula de spinning com cargas elevadas'),
('Defesa Pessoal', 'Técnicas básicas de autodefesa'),
('Natação Infantil', 'Aulas de natação voltadas para crianças'),
('Treino Funcional com Halteres', 'Circuito funcional utilizando halteres'),
('Aero Dance', 'Aula aeróbica com coreografias de dança'),
('Treino Indoor', 'Atividades físicas realizadas em ambiente fechado'),
('Spinning para Iniciantes', 'Aula introdutória de bicicleta indoor'),
('Treino de Resistência', 'Foco em resistência muscular e cardiovascular'),
('Pilates Solo', 'Pilates realizado sem equipamentos, apenas no solo'),
('Pilates com Aparelhos', 'Pilates realizado com equipamentos específicos'),
('Jiu-Jitsu Infantil', 'Aulas de jiu-jitsu voltadas para crianças'),
('Boxe Fitness', 'Boxe recreativo focado em condicionamento físico'),
('Treino Outdoor', 'Atividades físicas realizadas ao ar livre'),
('Alongamento Dinâmico', 'Alongamentos realizados em movimento'),
('Treino Funcional Iniciante', 'Circuito funcional adaptado para iniciantes'),
('Yoga Restaurativo', 'Yoga focado em relaxamento profundo'),
('Natação Adaptada', 'Aulas de natação adaptadas para necessidades especiais'),
('Treino de Potência', 'Foco em explosão muscular e velocidade'),
('Dança de Salão', 'Aulas de dança a dois, como salsa e forró'),
('Treino Funcional em Dupla', 'Circuito funcional realizado em pares'),
('Spinning Musical', 'Aula de spinning com playlist temática'),
('Crossfit Iniciante', 'Treinamento funcional adaptado para iniciantes'),
('Treino de Mobilidade', 'Sessão de exercícios para amplitude de movimento'),
('Aero Jump', 'Aula aeróbica utilizando mini trampolim');

INSERT INTO Alunos (nome, cpf, data_nascimento, telefone) VALUES
('João Pedro Alves', '000.000.001-07', '1995-03-12', '85911112222'),
('Maria Eduarda Costa', '000.000.002-14', '1998-07-25', '85922223333'),
('Lucas Gabriel Souza', '000.000.003-21', '1990-01-30', '85933334444'),
('Beatriz Oliveira', '000.000.004-28', '2000-11-05', '85944445555'),
('Pedro Henrique Lima', '000.000.005-35', '1993-09-18', '85955556666'),
('Larissa Mendes', '000.000.006-42', '1997-04-22', '85966667777'),
('Gabriel Rocha', '000.000.007-49', '1989-12-09', '85977778888'),
('Isabela Santos', '000.000.008-56', '1996-06-14', '85988889990'),
('Rafael Barbosa', '000.000.009-63', '1992-02-27', '85999990001'),
('Sophia Carvalho', '000.000.010-70', '1999-10-03', '85900001112'),
('Matheus Cardoso', '000.000.011-77', '1999-07-09', '85995899313'),
('Ana Clara Figueiredo', '000.000.012-84', '2007-09-08', '85953524491'),
('Davi Lucca Pires', '000.000.013-91', '1986-04-27', '85914308421'),
('Helena Vargas', '000.000.014-98', '1995-07-09', '85918883684'),
('Enzo Gabriel Teles', '000.000.015-05', '1991-10-23', '85952235350'),
('Valentina Aragão', '000.000.016-12', '1991-11-16', '85963100814'),
('Bernardo Cunha', '000.000.017-19', '2005-08-05', '85945551614'),
('Manuela Rezende', '000.000.018-26', '1989-04-24', '85985345555'),
('Lorenzo Azevedo', '000.000.019-33', '2002-05-24', '85988461803'),
('Alice Bittencourt', '000.000.020-40', '1998-10-13', '85958586340'),
('Théo Wagner', '000.000.021-47', '1992-03-17', '85976238574'),
('Laura Beatriz Nóbrega', '000.000.022-54', '1987-01-28', '85924716857'),
('Arthur Miguel Sales', '000.000.023-61', '1989-11-06', '85966661351'),
('Cecília Drumond', '000.000.024-68', '2004-02-13', '85961220073'),
('Heitor Salviano', '000.000.025-75', '2004-08-17', '85943744231'),
('Mariana Cordeiro', '000.000.026-82', '2002-01-22', '85925374874'),
('Nicolas Falcão', '000.000.027-89', '2006-09-25', '85945812670'),
('Yasmin Pacheco', '000.000.028-96', '2005-06-04', '85949392920'),
('Samuel Bandeira', '000.000.029-03', '1998-03-15', '85910435578'),
('Luiza Honorato', '000.000.030-10', '1993-09-25', '85933978249'),
('Caleb Marinho', '000.000.031-17', '2001-02-28', '85993926371'),
('Agatha Siqueira', '000.000.032-24', '1994-11-17', '85991734598'),
('Benício Trindade', '000.000.033-31', '1991-03-12', '85931682744'),
('Liz Patrícia Goulart', '000.000.034-38', '2002-09-01', '85990388981'),
('Joaquim Estevão', '000.000.035-45', '1995-08-01', '85925014631'),
('Maitê Carneiro', '000.000.036-52', '1996-05-08', '85917774584'),
('Davi Miguel Rios', '000.000.037-59', '1992-10-03', '85921496211'),
('Antonella Brasil', '000.000.038-66', '2000-02-25', '85981498611'),
('Anthony Vidal', '000.000.039-73', '1989-03-22', '85973791320'),
('Esther Camargo', '000.000.040-80', '2002-03-09', '85980823176'),
('Pietro Albano', '000.000.041-87', '2004-07-07', '85982383095'),
('Sarah Quintela', '000.000.042-94', '2007-04-23', '85951837852'),
('Bryan Olímpio', '000.000.043-01', '1997-11-21', '85960119651'),
('Melissa Vidigal', '000.000.044-08', '1999-09-15', '85926240908'),
('Emanuel Castelo', '000.000.045-15', '1992-04-03', '85955377076'),
('Júlia Marinho Reis', '000.000.046-22', '1985-10-18', '85940885476'),
('Vicente Galvão', '000.000.047-29', '2003-04-01', '85919528530'),
('Lavínia Rangel', '000.000.048-36', '2007-11-02', '85940728046'),
('Murilo Espíndola', '000.000.049-43', '1987-01-28', '85954349361'),
('Maria Luiza Botelho', '000.000.050-50', '1987-09-08', '85947376585');

INSERT INTO Turmas (id_instrutor, id_modalidade, horario, dia_semana) VALUES
(43, 32, '07:30', 'Sexta'),
(9, 47, '18:30', 'Sexta'),
(31, 16, '20:00', 'Quinta'),
(27, 13, '06:30', 'Segunda'),
(43, 28, '09:00', 'Quinta'),
(27, 30, '20:30', 'Sábado'),
(4, 44, '19:00', 'Sábado'),
(7, 4, '10:00', 'Sábado'),
(22, 7, '07:30', 'Terça'),
(13, 35, '17:00', 'Terça'),
(28, 12, '08:00', 'Quinta'),
(16, 5, '17:00', 'Sexta'),
(7, 4, '19:00', 'Sexta'),
(1, 6, '20:00', 'Terça'),
(11, 27, '17:00', 'Quinta'),
(14, 26, '06:00', 'Terça'),
(25, 1, '10:00', 'Quarta'),
(30, 19, '10:00', 'Sábado'),
(47, 36, '19:00', 'Sábado'),
(32, 10, '07:30', 'Quarta'),
(14, 4, '18:30', 'Sábado'),
(35, 4, '19:30', 'Quarta'),
(4, 4, '18:30', 'Quinta'),
(33, 34, '07:00', 'Segunda'),
(33, 6, '20:30', 'Terça'),
(5, 39, '06:30', 'Sábado'),
(16, 26, '06:30', 'Sexta'),
(16, 38, '18:30', 'Segunda'),
(40, 6, '10:00', 'Sábado'),
(38, 37, '18:00', 'Quarta'),
(17, 14, '19:00', 'Sábado'),
(21, 16, '08:00', 'Quinta'),
(9, 43, '19:00', 'Quarta'),
(30, 21, '20:00', 'Segunda'),
(1, 30, '18:30', 'Sexta'),
(7, 5, '18:00', 'Terça'),
(33, 17, '07:00', 'Quarta'),
(5, 16, '09:00', 'Quarta'),
(11, 29, '20:30', 'Sexta'),
(46, 20, '18:30', 'Sábado'),
(34, 1, '19:00', 'Sexta'),
(20, 43, '06:30', 'Terça'),
(17, 8, '06:30', 'Sábado'),
(36, 10, '08:00', 'Quarta'),
(39, 14, '19:30', 'Quarta'),
(14, 44, '19:00', 'Quarta'),
(33, 32, '08:00', 'Segunda'),
(6, 41, '10:00', 'Quarta'),
(3, 1, '09:00', 'Terça'),
(41, 17, '07:00', 'Sábado');

INSERT INTO Aluno_turma (id_aluno, id_turma, data_matricula_turma) VALUES
(25, 45, '2026-02-09'),
(46, 14, '2026-01-17'),
(27, 27, '2026-03-26'),
(35, 30, '2026-04-17'),
(4, 14, '2026-04-18'),
(25, 50, '2026-05-30'),
(45, 2, '2026-05-28'),
(25, 31, '2026-01-02'),
(23, 20, '2026-04-10'),
(27, 35, '2026-05-20'),
(39, 15, '2026-05-05'),
(15, 18, '2026-04-22'),
(32, 2, '2026-04-10'),
(22, 43, '2026-06-23'),
(26, 47, '2026-02-12'),
(30, 9, '2026-06-09'),
(35, 2, '2026-04-11'),
(38, 37, '2026-06-19'),
(2, 6, '2026-06-14'),
(28, 9, '2026-04-29'),
(12, 4, '2026-03-08'),
(25, 21, '2026-02-24'),
(30, 21, '2026-03-28'),
(49, 25, '2026-03-13'),
(49, 27, '2026-03-06'),
(6, 31, '2026-01-05'),
(48, 35, '2026-01-14'),
(23, 15, '2026-06-16'),
(5, 50, '2026-06-16'),
(3, 49, '2026-01-08'),
(16, 13, '2026-01-06'),
(40, 10, '2026-03-03'),
(9, 31, '2026-06-21'),
(8, 37, '2026-02-25'),
(30, 45, '2026-03-07'),
(50, 24, '2026-02-12'),
(39, 39, '2026-01-30'),
(50, 11, '2026-03-21'),
(7, 38, '2026-01-07'),
(20, 37, '2026-06-23'),
(25, 26, '2026-02-20'),
(5, 38, '2026-06-10'),
(16, 7, '2026-03-19'),
(44, 39, '2026-01-31'),
(37, 3, '2026-03-30'),
(35, 28, '2026-06-19'),
(24, 5, '2026-05-10'),
(42, 22, '2026-01-04'),
(27, 32, '2026-01-28'),
(28, 24, '2026-06-12');

INSERT INTO Matriculas (id_aluno, data_inicio, plano, status) VALUES
(29, '2026-05-22', 'Anual', 'cancelado'),
(1, '2026-01-29', 'Mensal', 'ativo'),
(35, '2026-01-10', 'Semestral', 'cancelado'),
(36, '2026-02-07', 'Anual', 'ativo'),
(3, '2026-03-20', 'Semestral', 'ativo'),
(23, '2026-02-23', 'Trimestral', 'ativo'),
(23, '2026-05-24', 'Anual', 'cancelado'),
(48, '2026-02-09', 'Trimestral', 'ativo'),
(12, '2026-04-16', 'Mensal', 'ativo'),
(48, '2026-03-27', 'Anual', 'ativo'),
(18, '2026-02-10', 'Mensal', 'inativo'),
(3, '2026-05-01', 'Trimestral', 'ativo'),
(30, '2026-03-31', 'Semestral', 'ativo'),
(15, '2026-01-07', 'Trimestral', 'inativo'),
(22, '2026-03-13', 'Mensal', 'ativo'),
(23, '2026-06-14', 'Anual', 'cancelado'),
(22, '2026-01-08', 'Mensal', 'ativo'),
(12, '2026-05-29', 'Semestral', 'ativo'),
(7, '2026-06-02', 'Anual', 'ativo'),
(47, '2026-03-22', 'Anual', 'cancelado'),
(33, '2026-01-30', 'Anual', 'cancelado'),
(13, '2026-03-07', 'Mensal', 'inativo'),
(1, '2026-05-14', 'Trimestral', 'ativo'),
(28, '2026-01-18', 'Semestral', 'cancelado'),
(21, '2026-06-19', 'Mensal', 'ativo'),
(33, '2026-03-21', 'Anual', 'ativo'),
(26, '2026-03-17', 'Trimestral', 'ativo'),
(27, '2026-06-20', 'Anual', 'ativo'),
(40, '2026-05-26', 'Semestral', 'inativo'),
(36, '2026-01-01', 'Semestral', 'ativo'),
(14, '2026-04-21', 'Semestral', 'inativo'),
(29, '2026-04-24', 'Trimestral', 'cancelado'),
(31, '2026-02-13', 'Mensal', 'ativo'),
(33, '2026-06-19', 'Semestral', 'ativo'),
(49, '2026-03-02', 'Semestral', 'ativo'),
(13, '2026-02-07', 'Mensal', 'ativo'),
(16, '2026-05-02', 'Mensal', 'inativo'),
(27, '2026-06-11', 'Trimestral', 'inativo'),
(32, '2026-04-13', 'Trimestral', 'ativo'),
(42, '2026-01-02', 'Mensal', 'inativo'),
(15, '2026-02-15', 'Anual', 'ativo'),
(36, '2026-03-05', 'Mensal', 'inativo'),
(9, '2026-04-29', 'Semestral', 'inativo'),
(40, '2026-05-10', 'Anual', 'cancelado'),
(29, '2026-02-10', 'Anual', 'inativo'),
(17, '2026-03-05', 'Semestral', 'cancelado'),
(32, '2026-06-10', 'Trimestral', 'ativo'),
(29, '2026-01-20', 'Semestral', 'ativo'),
(18, '2026-03-27', 'Semestral', 'cancelado'),
(6, '2026-02-05', 'Trimestral', 'ativo');

INSERT INTO Pagamentos (id_matricula, data_pagamento, valor, forma_pagamento) VALUES
(30, '2026-01-05', 600.00, 'Boleto'),
(12, '2026-05-17', 330.00, 'Cartão de Débito'),
(40, '2026-01-31', 120.00, 'Dinheiro'),
(50, '2026-02-19', 335.00, 'Boleto'),
(47, '2026-06-18', 340.00, 'Cartão de Débito'),
(16, '2026-07-13', 1100.00, 'Pix'),
(18, '2026-06-05', 605.00, 'Boleto'),
(37, '2026-05-23', 130.00, 'Boleto'),
(22, '2026-03-22', 120.00, 'Cartão de Débito'),
(12, '2026-05-07', 335.00, 'Cartão de Débito'),
(17, '2026-01-16', 115.00, 'Dinheiro'),
(45, '2026-02-27', 1095.00, 'Pix'),
(34, '2026-06-21', 590.00, 'Cartão de Crédito'),
(47, '2026-06-25', 335.00, 'Dinheiro'),
(49, '2026-04-18', 590.00, 'Boleto'),
(42, '2026-03-20', 120.00, 'Boleto'),
(2, '2026-02-07', 120.00, 'Cartão de Crédito'),
(26, '2026-03-28', 1100.00, 'Cartão de Débito'),
(43, '2026-05-10', 610.00, 'Boleto'),
(36, '2026-02-18', 130.00, 'Boleto'),
(48, '2026-01-30', 610.00, 'Cartão de Débito'),
(45, '2026-02-18', 1105.00, 'Cartão de Débito'),
(17, '2026-01-11', 110.00, 'Cartão de Crédito'),
(21, '2026-02-22', 1100.00, 'Dinheiro'),
(49, '2026-04-01', 600.00, 'Cartão de Crédito'),
(14, '2026-01-22', 330.00, 'Cartão de Débito'),
(47, '2026-07-04', 340.00, 'Dinheiro'),
(39, '2026-04-16', 325.00, 'Cartão de Crédito'),
(19, '2026-06-13', 1090.00, 'Cartão de Crédito'),
(20, '2026-04-13', 1100.00, 'Dinheiro'),
(9, '2026-04-17', 115.00, 'Pix'),
(36, '2026-03-01', 115.00, 'Cartão de Crédito'),
(41, '2026-03-11', 1100.00, 'Boleto'),
(7, '2026-05-24', 1100.00, 'Dinheiro'),
(19, '2026-06-17', 1105.00, 'Boleto'),
(22, '2026-04-06', 110.00, 'Pix'),
(17, '2026-01-23', 120.00, 'Pix'),
(5, '2026-04-04', 605.00, 'Pix'),
(37, '2026-05-23', 120.00, 'Pix'),
(10, '2026-04-21', 1090.00, 'Dinheiro'),
(20, '2026-03-29', 1100.00, 'Pix'),
(36, '2026-02-20', 120.00, 'Dinheiro'),
(39, '2026-05-02', 330.00, 'Cartão de Crédito'),
(50, '2026-02-17', 340.00, 'Boleto'),
(29, '2026-06-22', 595.00, 'Dinheiro'),
(28, '2026-07-08', 1095.00, 'Dinheiro'),
(4, '2026-03-09', 1110.00, 'Pix'),
(49, '2026-04-16', 590.00, 'Cartão de Crédito'),
(17, '2026-01-10', 120.00, 'Cartão de Crédito'),
(16, '2026-07-01', 1090.00, 'Pix');

-- ---------------------------------------------------------------------
-- CONSULTAS
-- ---------------------------------------------------------------------


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
