DROP TABLE t_categoria CASCADE CONSTRAINTS;

DROP TABLE t_cliente CASCADE CONSTRAINTS;

DROP TABLE t_exercicio CASCADE CONSTRAINTS;

DROP TABLE t_treinov2 CASCADE CONSTRAINTS;


CREATE TABLE t_categoria (
    id_categoria         NUMBER(4) NOT NULL,
    nm_categoria         VARCHAR2(255),
    t_cliente_id_cliente NUMBER(4) NOT NULL
);

COMMENT ON COLUMN t_categoria.id_categoria IS
    'ESTE ATRIBUTO SERVE PARA SABER A ID DA CATEGORIA  DO TREINO, ELE � CHAVE PRIMARIA E E OBRIGATORIO!';

COMMENT ON COLUMN t_categoria.nm_categoria IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR A CATEGORIA DO TREINO';

ALTER TABLE t_categoria ADD CONSTRAINT t_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE t_cliente (
    id_cliente  NUMBER(4) NOT NULL,
    dt_cadastro DATE NOT NULL,
    em_cliente  VARCHAR2(255) NOT NULL,
    nm_cliente  VARCHAR2(255) NOT NULL,
    sn_cliente  VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN t_cliente.id_cliente IS
    'ESTE ATRIBUTO IRA IDENTIFACAR O USUARIO. ESTE � CHAVE PRIMARIA E OBRIGATORIO.';

COMMENT ON COLUMN t_cliente.em_cliente IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR O EMAIL DO USUARIO, ELE � OBRIGATORIO!';

COMMENT ON COLUMN t_cliente.nm_cliente IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR O NOME DE USUARIO DO LOGIN, ESTE ATRIBUTO E OBRIGATORIO!';

COMMENT ON COLUMN t_cliente.sn_cliente IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR O A SENHA DO USUARIO, ELE � OPCIONAL!';

ALTER TABLE t_cliente ADD CONSTRAINT t_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE t_exercicio (
    id_exercicio             NUMBER(3) NOT NULL,
    nm_exercicio             VARCHAR2(30),
    ds_exercicio             VARCHAR2(90),
    ds_repeticoes            NUMBER(20),
    ds_dificuldade           VARCHAR2(255),
    ds_serie                 NUMBER(20),
    t_categoria_id_categoria NUMBER(4) NOT NULL
);

COMMENT ON COLUMN t_exercicio.id_exercicio IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR O ID DO EXERCICIOS, ELE � CHAVE PRIMARIA E � OBRIGATORIO!';

COMMENT ON COLUMN t_exercicio.nm_exercicio IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR O NOME DO EXERCICIO';

COMMENT ON COLUMN t_exercicio.ds_exercicio IS
    'ESTE ATRIBUTO SERVE PARA ADICIONAR UMA DESCRI��O DOS EXERCICIOS, ELE N�O � OBRIGATORIO!';

COMMENT ON COLUMN t_exercicio.ds_repeticoes IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR AS REPETI��OES DO EXERCICIO';

COMMENT ON COLUMN t_exercicio.ds_dificuldade IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFCAR A DIFICULDADE DO EXERCICIO';

COMMENT ON COLUMN t_exercicio.ds_serie IS
    'ESTE ATRIBUTO SERVE PARA IDENTIFICAR O A SERIE DO EXERCICIO!';

ALTER TABLE t_exercicio ADD CONSTRAINT t_exercicio_pk PRIMARY KEY ( id_exercicio );

CREATE TABLE t_treinov2 (
    id_treino                NUMBER(4) NOT NULL,
    t_exercicio_id_exercicio NUMBER(3) NOT NULL,
    t_cliente_id_cliente     NUMBER(4) NOT NULL
);

COMMENT ON COLUMN t_treinov2.id_treino IS
    'ESTE ATRIBUTO SERVE SABER O ID DO HISTORIOCO DO TREINO, ELE � CHAVE PRIMARIA E � OBRIGATORIO!';

ALTER TABLE t_treinov2 ADD CONSTRAINT t_treinov2_pk PRIMARY KEY ( id_treino );

ALTER TABLE t_categoria
    ADD CONSTRAINT fk_categoria_cliente FOREIGN KEY ( t_cliente_id_cliente )
        REFERENCES t_cliente ( id_cliente );

ALTER TABLE t_exercicio
    ADD CONSTRAINT fk_exercicio_categoria FOREIGN KEY ( t_categoria_id_categoria )
        REFERENCES t_categoria ( id_categoria );

ALTER TABLE t_treinov2
    ADD CONSTRAINT fk_treino_cliente FOREIGN KEY ( t_cliente_id_cliente )
        REFERENCES t_cliente ( id_cliente );

ALTER TABLE t_treinov2
    ADD CONSTRAINT fk_treino_exercicio FOREIGN KEY ( t_exercicio_id_exercicio )
        REFERENCES t_exercicio ( id_exercicio );





INSERT INTO t_cliente (id_cliente, dt_cadastro, em_cliente, nm_cliente, sn_cliente)
VALUES (1001, TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'cliente123@email.com', 'Jo�o Silva', 'senhaSegura123');

COMMIT;

-- Inserir mais 5 clientes
INSERT INTO t_cliente (id_cliente, dt_cadastro, em_cliente, nm_cliente, sn_cliente)
VALUES (1002, TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'cliente456@email.com', 'Maria Oliveira', 'senhaFort3');

INSERT INTO t_cliente (id_cliente, dt_cadastro, em_cliente, nm_cliente, sn_cliente)
VALUES (1003, TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'cliente789@email.com', 'Pedro Santos', 'senha123ABC');

INSERT INTO t_cliente (id_cliente, dt_cadastro, em_cliente, nm_cliente, sn_cliente)
VALUES (1004, TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'cliente101112@email.com', 'Ana Pereira', 'senhaXYZ789');

INSERT INTO t_cliente (id_cliente, dt_cadastro, em_cliente, nm_cliente, sn_cliente)
VALUES (1005, TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'cliente131415@email.com', 'Carlos Lima', 'senha456DEF');

INSERT INTO t_cliente (id_cliente, dt_cadastro, em_cliente, nm_cliente, sn_cliente)
VALUES (1006, TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'cliente161718@email.com', 'Isabel Rocha', 'senhaGHI910');

-- Certifique-se de ajustar os valores conforme necess�rio

COMMIT;


-- Inserindo categorias
INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (1, 'Peito', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (2, 'Perna', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (3, 'Corpo Inteiro', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (4, 'Superior', 1001);
COMMIT;

-- Inserir mais 5 categorias
INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (5, 'Costas', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (6, 'Bra�os', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (7, 'Abd�men', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (8, 'Cardio', 1001);
COMMIT;

INSERT INTO t_categoria (id_categoria, nm_categoria, t_cliente_id_cliente)
VALUES (9, 'Alongamento', 1001);
COMMIT;

-- Certifique-se de ajustar os valores conforme necess�rio

-- Inserindo exerc�cios para a categoria 'Peito'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (1, 'Supino', 'Exerc�cio para desenvolvimento do peito', 10, 'Intermedi�rio', 3, 1);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Perna'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (2, 'Agachamento', 'Exerc�cio para fortalecimento das pernas', 12, 'Avan�ado', 4, 2);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Corpo Inteiro'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (3, 'Burpee', 'Exerc�cio de corpo inteiro que envolve agachamento, flex�es e saltos', 15, 'Avan�ado', 3, 3);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Superior'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (4, 'Desenvolvimento de Ombro', 'Exerc�cio para desenvolvimento dos ombros', 12, 'Intermedi�rio', 3, 4);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Costas'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (5, 'Barra Fixa', 'Exerc�cio para fortalecimento das costas', 10, 'Avan�ado', 3, 5);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Bra�os'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (6, 'Rosca Direta', 'Exerc�cio para b�ceps', 12, 'Intermedi�rio', 3, 6);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Abd�men'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (7, 'Prancha', 'Exerc�cio para fortalecimento do core', 60, 'Intermedi�rio', 3, 7);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Cardio'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (8, 'Corrida', 'Exerc�cio aer�bico para cardio', NULL, 'Moderado', NULL, 8);
COMMIT;

-- Inserindo exerc�cios para a categoria 'Alongamento'
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (9, 'Alongamento de Pernas', 'Exerc�cio de alongamento para pernas', 15, 'Leve', 2, 9);
COMMIT;

-- Inserindo mais exerc�cios para diferentes categorias
INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (10, 'Flex�o de Bra�o', 'Exerc�cio para peito e tr�ceps', 15, 'Intermedi�rio', 3, 1);
COMMIT;

INSERT INTO t_exercicio (id_exercicio, nm_exercicio, ds_exercicio, ds_repeticoes, ds_dificuldade, ds_serie, t_categoria_id_categoria)
VALUES (11, 'Afundo Lateral', 'Exerc�cio para gl�teos e abd�men', 12, 'Intermedi�rio', 3, 2);
COMMIT;

-- Certifique-se de ajustar os valores conforme necess�rio


-- Inserindo treino para o cliente 1001, com o exerc�cio de Supino
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (1, 1, 1001);
COMMIT;

-- Inserindo treino para o cliente 1001, com o exerc�cio de Agachamento
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (2, 2, 1001);
COMMIT;

-- Inserindo treino para o cliente 1001, com o exerc�cio de Burpee
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (3, 3, 1001);
COMMIT;

-- Inserindo treino para o cliente 1001, com o exerc�cio de Desenvolvimento de Ombro
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (4, 4, 1001);
COMMIT;


-- Inserindo treino para o cliente 1001, com o exerc�cio de Barra Fixa
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (5, 5, 1001);
COMMIT;

-- Inserindo treino para o cliente 1001, com o exerc�cio de Rosca Direta
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (6, 6, 1001);
COMMIT;

-- Inserindo treino para o cliente 1001, com o exerc�cio de Prancha
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (7, 7, 1001);
COMMIT;

-- Inserindo treino para o cliente 1001, com o exerc�cio de Corrida
INSERT INTO t_treinov2 (id_treino, t_exercicio_id_exercicio, t_cliente_id_cliente)
VALUES (8, 8, 1001);
COMMIT;

-- Certifique-se de ajustar os valores conforme necess�rio


SELECT id_cliente, nm_cliente, dt_cadastro
FROM t_cliente
ORDER BY dt_cadastro DESC;

SELECT c.nm_cliente, t.id_treino, e.nm_exercicio
FROM t_treinov2 t
JOIN t_cliente c ON t.t_cliente_id_cliente = c.id_cliente
JOIN t_exercicio e ON t.t_exercicio_id_exercicio = e.id_exercicio
ORDER BY c.nm_cliente, t.id_treino;

SELECT cat.nm_categoria, AVG(exe.ds_repeticoes) AS media_repeticoes
FROM t_exercicio exe
JOIN t_categoria cat ON exe.t_categoria_id_categoria = cat.id_categoria
GROUP BY cat.nm_categoria
HAVING AVG(exe.ds_repeticoes) > 10;

SELECT c.nm_cliente, COUNT(t.id_treino) AS quantidade_treinos
FROM t_treinov2 t
JOIN t_cliente c ON t.t_cliente_id_cliente = c.id_cliente
GROUP BY c.nm_cliente;

COMMIT;
