# 📦Banco de Dados Modelly

## 📖 Visão Geral

O banco de dados `bd_Modelly` foi projetado para gerenciar as operações de uma plataforma de comércio eletrônico. Este banco de dados cobre funcionalidades essenciais como o registro de usuários, listagem de produtos, gerenciamento de carrinho de compras, processamento de pedidos, pagamentos, avaliações de lojas e produtos, e acompanhamento de seguidores.

## 🛠️ Tecnologias Utilizadas

- **MySQL**: Utilizado como Sistema de Gerenciamento de Banco de Dados Relacional (RDBMS).
- **SQL**: Linguagem utilizada para definir e manipular os dados no banco de dados.

## 🗂️ Estrutura do Banco de Dados

### 🧑‍🤝‍🧑 Tb_Usuario
Tabela que gerencia as informações dos usuários.

- **Colunas Principais**:
  - `Pk_id_Usuario`: Chave primária, auto-incrementada.
  - `Nome_Usuario`: Nome do usuário.
  - `CPF_Usuario`: CPF do usuário, único.
  - `Genero_Usuario`: Gênero do usuário.
  - `Data_Nasc_Usuario`: Data de nascimento do usuário.
  - `Email_Usuario`: Email do usuário.

### 🏪 Tb_Loja
Tabela que gerencia as informações das lojas.

- **Colunas Principais**:
  - `Pk_Id_Loja`: Chave primária, auto-incrementada.
  - `Fk_Id_Usuario`: Referência ao usuário.
  - `Nome_Loja`: Nome da loja.
  - `Descricao_Loja`: Descrição da loja.
  - `Plano_Loja`: Plano da loja.

### 🛍️ Tb_Produto
Tabela que gerencia as informações dos produtos.

- **Colunas Principais**:
  - `Pk_Id_Produto`: Chave primária, auto-incrementada.
  - `Fk_id_Loja`: Referência à loja.
  - `Nome_Produto`: Nome do produto.
  - `Preco_Produto`: Preço do produto.
  - `Categoria_Produto`: Categoria do produto.
  - `Qtd_Produto`: Quantidade disponível.

### 🛒 Tb_Carrinho
Tabela que gerencia os itens no carrinho de compras.

- **Colunas Principais**:
  - `Pk_id_Carrinho`: Chave primária, auto-incrementada.
  - `Fk_id_Usuario`: Referência ao usuário.
  - `Fk_id_Produto`: Referência ao produto.

### 📦 Tb_Pedido
Tabela que gerencia as informações dos pedidos.

- **Colunas Principais**:
  - `Pk_Id_Pedido`: Chave primária, auto-incrementada.
  - `Fk_Id_Produto`: Referência ao produto.
  - `Fk_id_Usuario`: Referência ao usuário.
  - `Valor_Frete`: Valor do frete.
  - `Data_pedido`: Data do pedido.
  - `Status_Pedido`: Status do pedido.

### 💳 Tb_Pagamento
Tabela que gerencia as informações dos pagamentos.

- **Colunas Principais**:
  - `Pk_Id_Pagamento`: Chave primária, auto-incrementada.
  - `Fk_id_Pedido`: Referência ao pedido.
  - `Valor_Pagamento`: Valor do pagamento.
  - `Metodo_Pagamento`: Método de pagamento.

### ⭐ Tb_AvaliacaoLoja
Tabela que gerencia as avaliações das lojas.

- **Colunas Principais**:
  - `Pk_id_AvaliacaoLoja`: Chave primária, auto-incrementada.
  - `Fk_id_Usuario`: Referência ao usuário.
  - `Fk_id_Loja`: Referência à loja.
  - `Conteudo_AvaliacaoLoja`: Conteúdo da avaliação.
  - `Nota_AvaliacaoLoja`: Nota da avaliação.

### ⭐ Tb_AvaliacaoProduto
Tabela que gerencia as avaliações dos produtos.

- **Colunas Principais**:
  - `Pk_id_AvaliacaoProduto`: Chave primária, auto-incrementada.
  - `Fk_id_Usuario`: Referência ao usuário.
  - `Fk_id_Produto`: Referência ao produto.
  - `Conteudo_AvaliacaoProduto`: Conteúdo da avaliação.
  - `Nota_AvaliacaoProduto`: Nota da avaliação.

### 👥 Tb_Seguidor
Tabela que gerencia os seguidores das lojas.

- **Colunas Principais**:
  - `Pk_id_Seguidor`: Chave primária, auto-incrementada.
  - `Fk_id_usuario`: Referência ao usuário.
  - `Fk_id_loja`: Referência à loja.

## 🚀 Configuração e Testes

### Como Configurar

1. **Crie o banco de dados**:
    ```sql
    CREATE DATABASE bd_Modelly;
    USE bd_Modelly;
    ```

2. **Crie as tabelas**:
    Execute as instruções SQL fornecidas no script para criar todas as tabelas mencionadas acima.

### Como Testar

1. **Cadastro de Usuários**:
    ```sql
    INSERT INTO Tb_Usuario (Nome_Usuario, CPF_Usuario, Genero_Usuario, Data_Nasc_Usuario, Data_Registro_Usuario, Plano_Usuario, Permissao_Usuario, Email_Usuario, Endereco_Usuario)
    VALUES ('João Silva', '123.456.789-00', 'masculino', '1990-01-01', CURDATE(), 'entusiasta', 'consumidor', 'joao@example.com', 'Rua A, 123');

    INSERT INTO Tb_Usuario (Nome_Usuario, CPF_Usuario, Genero_Usuario, Data_Nasc_Usuario, Data_Registro_Usuario, Plano_Usuario, Permissao_Usuario, Email_Usuario, Endereco_Usuario)
    VALUES ('Maria Oliveira', '987.654.321-00', 'feminino', '1985-05-05', CURDATE(), 'colecionador', 'artesao', 'maria@example.com', 'Rua B, 456');
    ```

