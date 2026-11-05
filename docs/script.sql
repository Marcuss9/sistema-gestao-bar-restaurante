-- ============================================================================
-- BAR E RESTAURANTE ESQUINA DOS AMIGOS - ENTREGA 2
-- SCRIPT SQL COMPLETO - MYSQL 8.0.16+ (MySQL Workbench)
-- Modelo de referencia: DER revisado com 7 entidades e modelo logico com
-- 9 tabelas, 46 colunas e 8 chaves estrangeiras, incluindo Despesa.
-- Base documental: README da main, 00-d_Esqueleto_Entrega_2(2).md e
-- esquina_dos_amigos_mysql01(1).sql (script original preservado).
-- Massa de dados da Secao 4 esta incluida nos INSERT INTO deste mesmo arquivo.
-- Os dados foram concebidos para demonstrar P1 (vendas), P2 (financas)
-- e P3 (estoque). RN07/RN08 ainda exigem evolucao do modelo.
-- G01 a G12 sao as consultas oficiais de referencia da secao 1.6;
-- G13 a G16 reaproveitam consultas complementares da equipe, renumeradas
-- sem conflito. A01 a A05 sao auditorias; D01 a D10 sao diagnosticos.
-- Todos os dados inseridos sao ficticios, exclusivamente para demonstracao.
--
-- ATENCAO: o script APAGA as 9 tabelas listadas abaixo e seus dados.
-- Execute somente no banco de teste esquina_dos_amigos.
--
-- DECISOES E LIMITES IMPORTANTES:
-- 1) Pagamento.id_pedido UNIQUE limita a no maximo um pagamento por pedido,
--    mas nao exige um pagamento para cada pedido. RN15 e decisao do projeto,
--    ainda sem confirmacao presencial do processo operacional.
-- 2) FKs nao exigem ao menos um item por pedido/compra; D01 e D02 auditam.
-- 3) Despesa registra obrigacoes pagas ou pendentes, ligadas opcionalmente
--    a Compra. UMA linha = UMA parcela/obrigacao; pagamento parcial de uma
--    mesma parcela nao esta modelado. Datas e valores sao ficticios.
-- 4) Despesa JA consta nos diagramas e README revisados; o
--    dicionario de dados HTML precisa ser atualizado pelo grupo.
--    A confirmacao do escopo financeiro com a organizacao continua necessaria.
-- 5) Estoque tem saldo cadastrado e movimentos parciais: sem saldo inicial
--    ou origem vinculada nao e possivel conciliar todo o historico.
-- 6) Dominios como status_pedido e praticas de cancelamento aguardam validacao.
-- 7) Consultas Axx citam RNxx existentes no README, mesmo quando propostos;
--    Dxx auditam integridade relacionada aos RFs, sem inventar RNxx.
-- 8) Demonstracao somente: resultados NAO sao indicadores reais do restaurante.
-- 9) DROP TABLE executa DDL destrutiva; NAO rode em base de producao.
-- ============================================================================

-- 1. CREATE DATABASE E PREPARACAO DO AMBIENTE DE TESTES
CREATE DATABASE IF NOT EXISTS `esquina_dos_amigos`
    CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `esquina_dos_amigos`;
SET NAMES utf8mb4;

-- Derrubar tabelas dependentes antes das respectivas tabelas pai.
DROP TABLE IF EXISTS `Despesa`;
DROP TABLE IF EXISTS `Contem`;
DROP TABLE IF EXISTS `Adquire`;
DROP TABLE IF EXISTS `Pagamento`;
DROP TABLE IF EXISTS `Movimentacao_Estoque`;
DROP TABLE IF EXISTS `Compra`;
DROP TABLE IF EXISTS `Pedido`;
DROP TABLE IF EXISTS `Produto`;
DROP TABLE IF EXISTS `Fornecedor`;

-- 2. CREATE TABLE E CONSTRAINTS (PK, FK, NOT NULL, UNIQUE, CHECK)
-- 2.1 Tabelas independentes
CREATE TABLE `Pedido` (
    `id_pedido`               INT NOT NULL AUTO_INCREMENT,
    `data_hora_pedido`        DATETIME NOT NULL,
    `tipo_atendimento_pedido` VARCHAR(20) NOT NULL,
    `status_pedido`           VARCHAR(30) NOT NULL,
    `observacao_pedido`       VARCHAR(500) NULL,
    `endereco_entrega_pedido` VARCHAR(255) NULL,
    CONSTRAINT `pk_pedido` PRIMARY KEY (`id_pedido`),
    CONSTRAINT `ck_pedido_atendimento`
        CHECK (`tipo_atendimento_pedido` IN ('presencial','entrega')),
    CONSTRAINT `ck_pedido_endereco_entrega`
        CHECK (`tipo_atendimento_pedido` <> 'entrega'
               OR (`endereco_entrega_pedido` IS NOT NULL
                   AND CHAR_LENGTH(TRIM(`endereco_entrega_pedido`)) > 0)),
    CONSTRAINT `ck_pedido_status_nao_vazio`
        CHECK (CHAR_LENGTH(TRIM(`status_pedido`)) > 0),
    INDEX `idx_pedido_data` (`data_hora_pedido`)
) ENGINE=InnoDB;

CREATE TABLE `Produto` (
    `id_produto`                 INT NOT NULL AUTO_INCREMENT,
    `nome_produto`               VARCHAR(120) NOT NULL,
    `categoria_produto`          VARCHAR(80) NOT NULL,
    `preco_venda_produto`        DECIMAL(12,2) NOT NULL,
    `quantidade_estoque_produto` INT NOT NULL,
    CONSTRAINT `pk_produto` PRIMARY KEY (`id_produto`),
    CONSTRAINT `ck_produto_nome` CHECK (CHAR_LENGTH(TRIM(`nome_produto`)) > 0),
    CONSTRAINT `ck_produto_categoria`
        CHECK (CHAR_LENGTH(TRIM(`categoria_produto`)) > 0),
    CONSTRAINT `ck_produto_preco` CHECK (`preco_venda_produto` >= 0),
    CONSTRAINT `ck_produto_estoque` CHECK (`quantidade_estoque_produto` >= 0)
) ENGINE=InnoDB;

CREATE TABLE `Fornecedor` (
    `id_fornecedor`   INT NOT NULL AUTO_INCREMENT,
    `tipo_fornecedor` VARCHAR(40) NOT NULL,
    `nome_fornecedor` VARCHAR(160) NOT NULL,
    CONSTRAINT `pk_fornecedor` PRIMARY KEY (`id_fornecedor`),
    CONSTRAINT `ck_fornecedor_nome`
        CHECK (CHAR_LENGTH(TRIM(`nome_fornecedor`)) > 0),
    CONSTRAINT `ck_fornecedor_tipo`
        CHECK (CHAR_LENGTH(TRIM(`tipo_fornecedor`)) > 0)
) ENGINE=InnoDB;

