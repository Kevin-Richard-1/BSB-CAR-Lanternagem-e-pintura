-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS BSB_Car;
USE BSB_Car;

-- Tabela de clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL
);

-- Tabela de orçamentos
CREATE TABLE Orcamentos (
    id_orcamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    descricao_servico TEXT NOT NULL,
    data_solicitacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE
);

-- Tabela para armazenar arquivos de fotos
CREATE TABLE Fotos (
    id_foto INT AUTO_INCREMENT PRIMARY KEY,
    id_orcamento INT NOT NULL,
    caminho_arquivo VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_orcamento) REFERENCES Orcamentos(id_orcamento) ON DELETE CASCADE
);

-- Tabela de serviços (catálogo de serviços oferecidos)
CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(12, 2)
);

-- Tabela que associa serviços aos orçamentos (relacionamento muitos-para-muitos)
CREATE TABLE Orcamento_Servicos (
    id_orcamento INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT DEFAULT 1,
    FOREIGN KEY (id_orcamento) REFERENCES Orcamentos(id_orcamento) ON DELETE CASCADE,
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico) ON DELETE CASCADE,
    PRIMARY KEY (id_orcamento, id_servico)
);
