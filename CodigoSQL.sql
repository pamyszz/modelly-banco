CREATE DATABASE bd_Modelly;
USE bd_Modelly;

CREATE TABLE Tb_Usuario (
    Pk_id_Usuario INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Nome_Usuario VARCHAR(50),
    CPF_Usuario VARCHAR(14) UNIQUE,
    Genero_Usuario ENUM('masculino', 'feminino', 'outro'),
    Data_Nasc_Usuario DATE,
    Data_Registro_Usuario DATE,
    Plano_Usuario ENUM('admirador', 'entusiasta', 'colecionador'),
    Permissao_Usuario ENUM('consumidor', 'artesao'),
    Email_Usuario VARCHAR(60),
    Endereco_Usuario VARCHAR(100)
);

CREATE TABLE Tb_Loja (
    Pk_Id_Loja INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_Id_Usuario INT,
    Nome_Loja VARCHAR(50),
    Descricao_Loja VARCHAR(200),
    Plano_Loja ENUM('papel', 'pincel', 'bordado', 'escultura'),
    Telefone_Loja INT,
    Email_Loja VARCHAR(60),
    CNPJ VARCHAR(18) NULL,
    Qtd_Colecao INT,
    Qtd_Produtos INT,
    FOREIGN KEY (Fk_Id_Usuario) REFERENCES Tb_Usuario(Pk_id_Usuario)
);

CREATE TABLE Tb_Produto (
    Pk_Id_Produto INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_id_Loja INT,
    Nome_Produto VARCHAR(80),
    Preco_Produto FLOAT,
    Descricao_Produto TEXT,
    Categoria_Produto ENUM('decoracao', 'acessorios', 'velas', 'moda', 'pets', 'infantil', 'sacolas', 'casas'),
    Qtd_Produto INT,
    Pronta_Entrega BOOLEAN,
    Tempo_producao INT,
    Status_Produto ENUM('producao', 'disponivel', 'esgotado'),
    FOREIGN KEY (Fk_id_Loja) REFERENCES Tb_Loja(Pk_Id_Loja)
);

CREATE TABLE Tb_Carrinho (
    Pk_id_Carrinho INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_id_Usuario INT,
    Fk_id_Produto INT,
    FOREIGN KEY (Fk_id_Usuario) REFERENCES Tb_Usuario(Pk_id_Usuario),
    FOREIGN KEY (Fk_id_Produto) REFERENCES Tb_Produto(Pk_Id_Produto)
);

CREATE TABLE Tb_Pedido (
    Pk_Id_Pedido INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_Id_Produto INT,
    Fk_id_Usuario INT,
    Valor_Frete INT,
    Data_pedido DATETIME,
    Status_Pedido ENUM('pendente', 'pago', 'cancelado'),
    Transportadora VARCHAR(50),
    Codigo_Pedido INT,
    Codigo_Rastreio INT,
    Qtd_Produtos INT,
    Previsao_Entrega DATE,
    FOREIGN KEY (Fk_Id_Produto) REFERENCES Tb_Produto(Pk_Id_Produto),
    FOREIGN KEY (Fk_id_Usuario) REFERENCES Tb_Usuario(Pk_id_Usuario)
);

CREATE TABLE Tb_Pagamento (
    Pk_Id_Pagamento INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_id_Pedido INT,
    Valor_Pagamento INT,
    Metodo_Pagamento ENUM('cartao', 'pix', 'boleto'),
    FOREIGN KEY (Fk_id_Pedido) REFERENCES Tb_Pedido(Pk_Id_Pedido)
);

CREATE TABLE Tb_AvaliacaoLoja (
    Pk_id_AvaliacaoLoja INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_id_Usuario INT,
    Fk_id_Loja INT,
    Conteudo_AvaliacaoLoja VARCHAR(255),
    Data_AvaliacaoLoja DATE,
    Nota_AvaliacaoLoja INT,
    FOREIGN KEY (Fk_id_Usuario) REFERENCES Tb_Usuario(Pk_id_Usuario),
    FOREIGN KEY (Fk_id_Loja) REFERENCES Tb_Loja(Pk_Id_Loja)
);