-- 2.2 Tabelas com relacionamentos 1:N ou 1:1
CREATE TABLE `Pagamento` (
    `id_pagamento`          INT NOT NULL AUTO_INCREMENT,
    `id_pedido`             INT NOT NULL,
    `forma_pagamento`       VARCHAR(30) NOT NULL,
    `data_hora_pagamento`   DATETIME NOT NULL,
    `preco_total_pagamento` DECIMAL(12,2) NOT NULL,
    CONSTRAINT `pk_pagamento` PRIMARY KEY (`id_pagamento`),
    CONSTRAINT `uq_pagamento_pedido` UNIQUE (`id_pedido`),
    CONSTRAINT `fk_pagamento_pedido`
        FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`id_pedido`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `ck_pagamento_forma`
        CHECK (`forma_pagamento` IN
            ('dinheiro','credito','debito','vale_refeicao','pix')),
    CONSTRAINT `ck_pagamento_valor` CHECK (`preco_total_pagamento` >= 0),
    INDEX `idx_pagamento_data` (`data_hora_pagamento`)
) ENGINE=InnoDB;

CREATE TABLE `Compra` (
    `id_compra`          INT NOT NULL AUTO_INCREMENT,
    `id_fornecedor`      INT NOT NULL,
    `preco_total_compra` DECIMAL(12,2) NOT NULL,
    `data_compra`        DATE NOT NULL,
    CONSTRAINT `pk_compra` PRIMARY KEY (`id_compra`),
    CONSTRAINT `fk_compra_fornecedor`
        FOREIGN KEY (`id_fornecedor`) REFERENCES `Fornecedor` (`id_fornecedor`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `ck_compra_valor` CHECK (`preco_total_compra` >= 0),
    INDEX `idx_compra_data` (`data_compra`)
) ENGINE=InnoDB;

CREATE TABLE `Movimentacao_Estoque` (
    `id_movimentacao`        INT NOT NULL AUTO_INCREMENT,
    `id_produto`             INT NOT NULL,
    `tipo_movimentacao`      VARCHAR(15) NOT NULL,
    `quantidade_movimentada` INT NOT NULL,
    `data_hora_movimentacao` DATETIME NOT NULL,
    `motivo_movimentacao`    VARCHAR(255) NOT NULL,
    CONSTRAINT `pk_movimentacao_estoque` PRIMARY KEY (`id_movimentacao`),
    CONSTRAINT `fk_movimentacao_produto`
        FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `ck_movimentacao_tipo`
        CHECK (`tipo_movimentacao` IN ('entrada','saida')),
    CONSTRAINT `ck_movimentacao_quantidade`
        CHECK (`quantidade_movimentada` > 0),
    CONSTRAINT `ck_movimentacao_motivo`
        CHECK (CHAR_LENGTH(TRIM(`motivo_movimentacao`)) > 0),
    INDEX `idx_movimentacao_produto_data`
        (`id_produto`, `data_hora_movimentacao`)
) ENGINE=InnoDB;

-- 2.3 Obrigacoes financeiras (extensao necessaria para P2)
-- Compra registra o valor contratado, enquanto Despesa registra a obrigacao
-- financeira e se houve pagamento. Uma compra pode ter varias parcelas.
-- Despesas de contas podem ter id_compra NULL.
-- O CHECK a seguir documenta a consistencia de situacao, data e modalidade.
CREATE TABLE `Despesa` (
    `id_despesa`        INT NOT NULL AUTO_INCREMENT,
    `id_compra`         INT NULL,
    `categoria_despesa` VARCHAR(20) NOT NULL,
    `descricao_despesa` VARCHAR(160) NOT NULL,
    `valor_despesa`     DECIMAL(12,2) NOT NULL,
    `data_vencimento`   DATE NOT NULL,
    `status_despesa`    VARCHAR(15) NOT NULL,
    `data_pagamento`    DATE NULL,
    `forma_pagamento`   VARCHAR(30) NULL,
    CONSTRAINT `pk_despesa` PRIMARY KEY (`id_despesa`),
    -- Sem ON UPDATE/ON DELETE: padrao NO ACTION (equiv. RESTRICT no InnoDB).
    -- Isso permite CHECK de origem envolvendo a mesma coluna id_compra.
    CONSTRAINT `fk_despesa_compra`
        FOREIGN KEY (`id_compra`) REFERENCES `Compra` (`id_compra`),
    CONSTRAINT `ck_despesa_categoria`
        CHECK (`categoria_despesa` IN ('compra','conta','outra')),
    CONSTRAINT `ck_despesa_descricao`
        CHECK (CHAR_LENGTH(TRIM(`descricao_despesa`)) > 0),
    CONSTRAINT `ck_despesa_valor`
        CHECK (`valor_despesa` > 0),
    CONSTRAINT `ck_despesa_status`
        CHECK (`status_despesa` IN ('paga','pendente')),
    CONSTRAINT `ck_despesa_pagamento`
        CHECK ((`status_despesa` = 'paga'
                AND `data_pagamento` IS NOT NULL
                AND `forma_pagamento` IS NOT NULL
                AND CHAR_LENGTH(TRIM(`forma_pagamento`)) > 0)
               OR (`status_despesa` = 'pendente'
                   AND `data_pagamento` IS NULL
                   AND `forma_pagamento` IS NULL)),
    CONSTRAINT `ck_despesa_origem`
        CHECK ((`categoria_despesa` = 'compra' AND `id_compra` IS NOT NULL)
               OR (`categoria_despesa` <> 'compra' AND `id_compra` IS NULL)),
    INDEX `idx_despesa_pagamento` (`data_pagamento`),
    INDEX `idx_despesa_vencimento` (`data_vencimento`)
) ENGINE=InnoDB;

-- 2.4 Tabelas associativas (PK composta, tambem 2 FKs cada)
CREATE TABLE `Contem` (
    `id_pedido`            INT NOT NULL,
    `id_produto`           INT NOT NULL,
    `quantidade_pedido`    INT NOT NULL,
    `preco_unitario_pedido` DECIMAL(12,2) NOT NULL,
    CONSTRAINT `pk_contem` PRIMARY KEY (`id_pedido`, `id_produto`),
    CONSTRAINT `fk_contem_pedido`
        FOREIGN KEY (`id_pedido`) REFERENCES `Pedido` (`id_pedido`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `fk_contem_produto`
        FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `ck_contem_quantidade` CHECK (`quantidade_pedido` > 0),
    CONSTRAINT `ck_contem_preco` CHECK (`preco_unitario_pedido` >= 0),
    INDEX `idx_contem_produto` (`id_produto`)
) ENGINE=InnoDB;

CREATE TABLE `Adquire` (
    `id_compra`             INT NOT NULL,
    `id_produto`            INT NOT NULL,
    `quantidade_comprada`   INT NOT NULL,
    `preco_unitario_compra` DECIMAL(12,2) NOT NULL,
    CONSTRAINT `pk_adquire` PRIMARY KEY (`id_compra`, `id_produto`),
    CONSTRAINT `fk_adquire_compra`
        FOREIGN KEY (`id_compra`) REFERENCES `Compra` (`id_compra`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `fk_adquire_produto`
        FOREIGN KEY (`id_produto`) REFERENCES `Produto` (`id_produto`)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT `ck_adquire_quantidade` CHECK (`quantidade_comprada` > 0),
    CONSTRAINT `ck_adquire_preco` CHECK (`preco_unitario_compra` >= 0),
    INDEX `idx_adquire_produto` (`id_produto`)
) ENGINE=InnoDB;

-- 3. INSERT INTO - MASSA DE DADOS FICTICIA
-- Volume ilustrativo, NAO atribuido ao movimento real do estabelecimento.
-- Adequar volume a dados operacionais confirmados antes da entrega final.
-- Contem e Adquire registram quantidade e preco por item.
-- Totais de pagamento e de compra conferidos com os itens dos registros pagos.
START TRANSACTION;

INSERT INTO `Fornecedor` (`id_fornecedor`, `tipo_fornecedor`, `nome_fornecedor`) VALUES
    (1, 'distribuidora', 'Distribuidora Exemplo A'),
    (2, 'supermercado', 'Mercado Exemplo B'),
    (3, 'distribuidora', 'Distribuidora Exemplo C'),
    (4, 'hortifruti', 'Fornecedor Exemplo D'),
    (5, 'supermercado', 'Fornecedor Sem Compras (Exemplo)');

INSERT INTO `Produto` (`id_produto`, `nome_produto`, `categoria_produto`, `preco_venda_produto`, `quantidade_estoque_produto`) VALUES
    (1, 'Agua mineral', 'Bebida', '5.00', 50),
    (2, 'Refrigerante lata', 'Bebida', '7.00', 35),
    (3, 'Suco natural', 'Bebida', '9.00', 18),
    (4, 'Cafe coado', 'Bebida', '4.50', 100),
    (5, 'Pao de queijo', 'Lanche', '6.00', 12),
    (6, 'Sanduiche', 'Lanche', '18.00', 15),
    (7, 'Pastel', 'Lanche', '12.00', 20),
    (8, 'Porcao de batata', 'Porcao', '22.00', 5),
    (9, 'Prato feito', 'Refeicao', '28.00', 10),
    (10, 'Sobremesa da casa', 'Sobremesa', '14.00', 0);

INSERT INTO `Pedido` (`id_pedido`, `data_hora_pedido`, `tipo_atendimento_pedido`, `status_pedido`, `observacao_pedido`, `endereco_entrega_pedido`) VALUES
    (1, '2026-10-21 09:20:00', 'presencial', 'concluido', NULL, NULL),
    (2, '2026-10-21 12:15:00', 'presencial', 'concluido', 'Sem gelo', NULL),
    (3, '2026-10-21 13:10:00', 'entrega', 'concluido', 'Entregar na portaria', 'Rua Ficticia, 100, Sao Paulo'),
    (4, '2026-10-22 18:30:00', 'presencial', 'em_preparo', NULL, NULL),
    (5, '2026-10-22 09:00:00', 'presencial', 'concluido', NULL, NULL),
    (6, '2026-10-22 12:25:00', 'entrega', 'concluido', 'Interfone 2', 'Travessa Exemplo, 45, Sao Paulo'),
    (7, '2026-10-23 15:00:00', 'presencial', 'concluido', NULL, NULL),
    (8, '2026-10-23 19:20:00', 'entrega', 'concluido', NULL, 'Rua Demonstracao, 30, Sao Paulo'),
    (9, '2026-10-24 10:05:00', 'presencial', 'concluido', NULL, NULL),
    (10, '2026-10-24 12:35:00', 'presencial', 'concluido', NULL, NULL),
    (11, '2026-10-25 18:00:00', 'presencial', 'concluido', NULL, NULL),
    (12, '2026-10-25 16:00:00', 'entrega', 'concluido', 'Receber na entrada', 'Rua Ilustrativa, 8, Sao Paulo'),
    (13, '2026-10-26 12:10:00', 'presencial', 'cancelado', 'Pedido cancelado (cenario ficticio)', NULL),
    (14, '2026-10-26 12:20:00', 'presencial', 'em_preparo', 'Pedido ainda nao concluido', NULL);

-- Exemplo de preco historico: pedido 9 vende Suco natural a R$ 8,50,
-- embora o preco atual em Produto seja R$ 9,00.
INSERT INTO `Contem` (`id_pedido`, `id_produto`, `quantidade_pedido`, `preco_unitario_pedido`) VALUES
    (1, 1, 2, '5.00'),
    (1, 5, 1, '6.00'),
    (2, 9, 1, '28.00'),
    (2, 2, 2, '7.00'),
    (3, 6, 1, '18.00'),
    (3, 3, 2, '9.00'),
    (4, 8, 1, '22.00'),
    (4, 2, 1, '7.00'),
    (5, 4, 2, '4.50'),
    (5, 5, 1, '6.00'),
    (6, 9, 1, '28.00'),
    (6, 1, 1, '5.00'),
    (7, 7, 2, '12.00'),
    (7, 2, 1, '7.00'),
    (8, 6, 1, '18.00'),
    (8, 10, 1, '14.00'),
    (9, 3, 1, '8.50'),
    (9, 5, 1, '6.00'),
    (10, 9, 1, '28.00'),
    (10, 4, 1, '4.50'),
    (11, 8, 1, '22.00'),
    (11, 3, 1, '9.00'),
    (12, 10, 1, '14.00'),
    (12, 1, 1, '5.00'),
    (13, 7, 1, '12.00'),
    (14, 5, 2, '6.00');

INSERT INTO `Pagamento` (`id_pagamento`, `id_pedido`, `forma_pagamento`, `data_hora_pagamento`, `preco_total_pagamento`) VALUES
    (1, 1, 'dinheiro', '2026-10-21 09:35:00', '16.00'),
    (2, 2, 'pix', '2026-10-21 12:45:00', '42.00'),
    (3, 3, 'credito', '2026-10-21 13:25:00', '36.00'),
    (4, 4, 'debito', '2026-10-22 18:32:00', '29.00'),
    (5, 5, 'dinheiro', '2026-10-22 09:15:00', '15.00'),
    (6, 6, 'pix', '2026-10-22 12:40:00', '33.00'),
    (7, 7, 'credito', '2026-10-23 15:15:00', '31.00'),
    (8, 8, 'pix', '2026-10-23 19:40:00', '32.00'),
    (9, 9, 'vale_refeicao', '2026-10-24 10:20:00', '14.50'),
    (10, 10, 'debito', '2026-10-24 12:55:00', '32.50'),
    (11, 11, 'credito', '2026-10-25 18:30:00', '31.00'),
    (12, 12, 'pix', '2026-10-25 16:20:00', '19.00');

INSERT INTO `Compra` (`id_compra`, `id_fornecedor`, `preco_total_compra`, `data_compra`) VALUES
    (1, 1, '400.00', '2026-10-10'),
    (2, 2, '290.00', '2026-10-11'),
    (3, 3, '160.00', '2026-10-12'),
    (4, 4, '140.00', '2026-10-15'),
    (5, 1, '450.00', '2026-10-18'),
    (6, 2, '210.00', '2026-10-22'),
    (7, 4, '95.00', '2026-10-23'),
    (8, 3, '200.00', '2026-10-24');

INSERT INTO `Adquire` (`id_compra`, `id_produto`, `quantidade_comprada`, `preco_unitario_compra`) VALUES
    (1, 1, 80, '3.00'),
    (1, 2, 20, '4.00'),
    (1, 3, 10, '8.00'),
    (2, 6, 5, '12.00'),
    (2, 8, 10, '16.00'),
    (2, 10, 10, '7.00'),
    (3, 5, 10, '4.00'),
    (3, 7, 20, '6.00'),
    (4, 3, 10, '5.00'),
    (4, 9, 5, '18.00'),
    (5, 1, 100, '3.00'),
    (5, 2, 30, '5.00'),
    (6, 4, 20, '2.00'),
    (6, 8, 10, '17.00'),
    (7, 3, 5, '5.00'),
    (7, 10, 10, '7.00'),
    (8, 5, 20, '4.00'),
    (8, 7, 20, '6.00');

-- Os movimentos representam apenas parte do historico; nao existe saldo
-- inicial confirmado. Portanto, nao se deduz saldo atual pela soma destes eventos.
INSERT INTO `Movimentacao_Estoque` (`id_movimentacao`, `id_produto`, `tipo_movimentacao`, `quantidade_movimentada`, `data_hora_movimentacao`, `motivo_movimentacao`) VALUES
    (1, 1, 'entrada', 40, '2026-10-10 09:00:00', 'Reposicao de bebidas'),
    (2, 2, 'entrada', 30, '2026-10-10 09:05:00', 'Recebimento de mercadorias'),
    (3, 1, 'saida', 4, '2026-10-21 12:00:00', 'Venda'),
    (4, 2, 'saida', 6, '2026-10-21 13:00:00', 'Venda'),
    (5, 3, 'entrada', 20, '2026-10-15 10:30:00', 'Reposicao'),
    (6, 3, 'saida', 3, '2026-10-21 13:40:00', 'Venda'),
    (7, 5, 'entrada', 15, '2026-10-12 08:20:00', 'Compra'),
    (8, 5, 'saida', 2, '2026-10-22 09:20:00', 'Venda'),
    (9, 8, 'entrada', 10, '2026-10-11 11:00:00', 'Compra'),
    (10, 8, 'saida', 2, '2026-10-23 20:00:00', 'Venda'),
    (11, 7, 'entrada', 25, '2026-10-24 08:30:00', 'Recebimento'),
    (12, 7, 'saida', 5, '2026-10-25 10:00:00', 'Venda'),
    (13, 10, 'entrada', 8, '2026-10-23 08:40:00', 'Compra'),
    (14, 10, 'saida', 8, '2026-10-25 19:00:00', 'Venda'),
    (15, 9, 'entrada', 12, '2026-10-15 09:00:00', 'Reposicao'),
    (16, 9, 'saida', 2, '2026-10-24 13:00:00', 'Venda');

-- Relacao entre Compras (valor comprado), contas e saidas reais de caixa (P2).
-- Cada Compra abaixo possui uma obrigacao correspondente, paga ou pendente.
-- Despesas operacionais sao ficticias, sem identificacao de pessoas reais.
INSERT INTO `Despesa`
(`id_despesa`, `id_compra`, `categoria_despesa`, `descricao_despesa`,
 `valor_despesa`, `data_vencimento`, `status_despesa`, `data_pagamento`, `forma_pagamento`) VALUES
    (1, 1, 'compra', 'Pagamento compra 1', '400.00', '2026-10-20', 'paga', '2026-10-20', 'transferencia'),
    (2, 2, 'compra', 'Pagamento compra 2', '290.00', '2026-10-13', 'paga', '2026-10-13', 'pix'),
    (3, 3, 'compra', 'Pagamento compra 3', '160.00', '2026-10-16', 'paga', '2026-10-16', 'transferencia'),
    (4, 4, 'compra', 'Pagamento compra 4', '140.00', '2026-10-18', 'paga', '2026-10-18', 'dinheiro'),
    (5, 5, 'compra', 'Pagamento compra 5', '450.00', '2026-10-22', 'paga', '2026-10-22', 'transferencia'),
    (6, 6, 'compra', 'Compra 6 a pagar', '210.00', '2026-11-10', 'pendente', NULL, NULL),
    (7, 7, 'compra', 'Pagamento compra 7', '95.00', '2026-10-27', 'paga', '2026-10-27', 'pix'),
    (8, 8, 'compra', 'Compra 8 a pagar', '200.00', '2026-11-05', 'pendente', NULL, NULL),
    (9, NULL, 'conta', 'Conta operacional A (ficticia)', '120.00', '2026-10-24', 'paga', '2026-10-24', 'pix'),
    (10, NULL, 'conta', 'Conta operacional B (ficticia)', '85.00', '2026-11-10', 'pendente', NULL, NULL),
    (11, NULL, 'outra', 'Despesa operacional C (ficticia)', '60.00', '2026-10-28', 'paga', '2026-10-28', 'dinheiro');

COMMIT;

-- 4. SELECT COM JOIN - RELACIONAMENTOS ENTRE TABELAS
-- J01 - Quais itens, quantidades e subtotais compoem cada pedido?
SELECT p.`id_pedido`, p.`data_hora_pedido`, pr.`nome_produto`,
       c.`quantidade_pedido`, c.`preco_unitario_pedido`,
       c.`quantidade_pedido` * c.`preco_unitario_pedido` AS `subtotal_item`
FROM `Pedido` AS p
JOIN `Contem` AS c ON c.`id_pedido` = p.`id_pedido`
JOIN `Produto` AS pr ON pr.`id_produto` = c.`id_produto`
ORDER BY p.`id_pedido`, pr.`nome_produto`;

-- J02 - Quais itens, quantidades e custos compoem as compras por fornecedor?
SELECT co.`id_compra`, co.`data_compra`, f.`nome_fornecedor`,
       pr.`nome_produto`, a.`quantidade_comprada`, a.`preco_unitario_compra`,
       a.`quantidade_comprada` * a.`preco_unitario_compra` AS `subtotal_compra`
FROM `Compra` AS co
JOIN `Fornecedor` AS f ON f.`id_fornecedor` = co.`id_fornecedor`
JOIN `Adquire` AS a ON a.`id_compra` = co.`id_compra`
JOIN `Produto` AS pr ON pr.`id_produto` = a.`id_produto`
ORDER BY co.`id_compra`, pr.`nome_produto`;

-- J03 - Quais pagamentos pertencem a cada pedido?
SELECT p.`id_pedido`, p.`data_hora_pedido`, p.`status_pedido`,
       pg.`id_pagamento`, pg.`forma_pagamento`,
       pg.`data_hora_pagamento`, pg.`preco_total_pagamento`
FROM `Pedido` AS p
LEFT JOIN `Pagamento` AS pg ON pg.`id_pedido` = p.`id_pedido`
ORDER BY p.`id_pedido`;

-- 5. UPDATE - ALTERACAO DE REGISTRO FICTICIO
-- Exemplo: o pedido 4 teve o pagamento antecipado e passa de em_preparo
-- para concluido. A condicao pela PK torna a alteracao controlada.
-- Pedidos 13 (cancelado) e 14 (em_preparo) permanecem na massa como cenarios
-- para validar que a G05 nao considera pedidos nao concluidos.
UPDATE `Pedido`
SET `status_pedido` = 'concluido'
WHERE `id_pedido` = 4 AND `status_pedido` = 'em_preparo';

-- 6. DELETE - EXCLUSAO SEGURA DE UM REGISTRO DE TESTE
-- Demonstracao isolada: produto temporario sem vinculacao a outras tabelas.
INSERT INTO `Produto`
(`id_produto`, `nome_produto`, `categoria_produto`,
 `preco_venda_produto`, `quantidade_estoque_produto`)
VALUES (99,'PRODUTO TEMPORARIO PARA DELETE','Teste',1.00,0);

DELETE FROM `Produto` WHERE `id_produto` = 99;

-- 7. CONSULTAS GERENCIAIS (Gxx)
-- G01 - Quanto foi efetivamente recebido em cada dia de pagamento?
-- Atende: P1 (visao dos recebimentos diarios); RF06.
SELECT DATE(`data_hora_pagamento`) AS `dia_recebimento`,
       COUNT(*) AS `numero_pagamentos`,
       SUM(`preco_total_pagamento`) AS `total_recebido`
FROM `Pagamento`
GROUP BY DATE(`data_hora_pagamento`)
ORDER BY `dia_recebimento`;

-- G02 - Quanto foi recebido por forma de pagamento em outubro de 2026?
-- Atende: P1; RF04 e RF06; RN01.
SELECT `forma_pagamento`, COUNT(*) AS `quantidade_pagamentos`,
       SUM(`preco_total_pagamento`) AS `total_recebido`
FROM `Pagamento`
WHERE `data_hora_pagamento` >= '2026-10-01'
  AND `data_hora_pagamento` <  '2026-11-01'
GROUP BY `forma_pagamento`
ORDER BY `total_recebido` DESC;

-- G03 - Qual o valor total das COMPRAS por fornecedor?
-- Atende PARCIALMENTE: P2; RF07.
-- NAO representa gastos efetivamente pagos nem contas do estabelecimento.
SELECT f.`id_fornecedor`, f.`nome_fornecedor`,
       COUNT(co.`id_compra`) AS `numero_compras`,
       COALESCE(SUM(co.`preco_total_compra`),0) AS `valor_compras`
FROM `Fornecedor` AS f
LEFT JOIN `Compra` AS co ON co.`id_fornecedor` = f.`id_fornecedor`
GROUP BY f.`id_fornecedor`, f.`nome_fornecedor`
ORDER BY `valor_compras` DESC;

-- G04 - Quais produtos estao sem estoque registrado?
-- Atende PARCIALMENTE: P3 (controle de estoque); RF09 e RF12.
-- RN07 exige estoque minimo configuravel; este campo ainda nao existe.
-- Esta consulta detecta saldo ZERO, nao o limite minimo de cada produto.
SELECT `id_produto`, `nome_produto`, `categoria_produto`,
       `quantidade_estoque_produto`
FROM `Produto`
WHERE `quantidade_estoque_produto` = 0
ORDER BY `nome_produto`;

-- G05 - Quantas unidades e qual o valor de pedidos CONCLUIDOS por produto?
-- Atende: P1 (composicao das vendas); RF03 e RF05.
-- Pedido cancelado ou em preparo nao entra como venda efetivada.
-- A existencia de pagamento unico deve ser reavaliada se RN15 for alterada.
SELECT pr.`id_produto`, pr.`nome_produto`,
       COALESCE(SUM(c.`quantidade_pedido`),0) AS `unidades_vendidas`,
       COALESCE(SUM(c.`quantidade_pedido` * c.`preco_unitario_pedido`),0)
         AS `valor_vendido`
FROM `Produto` AS pr
LEFT JOIN (
    SELECT c.`id_produto`, c.`quantidade_pedido`, c.`preco_unitario_pedido`
    FROM `Contem` AS c
    JOIN `Pedido` AS p ON p.`id_pedido` = c.`id_pedido`
    JOIN `Pagamento` AS pg ON pg.`id_pedido` = p.`id_pedido`
    WHERE p.`status_pedido` = 'concluido'
) AS c ON c.`id_produto` = pr.`id_produto`
GROUP BY pr.`id_produto`, pr.`nome_produto`
ORDER BY `unidades_vendidas` DESC, pr.`nome_produto`;

-- G06 - Qual o historico agregado de entradas e saidas por produto?
-- Atende: P3; RF11 e RF12. O saldo inicial nao foi confirmado.
SELECT pr.`id_produto`, pr.`nome_produto`,
       COALESCE(SUM(CASE WHEN m.`tipo_movimentacao` = 'entrada'
                    THEN m.`quantidade_movimentada` ELSE 0 END),0) AS `entradas`,
       COALESCE(SUM(CASE WHEN m.`tipo_movimentacao` = 'saida'
                    THEN m.`quantidade_movimentada` ELSE 0 END),0) AS `saidas`,
       pr.`quantidade_estoque_produto` AS `saldo_cadastrado`
FROM `Produto` AS pr
LEFT JOIN `Movimentacao_Estoque` AS m ON m.`id_produto` = pr.`id_produto`
GROUP BY pr.`id_produto`, pr.`nome_produto`, pr.`quantidade_estoque_produto`
ORDER BY pr.`nome_produto`;

-- G07 - Quantos pagamentos ocorreram e qual o ticket medio por dia de recebimento?
-- Atende: P1; RF06. Agrupamento pela data do pagamento, NAO do pedido.
SELECT DATE(pg.`data_hora_pagamento`) AS `dia_recebimento`,
       COUNT(*) AS `quantidade_pagamentos`,
       SUM(pg.`preco_total_pagamento`) AS `total_recebido`,
       ROUND(AVG(pg.`preco_total_pagamento`),2) AS `ticket_medio_recebido`
FROM `Pagamento` AS pg
GROUP BY DATE(pg.`data_hora_pagamento`)
ORDER BY `dia_recebimento`;

-- G08 - Quanto foi adquirido de cada produto em unidades e em valor?
-- Atende parcialmente: P2; RF07 (compras, nao pagamentos dos fornecedores).
SELECT pr.`id_produto`, pr.`nome_produto`,
       COALESCE(SUM(a.`quantidade_comprada`),0) AS `unidades_compradas`,
       COALESCE(SUM(a.`quantidade_comprada` * a.`preco_unitario_compra`),0)
         AS `valor_comprado`
FROM `Produto` AS pr
LEFT JOIN `Adquire` AS a ON a.`id_produto` = pr.`id_produto`
GROUP BY pr.`id_produto`, pr.`nome_produto`
ORDER BY `valor_comprado` DESC;

-- G09 - Quanto entrou e SAIU efetivamente do caixa por dia? (Fluxo diario)
-- Atende: P1 e P2; RF06 e RF14. KPI: saldo de caixa diario ficticio.
-- Valores de compra pendente nao sao tratados como despesa paga.
-- O saldo e apenas entradas menos saidas no periodo; NAO e lucro.
SELECT `dia`,
       SUM(`entrada`) AS `total_recebido`,
       SUM(`saida`) AS `total_pago`,
       SUM(`entrada`) - SUM(`saida`) AS `saldo_liquido_dia`
FROM (
    SELECT DATE(`data_hora_pagamento`) AS `dia`,
           SUM(`preco_total_pagamento`) AS `entrada`,
           CAST(0 AS DECIMAL(12,2)) AS `saida`
    FROM `Pagamento`
    GROUP BY DATE(`data_hora_pagamento`)
    UNION ALL
    SELECT `data_pagamento` AS `dia`,
           CAST(0 AS DECIMAL(12,2)) AS `entrada`,
           SUM(`valor_despesa`) AS `saida`
    FROM `Despesa`
    WHERE `status_despesa` = 'paga'
    GROUP BY `data_pagamento`
) AS `fluxo`
GROUP BY `dia`
ORDER BY `dia`;

-- G10 - Quais despesas e parcelas permanecem pendentes?
-- Atende: P2; RF14. Lista de obrigacoes: NAO retorna um total agregado.
-- A Secao 1.6 nao trata esta listagem como KPI de soma consolidada.
SELECT d.`id_despesa`, d.`categoria_despesa`, d.`descricao_despesa`,
       d.`id_compra`, d.`data_vencimento`, d.`valor_despesa`
FROM `Despesa` AS d
WHERE d.`status_despesa` = 'pendente'
ORDER BY d.`data_vencimento`, d.`id_despesa`;

-- G11 - Quanto foi realmente desembolsado por categoria em cada mes?
-- Atende: P2; RF14. KPI: desembolsos por categoria e periodo.
SELECT DATE_FORMAT(`data_pagamento`, '%Y-%m') AS `mes_pagamento`,
       `categoria_despesa`, COUNT(*) AS `numero_pagamentos`,
       SUM(`valor_despesa`) AS `total_pago`
FROM `Despesa`
WHERE `status_despesa` = 'paga'
GROUP BY DATE_FORMAT(`data_pagamento`, '%Y-%m'), `categoria_despesa`
ORDER BY `mes_pagamento`, `categoria_despesa`;

-- G12 - Quais compras tem obrigacoes pagas e valores ainda a pagar?
-- Atende: P2; RF07 e RF14.
SELECT co.`id_compra`, co.`data_compra`, f.`nome_fornecedor`,
       co.`preco_total_compra` AS `valor_comprado`,
       COALESCE(SUM(CASE WHEN d.`status_despesa` = 'paga'
                         THEN d.`valor_despesa` ELSE 0 END),0) AS `valor_pago`,
       COALESCE(SUM(CASE WHEN d.`status_despesa` = 'pendente'
                         THEN d.`valor_despesa` ELSE 0 END),0) AS `valor_pendente`
FROM `Compra` AS co
JOIN `Fornecedor` AS f ON f.`id_fornecedor` = co.`id_fornecedor`
LEFT JOIN `Despesa` AS d ON d.`id_compra` = co.`id_compra`
GROUP BY co.`id_compra`, co.`data_compra`, f.`nome_fornecedor`, co.`preco_total_compra`
ORDER BY co.`data_compra`, co.`id_compra`;

-- 7.1 CONSULTAS GERENCIAIS COMPLEMENTARES DA EQUIPE (G13 A G16)
-- Adaptadas de consultas_gerenciais_BI_IA(1).sql, sem sobrescrever G01-G12.
-- Os resultados abaixo sao analises adicionais de P1/P2; nao renumeram os
-- indicadores K01-K11 ja documentados na secao 1.6 do README.
-- As datas das consultas de teste usam a massa ficticia de outubro de 2026.

-- G13 - Qual o ticket medio mensal por pedido com recebimento registrado?
-- Atende: P1; RF05 e RF06. Adaptada da G03 do arquivo complementar.
-- Um pagamento registrado nao comprova por si so a conclusao do pedido;
-- usar este indicador como media de RECEBIMENTOS por pedido pago.
SELECT DATE_FORMAT(pg.`data_hora_pagamento`, '%Y-%m') AS `mes_recebimento`,
       COUNT(DISTINCT pg.`id_pedido`) AS `pedidos_com_pagamento`,
       SUM(pg.`preco_total_pagamento`) AS `total_recebido`,
       ROUND(SUM(pg.`preco_total_pagamento`) /
             NULLIF(COUNT(DISTINCT pg.`id_pedido`),0),2) AS `ticket_medio_mensal`
FROM `Pagamento` AS pg
GROUP BY DATE_FORMAT(pg.`data_hora_pagamento`, '%Y-%m')
ORDER BY `mes_recebimento`;

-- G14 - Qual o custo medio ponderado de aquisicao de cada produto por mes?
-- Atende: P2; RF07. Adaptada da G11 do arquivo complementar.
-- Inclui somente produtos das compras registradas em Adquire; nao calcula
-- o custo completo dos pratos nem o custo de ingredientes nao cadastrados.
SELECT DATE_FORMAT(co.`data_compra`, '%Y-%m') AS `mes_compra`,
       pr.`id_produto`, pr.`nome_produto`,
       SUM(a.`quantidade_comprada`) AS `unidades_compradas`,
       ROUND(SUM(a.`quantidade_comprada` * a.`preco_unitario_compra`) /
             NULLIF(SUM(a.`quantidade_comprada`),0),2) AS `custo_medio_unitario`
FROM `Compra` AS co
JOIN `Adquire` AS a ON a.`id_compra` = co.`id_compra`
JOIN `Produto` AS pr ON pr.`id_produto` = a.`id_produto`
GROUP BY DATE_FORMAT(co.`data_compra`, '%Y-%m'),
         pr.`id_produto`, pr.`nome_produto`
ORDER BY `mes_compra`, pr.`nome_produto`;

-- G15 - Em quais horarios se concentram os pedidos CONCLUIDOS e pagos?
-- Atende: P1; RF02 e RF05. Adaptada da G12 do arquivo complementar.
-- A contagem usa o horario do pedido, nao o horario do recebimento.
-- O filtro pelo status evita confundir pedido em preparo com venda concluida.
SELECT HOUR(p.`data_hora_pedido`) AS `hora_do_pedido`,
       COUNT(*) AS `pedidos_concluidos_pagos`
FROM `Pedido` AS p
WHERE p.`status_pedido` = 'concluido'
  AND EXISTS (SELECT 1 FROM `Pagamento` AS pg
              WHERE pg.`id_pedido` = p.`id_pedido`)
GROUP BY HOUR(p.`data_hora_pedido`)
ORDER BY `hora_do_pedido`;

-- G16 - Quantos pedidos CONCLUIDOS com pagamento existem por dia?
-- Atende: P1; RF02, RF04 e RN15. Adaptada da G04 complementar.
-- Pedidos em preparo ou cancelados nao entram nesse indicador.
SELECT DATE(p.`data_hora_pedido`) AS `dia_pedido`,
       COUNT(*) AS `pedidos_concluidos_pagos`
FROM `Pedido` AS p
WHERE p.`status_pedido` = 'concluido'
  AND EXISTS (SELECT 1 FROM `Pagamento` AS pg
              WHERE pg.`id_pedido` = p.`id_pedido`)
GROUP BY DATE(p.`data_hora_pedido`)
ORDER BY `dia_pedido`;

-- 8. CONSULTAS DE AUDITORIA (Axx) - COM CODIGOS RNxx DO README
-- Cada auditoria abaixo cita uma regra RNxx ja documentada.
-- Resultados esperados para os dados ficticios: ZERO linhas.
-- RN13 e proposta; RN15 e decisao documental do projeto, ainda
-- sem comprovacao da forma de cobranca na organizacao.

-- A01 - Existe pagamento com modalidade fora das permitidas?
-- Verifica: RN01 (modalidades de pagamento aceitas).
SELECT `id_pagamento`, `forma_pagamento`
FROM `Pagamento`
WHERE `forma_pagamento` NOT IN
 ('dinheiro','credito','debito','vale_refeicao','pix');

-- A02 - Existe compra sem um fornecedor valido?
-- Verifica: RN06 (identificacao obrigatoria do fornecedor).
SELECT co.`id_compra`, co.`id_fornecedor`
FROM `Compra` AS co
LEFT JOIN `Fornecedor` AS f ON f.`id_fornecedor` = co.`id_fornecedor`
WHERE f.`id_fornecedor` IS NULL;

-- A03 - Existe produto com estoque cadastrado negativo?
-- Verifica: RN13 (proposta de impedir saldo negativo; confirmar com negocio).
SELECT `id_produto`, `nome_produto`, `quantidade_estoque_produto`
FROM `Produto`
WHERE `quantidade_estoque_produto` < 0;

-- A04 - Existe pedido CONCLUIDO sem pagamento vinculado?
-- Verifica: RN15 (pagamento unico no ato, decisao documental).
-- A auditoria nao considera cancelados nem pedidos ainda em preparo.
-- Nao interpretar resultado nao vazio como violacao sem validar a RN15.
SELECT p.`id_pedido`, p.`status_pedido`
FROM `Pedido` AS p
LEFT JOIN `Pagamento` AS pg ON pg.`id_pedido` = p.`id_pedido`
WHERE p.`status_pedido` = 'concluido'
  AND pg.`id_pagamento` IS NULL;

-- A05 - Ha identificadores de pedido duplicados?
-- Verifica: RN09 (cada pedido tem identificador unico); a PK ja bloqueia isso.
SELECT `id_pedido`, COUNT(*) AS `ocorrencias`
FROM `Pedido`
GROUP BY `id_pedido`
HAVING COUNT(*) > 1;

-- 8.1 DIAGNOSTICOS COMPLEMENTARES (Dxx)
-- Essas verificacoes sao importantes para os RFs e para a integridade dos
-- totais, mas ainda NAO possuem uma RNxx correspondente validada na secao 1.1.
-- Nao inventar novos codigos RNxx apenas para satisfazer o esqueleto;
-- solicitar a documentacao/confirmacao dessas regras ao grupo responsavel.
-- Resultados esperados nos testes: ZERO linhas.

-- D01 - Existe pedido que nao contem nenhum produto?
-- Verifica: RF03 (pedido com ao menos um item); RNxx ainda nao definida.
SELECT p.`id_pedido`, p.`data_hora_pedido`
FROM `Pedido` AS p
LEFT JOIN `Contem` AS c ON c.`id_pedido` = p.`id_pedido`
WHERE c.`id_pedido` IS NULL;

-- D02 - Existe compra que nao contem nenhum produto?
-- Verifica: RF07 (compra com ao menos um item); RNxx ainda nao definida.
SELECT co.`id_compra`, co.`data_compra`
FROM `Compra` AS co
LEFT JOIN `Adquire` AS a ON a.`id_compra` = co.`id_compra`
WHERE a.`id_compra` IS NULL;

-- D03 - Existe pedido destinado a entrega sem endereco valido?
-- Verifica: RF13 (endereco condicional para entrega); RNxx pendente.
SELECT `id_pedido`, `tipo_atendimento_pedido`
FROM `Pedido`
WHERE `tipo_atendimento_pedido` = 'entrega'
  AND (`endereco_entrega_pedido` IS NULL
       OR CHAR_LENGTH(TRIM(`endereco_entrega_pedido`)) = 0);

-- D04 - Existe item de pedido com quantidade ou preco invalido?
-- Verifica: RF03 e RF05 (integridade dos itens); RNxx pendente.
SELECT `id_pedido`, `id_produto`, `quantidade_pedido`, `preco_unitario_pedido`
FROM `Contem`
WHERE `quantidade_pedido` <= 0 OR `preco_unitario_pedido` < 0;

-- D05 - Existe item de compra com quantidade ou preco invalido?
-- Verifica: RF07 (integridade de itens de compra); RNxx pendente.
SELECT `id_compra`, `id_produto`, `quantidade_comprada`, `preco_unitario_compra`
FROM `Adquire`
WHERE `quantidade_comprada` <= 0 OR `preco_unitario_compra` < 0;

-- D06 - Existe pedido pago cujo valor diverge da soma de seus itens?
-- Verifica: RF05 (vendas). Pressupoe pagamento unico e integral conforme
-- o DER; rever se RN15 permitir pagamento posterior ou parcial.
SELECT p.`id_pedido`, pg.`preco_total_pagamento`,
       SUM(c.`quantidade_pedido` * c.`preco_unitario_pedido`) AS `total_itens`
FROM `Pedido` AS p
JOIN `Pagamento` AS pg ON pg.`id_pedido` = p.`id_pedido`
JOIN `Contem` AS c ON c.`id_pedido` = p.`id_pedido`
GROUP BY p.`id_pedido`, pg.`preco_total_pagamento`
HAVING SUM(c.`quantidade_pedido` * c.`preco_unitario_pedido`)
       <> pg.`preco_total_pagamento`;

-- D07 - Existe compra cujo valor diverge da soma de seus itens?
-- Verifica: RF07 (quantidade/preco e valor total das compras).
SELECT co.`id_compra`, co.`preco_total_compra`,
       SUM(a.`quantidade_comprada` * a.`preco_unitario_compra`) AS `total_itens`
FROM `Compra` AS co
JOIN `Adquire` AS a ON a.`id_compra` = co.`id_compra`
GROUP BY co.`id_compra`, co.`preco_total_compra`
HAVING SUM(a.`quantidade_comprada` * a.`preco_unitario_compra`)
       <> co.`preco_total_compra`;

-- D08 - Existe compra sem obrigacao registrada, ou com soma divergente?
-- Verifica: RF14 (despesas vinculadas ao valor total contratado).
SELECT co.`id_compra`, co.`preco_total_compra`,
       COALESCE(SUM(d.`valor_despesa`),0) AS `valor_obrigacoes`
FROM `Compra` AS co
LEFT JOIN `Despesa` AS d ON d.`id_compra` = co.`id_compra`
GROUP BY co.`id_compra`, co.`preco_total_compra`
HAVING COALESCE(SUM(d.`valor_despesa`),0) <> co.`preco_total_compra`;

-- D09 - Existe pagamento vinculado a pedido cancelado?
-- Verifica: RF05 e RN14 (tratamento de cancelamento ainda em validacao).
SELECT p.`id_pedido`, p.`status_pedido`, pg.`id_pagamento`
FROM `Pedido` AS p
JOIN `Pagamento` AS pg ON pg.`id_pedido` = p.`id_pedido`
WHERE p.`status_pedido` = 'cancelado';

-- D10 - Existe compra contabilizada como conta, ou vice-versa?
-- Verifica: RF14 (coerencia da origem das despesas).
SELECT d.`id_despesa`, d.`id_compra`, d.`categoria_despesa`
FROM `Despesa` AS d
WHERE (d.`categoria_despesa` = 'compra' AND d.`id_compra` IS NULL)
   OR (d.`categoria_despesa` <> 'compra' AND d.`id_compra` IS NOT NULL);

-- 9. CONFERENCIA FINAL DE REGISTROS (APOS UPDATE E DELETE)
SELECT 'Pedido' AS `tabela`, COUNT(*) AS `registros` FROM `Pedido`
UNION ALL SELECT 'Pagamento', COUNT(*) FROM `Pagamento`
UNION ALL SELECT 'Produto', COUNT(*) FROM `Produto`
UNION ALL SELECT 'Compra', COUNT(*) FROM `Compra`
UNION ALL SELECT 'Fornecedor', COUNT(*) FROM `Fornecedor`
UNION ALL SELECT 'Movimentacao_Estoque', COUNT(*) FROM `Movimentacao_Estoque`
UNION ALL SELECT 'Contem', COUNT(*) FROM `Contem`
UNION ALL SELECT 'Adquire', COUNT(*) FROM `Adquire`
UNION ALL SELECT 'Despesa', COUNT(*) FROM `Despesa`;

-- FIM DO SCRIPT.
-- RESULTADOS ESPERADOS da massa ficticia apos UPDATE e DELETE:
-- 14 Pedido, 12 Pagamento, 10 Produto, 8 Compra, 5 Fornecedor,
-- 16 Movimentacao_Estoque, 26 Contem, 18 Adquire e 11 Despesa = 120 linhas.
-- Consultas Axx e Dxx devem retornar zero linhas para os dados demonstrativos.
-- A carga contempla pedidos em_preparo e cancelado, despesas pendentes,
-- pagamentos distintos e produto com estoque zero.
-- ANTES DA ENTREGA: atualizar o dicionario de dados para 9 tabelas,
-- adicionar o script a main (preferencialmente docs/script.sql), vincular
-- no README e confirmar execucao integral no MySQL 8.0.16+.
-- O levantamento nao quantificou volumes reais; justificar os 120 registros
-- como simulacao da Secao 4, nao como movimento medido do restaurante.