2. **Cadastro de Loja e Produtos**:
    ```sql
    INSERT INTO Tb_Loja (Fk_Id_Usuario, Nome_Loja, Descricao_Loja, Plano_Loja, Telefone_Loja, Email_Loja, CNPJ, Qtd_Colecao, Qtd_Produtos)
    VALUES (2, 'Loja da Maria', 'Loja de artesanato', 'escultura', 12345678, 'lojadamaria@example.com', '00.000.000/0001-00', 5, 50);

    INSERT INTO Tb_Produto (Fk_id_Loja, Nome_Produto, Preco_Produto, Descricao_Produto, Categoria_Produto, Qtd_Produto, Pronta_Entrega, Tempo_producao, Status_Produto)
    VALUES (1, 'Produto 1', 29.99, 'Descrição do produto 1', 'decoracao', 10, TRUE, 3, 'disponivel');

    INSERT INTO Tb_Produto (Fk_id_Loja, Nome_Produto, Preco_Produto, Descricao_Produto, Categoria_Produto, Qtd_Produto, Pronta_Entrega, Tempo_producao, Status_Produto)
    VALUES (1, 'Produto 2', 49.99, 'Descrição do produto 2', 'moda', 5, FALSE, 7, 'producao');
    ```

3. **Jornada de Compra**:
    ```sql
    INSERT INTO Tb_Carrinho (Fk_id_Usuario, Fk_id_Produto)
    VALUES (1, 1);

    INSERT INTO Tb_Carrinho (Fk_id_Usuario, Fk_id_Produto)
    VALUES (1, 2);

    INSERT INTO Tb_Pedido (Fk_Id_Produto, Fk_id_Usuario, Valor_Frete, Data_pedido, Status_Pedido, Transportadora, Codigo_Pedido, Codigo_Rastreio, Qtd_Produtos, Previsao_Entrega)
    VALUES (1, 1, 10.00, CURDATE(), 'pendente', 'Transportadora A', 1001, 123456789, 2, '2024-06-15');

    INSERT INTO Tb_Pedido (Fk_Id_Produto, Fk_id_Usuario, Valor_Frete, Data_pedido, Status_Pedido, Transportadora, Codigo_Pedido, Codigo_Rastreio, Qtd_Produtos, Previsao_Entrega)
    VALUES (2, 1, 15.00, CURDATE(), 'pendente', 'Transportadora B', 1002, 987654321, 1, '2024-06-20');

    INSERT INTO Tb_Pagamento (Fk_id_Pedido, Valor_Pagamento, Metodo_Pagamento)
    VALUES (1, 29.99, 'cartao');

    UPDATE Tb_Pedido 
    SET Status_Pedido = 'pago' 
    WHERE Pk_Id_Pedido = 1;

    UPDATE Tb_Pedido 
    SET Status_Pedido = 'cancelado' 
    WHERE Pk_Id_Pedido = 2;

    DELETE FROM Tb_Carrinho 
    WHERE Fk_id_Usuario = 1 AND Fk_id_Produto IN (1, 2);
    ```

4. **Avaliações e Seguidores**:
    ```sql
    INSERT INTO Tb_AvaliacaoLoja (Fk_id_Usuario, Fk_id_Loja, Conteudo_AvaliacaoLoja, Data_AvaliacaoLoja, Nota_AvaliacaoLoja)
    VALUES (1, 1, 'Ótima loja, produtos de qualidade!', CUR 
    DATE(), 5);

    INSERT INTO Tb_AvaliacaoProduto (Fk_id_Usuario, Fk_id_Produto, Conteudo_AvaliacaoProduto, Data_AvaliacaoProduto, Nota_AvaliacaoProduto)
    VALUES (1, 1, 'Produto muito bom, recomendo!', CURDATE(), 5);

    INSERT INTO Tb_AvaliacaoProduto (Fk_id_Usuario, Fk_id_Produto, Conteudo_AvaliacaoProduto, Data_AvaliacaoProduto, Nota_AvaliacaoProduto)
    VALUES (1, 2, 'Minha compra foi cancelada!', CURDATE(), 2);

    INSERT INTO Tb_Seguidor (Fk_id_usuario, Fk_id_loja)
    VALUES (1, 1);

    INSERT INTO Tb_Seguidor (Fk_id_usuario, Fk_id_loja)
    VALUES (2, 1);
    ```

5. **Consultas**:
    ```sql
    SELECT Tb_Usuario.Nome_Usuario
    FROM Tb_Seguidor
    JOIN Tb_Usuario ON Tb_Seguidor.Fk_id_usuario = Tb_Usuario.Pk_id_Usuario
    WHERE Tb_Seguidor.Fk_id_loja = 1;

    SELECT COUNT(*) AS Total_Seguidores
    FROM Tb_Seguidor
    WHERE Fk_id_loja = 1;
    ```

## 📋 Licença

Este projeto está licenciado sob os termos da licença MIT. Para mais detalhes, consulte o arquivo LICENSE.

## 📧 Contato
Para nos contatar, acesse: https://linktr.ee/modelly_art

---

Desfrute do uso do banco de dados `bd_Modelly`! 🚀