CREATE TABLE Tb_AvaliacaoProduto (
    Pk_id_AvaliacaoProduto INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_id_Usuario INT,
    Fk_id_Produto INT,
    Conteudo_AvaliacaoProduto VARCHAR(255),
    Data_AvaliacaoProduto DATE,
    Nota_AvaliacaoProduto INT,
    FOREIGN KEY (Fk_id_Usuario) REFERENCES Tb_Usuario(Pk_id_Usuario),
    FOREIGN KEY (Fk_id_Produto) REFERENCES Tb_Produto(Pk_Id_Produto)
);


CREATE TABLE Tb_Seguidor (
    Pk_id_Seguidor INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    Fk_id_usuario INT,
    Fk_id_loja INT,
    FOREIGN KEY (Fk_id_usuario) REFERENCES Tb_Usuario(Pk_id_Usuario),
    FOREIGN KEY (Fk_id_loja) REFERENCES Tb_Loja(Pk_Id_Loja)
);


/* TESTES DO BANCO DE DADOS*/

/* CADASTRO -> USUARIO/LOJA/PRODUTO*/
/*Inserindo 2 usuários -> 1 só consumidor e o outro artesão */
INSERT INTO Tb_Usuario (Nome_Usuario, CPF_Usuario, Genero_Usuario, Data_Nasc_Usuario, Data_Registro_Usuario, Plano_Usuario, Permissao_Usuario, Email_Usuario, Endereco_Usuario)
VALUES ('João Silva', '123.456.789-00', 'masculino', '1990-01-01', CURDATE(), 'entusiasta', 'consumidor', 'joao@example.com', 'Rua A, 123');

INSERT INTO Tb_Usuario (Nome_Usuario, CPF_Usuario, Genero_Usuario, Data_Nasc_Usuario, Data_Registro_Usuario, Plano_Usuario, Permissao_Usuario, Email_Usuario, Endereco_Usuario)
VALUES ('Maria Oliveira', '987.654.321-00', 'feminino', '1985-05-05', CURDATE(), 'colecionador', 'artesao', 'maria@example.com', 'Rua B, 456');

/*Criando a loja do usuário artesão*/
INSERT INTO Tb_Loja (Fk_Id_Usuario, Nome_Loja, Descricao_Loja, Plano_Loja, Telefone_Loja, Email_Loja, CNPJ, Qtd_Colecao, Qtd_Produtos)
VALUES (2, 'Loja da Maria', 'Loja de artesanato', 'escultura', 12345678, 'lojadamaria@example.com', '00.000.000/0001-00', 5, 50);

/*Inserindo os produtos dessa loja*/
INSERT INTO Tb_Produto (Fk_id_Loja, Nome_Produto, Preco_Produto, Descricao_Produto, Categoria_Produto, Qtd_Produto, Pronta_Entrega, Tempo_producao, Status_Produto)
VALUES (1, 'Produto 1', 29.99, 'Descrição do produto 1', 'decoracao', 10, TRUE, 3, 'disponivel');

INSERT INTO Tb_Produto (Fk_id_Loja, Nome_Produto, Preco_Produto, Descricao_Produto, Categoria_Produto, Qtd_Produto, Pronta_Entrega, Tempo_producao, Status_Produto)
VALUES (1, 'Produto 2', 49.99, 'Descrição do produto 2', 'moda', 5, FALSE, 7, 'producao');

/* JORNADA COMPRA -> CARRINHO/PEDIDO*/
/*Inserindo os produtos no carrinho*/
INSERT INTO Tb_Carrinho (Fk_id_Usuario, Fk_id_Produto)
VALUES (1, 1);

