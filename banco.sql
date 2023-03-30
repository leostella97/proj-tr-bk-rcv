-- Criação do Schema de Teste
CREATE DATABASE meu_schema;

-- Seleção do Schema
USE meu_schema;

-- Criação de Tabela para Teste
CREATE TABLE minha_tabela (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  INDEX (nome)
) ENGINE=InnoDB;

-- Transações
START TRANSACTION;
INSERT INTO minha_tabela (nome, email) VALUES ('Fulano', 'fulano@teste.com');
INSERT INTO minha_tabela (nome, email) VALUES ('Ciclano', 'ciclano@teste.com');
COMMIT;

-- Backup
mysqldump -u root -p meu_schema > meu_backup.sql;

-- Simulação de Perda de Dados
DROP TABLE minha_tabela;

-- Recovery
mysql -u root -p meu_schema < meu_backup.sql;
