# FDB - Banco de Dados de uma Academia

Projeto de banco de dados relacional para o sistema de gestão de uma academia/estúdio de modalidades, desenvolvido em MySQL.

## Sobre o projeto

O banco modela o funcionamento de uma academia: instrutores que dão aulas em turmas de diferentes modalidades, alunos que se matriculam e participam dessas turmas, e o controle de pagamentos de cada matrícula.

## Estrutura

O banco é composto por 7 tabelas:

- **Instrutores** - dados dos professores
- **Modalidades** - tipos de aula oferecidos (musculação, yoga, crossfit, etc.)
- **Alunos** - cadastro dos alunos
- **Turmas** - aulas vinculadas a um instrutor e uma modalidade
- **Aluno_turma** - tabela associativa que relaciona alunos às turmas (relacionamento N:N)
- **Matriculas** - matrícula de um aluno na academia (plano, status)
- **Pagamentos** - pagamentos referentes a cada matrícula

### Relacionamentos

- Instrutor → Turma (1:N)
- Modalidade → Turma (1:N)
- Aluno → Matrícula (1:N)
- Matrícula → Pagamento (1:N)
- Aluno ↔ Turma (N:N, via Aluno_turma)

O esquema conceitual (MER) está nos arquivos `esquema_conceitual.drawio` e `FBD.drawio.png`.

## Arquivo do banco

- `academia_mysql.sql` — script completo: criação das tabelas, inserção de 50 registros por tabela e consultas de exemplo (SELECT, JOIN, GROUP BY, funções de agregação, matemáticas, de string e de data).

> Os dados (nomes, CPFs, telefones, datas) são fictícios, gerados apenas para fins de teste e demonstração do banco.

## Como executar

1. Abra o **MySQL Workbench** e conecte na sua instância local.
2. Vá em **File → Open SQL Script...** e selecione `academia_mysql.sql`.
3. Clique no ícone de raio (⚡) para executar o script inteiro.

## Tecnologia

- SGBD: MySQL 8.0
- Ferramenta: MySQL Workbench