INSERT INTO Tb_Carrinho (Fk_id_Usuario, Fk_id_Produto)
VALUES (1, 2);

/*Realizando o pedido dos produtos*/
INSERT INTO Tb_Pedido (Fk_Id_Produto, Fk_id_Usuario, Valor_Frete, Data_pedido, Status_Pedido, Transportadora, Codigo_Pedido, Codigo_Rastreio, Qtd_Produtos, Previsao_Entrega)
VALUES (1, 1, 10.00, CURDATE(), 'pendente', 'Transportadora A', 1001, 123456789, 2, '2024-06-15');

INSERT INTO Tb_Pedido (Fk_Id_Produto, Fk_id_Usuario, Valor_Frete, Data_pedido, Status_Pedido, Transportadora, Codigo_Pedido, Codigo_Rastreio, Qtd_Produtos, Previsao_Entrega)
VALUES (2, 1, 15.00, CURDATE(), 'pendente', 'Transportadora B', 1002, 987654321, 1, '2024-06-20');


/*PROCESSANDO A COMPRA, ATUALIZANDO O STATUS DO PEDIDO E REMOVENDO PRODUTOS DO CARRINHO*/
/*Adicionando os produtos com a compra bem sucedida!)*/
INSERT INTO Tb_Pagamento (Fk_id_Pedido, Valor_Pagamento, Metodo_Pagamento)
VALUES (1, 29.99, 'cartao');

/*Atualizando o status do pedido*/
UPDATE Tb_Pedido 
SET Status_Pedido = 'pago' 
WHERE Pk_Id_Pedido = 1;

UPDATE Tb_Pedido 
SET Status_Pedido = 'cancelado' 
WHERE Pk_Id_Pedido = 2;

/*Removendo os produtos do carrinho*/
DELETE FROM Tb_Carrinho 
WHERE Fk_id_Usuario = 1 AND Fk_id_Produto IN (1, 2);


/*AVALIANDO A LOJA, O PRODUTO E SEGUINDO A LOJA */
/*Avaliando a loja*/
INSERT INTO Tb_AvaliacaoLoja (Fk_id_Usuario, Fk_id_Loja, Conteudo_AvaliacaoLoja, Data_AvaliacaoLoja, Nota_AvaliacaoLoja)
VALUES (1, 1, 'Ótima loja, produtos de qualidade!', CURDATE(), 5);

/*Avaliando produtos*/
INSERT INTO Tb_AvaliacaoProduto (Fk_id_Usuario, Fk_id_Produto, Conteudo_AvaliacaoProduto, Data_AvaliacaoProduto, Nota_AvaliacaoProduto)
VALUES (1, 1, 'Produto muito bom, recomendo!', CURDATE(), 5);

INSERT INTO Tb_AvaliacaoProduto (Fk_id_Usuario, Fk_id_Produto, Conteudo_AvaliacaoProduto, Data_AvaliacaoProduto, Nota_AvaliacaoProduto)
VALUES (1, 2, 'Minha compra foi cancelada!.', CURDATE(), 2);

/*SEGUI A LOJA*/
INSERT INTO Tb_Seguidor (Fk_id_usuario, Fk_id_loja)
VALUES (1, 1);

INSERT INTO Tb_Seguidor (Fk_id_usuario, Fk_id_loja)
VALUES (2, 1);

/* EXIBINDO A QUANTIDADE DE SEGUIDORES DA LOJA E QUEM SÃO */
/*Nome dos seguidores*/
SELECT Tb_Usuario.Nome_Usuario
FROM Tb_Seguidor
JOIN Tb_Usuario ON Tb_Seguidor.Fk_id_usuario = Tb_Usuario.Pk_id_Usuario
WHERE Tb_Seguidor.Fk_id_loja = 1;

/*Quantidade seguidores*/
SELECT COUNT(*) AS Total_Seguidores
FROM Tb_Seguidor
WHERE Fk_id_loja = 1;




