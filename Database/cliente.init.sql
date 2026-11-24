CREATE TABLE cliente (
    id_cliente INTEGER GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone VARCHAR(15),
    data_nascimento DATE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
	
	 -- CONSTRAINT permite criar uma restrição e atribuir um nome a ela.
    -- Esse nome facilita a identificação da regra e de possíveis erros.

    -- PRIMARY KEY (Chave Primária)
    -- Define id_cliente como identificador único de cada registro.
    -- Não permite valores duplicados nem valores NULL.
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),

    -- UNIQUE (Valor Único)
    -- Impede que dois clientes sejam cadastrados com o mesmo CPF.
    -- Cada CPF deverá aparecer apenas uma vez na tabela.
    CONSTRAINT uq_cliente_cpf UNIQUE (cpf),

    -- UNIQUE (Valor Único)
    -- Impede o cadastro de clientes com o mesmo endereço de e-mail.
    CONSTRAINT uq_cliente_email UNIQUE (email)
); 	


INSERT INTO cliente (nome, cpf, email, telefone, ativo)
VALUES
('Lucas Almeida', '00311244500', 'lucas@email.com', '22/01/2009', '(16) 99999-1111', TRUE),
('Mariana Costa', '00211444500', 'mariana@email.com', '(16) 99999-2222', TRUE),
('Pedro Henrique', '11122233300', 'pedro@email.com', '(16) 99999-3333', TRUE),
('Ana Clara', '00022233311', 'ana@email.com', '(16) 99999-4444', TRUE),
('Gabriel Souza', '44761188871', 'gabriel@email.com', '(16) 99999-5555', FALSE);

SELECT * FROM cliente;