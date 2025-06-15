CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(150) NOT NULL,
  category_id INT REFERENCES categories(category_id),
  price NUMERIC(10,2) NOT NULL
);

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  city VARCHAR(50),
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id),
  order_date DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  total_amount NUMERIC(12,2) NOT NULL
);

CREATE TABLE order_items (
  order_item_id SERIAL PRIMARY KEY,
  order_id INT REFERENCES orders(order_id),
  product_id INT REFERENCES products(product_id),
  quantity INT NOT NULL,
  unit_price NUMERIC(10,2) NOT NULL
);


INSERT INTO categories(category_id, category_name) VALUES (1, 'Categoria 1');
INSERT INTO categories(category_id, category_name) VALUES (2, 'Categoria 2');
INSERT INTO categories(category_id, category_name) VALUES (3, 'Categoria 3');
INSERT INTO categories(category_id, category_name) VALUES (4, 'Categoria 4');
INSERT INTO categories(category_id, category_name) VALUES (5, 'Categoria 5');
INSERT INTO categories(category_id, category_name) VALUES (6, 'Categoria 6');
INSERT INTO categories(category_id, category_name) VALUES (7, 'Categoria 7');
INSERT INTO categories(category_id, category_name) VALUES (8, 'Categoria 8');
INSERT INTO categories(category_id, category_name) VALUES (9, 'Categoria 9');
INSERT INTO categories(category_id, category_name) VALUES (10, 'Categoria 10');

INSERT INTO products(product_id, product_name, category_id, price) VALUES (1, 'Produto 1', 1, 139.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (2, 'Produto 2', 2, 80.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (3, 'Produto 3', 3, 120.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (4, 'Produto 4', 4, 149.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (5, 'Produto 5', 5, 29.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (6, 'Produto 6', 6, 50.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (7, 'Produto 7', 7, 23.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (8, 'Produto 8', 8, 27.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (9, 'Produto 9', 9, 75.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (10, 'Produto 10', 10, 200.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (11, 'Produto 11', 1, 95.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (12, 'Produto 12', 2, 167.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (13, 'Produto 13', 3, 44.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (14, 'Produto 14', 4, 89.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (15, 'Produto 15', 5, 234.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (16, 'Produto 16', 6, 12.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (17, 'Produto 17', 7, 178.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (18, 'Produto 18', 8, 67.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (19, 'Produto 19', 9, 156.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (20, 'Produto 20', 10, 38.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (21, 'Produto 21', 1, 213.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (22, 'Produto 22', 2, 92.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (23, 'Produto 23', 3, 147.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (24, 'Produto 24', 4, 56.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (25, 'Produto 25', 5, 189.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (26, 'Produto 26', 6, 73.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (27, 'Produto 27', 7, 124.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (28, 'Produto 28', 8, 205.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (29, 'Produto 29', 9, 41.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (30, 'Produto 30', 10, 98.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (31, 'Produto 31', 1, 162.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (32, 'Produto 32', 2, 31.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (33, 'Produto 33', 3, 87.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (34, 'Produto 34', 4, 219.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (35, 'Produto 35', 5, 64.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (36, 'Produto 36', 6, 136.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (37, 'Produto 37', 7, 183.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (38, 'Produto 38', 8, 49.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (39, 'Produto 39', 9, 115.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (40, 'Produto 40', 10, 76.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (41, 'Produto 41', 1, 198.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (42, 'Produto 42', 2, 53.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (43, 'Produto 43', 3, 129.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (44, 'Produto 44', 4, 245.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (45, 'Produto 45', 5, 18.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (46, 'Produto 46', 6, 171.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (47, 'Produto 47', 7, 84.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (48, 'Produto 48', 8, 207.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (49, 'Produto 49', 9, 61.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (50, 'Produto 50', 10, 142.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (51, 'Produto 51', 1, 103.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (52, 'Produto 52', 2, 226.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (53, 'Produto 53', 3, 37.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (54, 'Produto 54', 4, 158.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (55, 'Produto 55', 5, 79.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (56, 'Produto 56', 6, 194.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (57, 'Produto 57', 7, 46.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (58, 'Produto 58', 8, 121.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (59, 'Produto 59', 9, 235.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (60, 'Produto 60', 10, 68.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (61, 'Produto 61', 1, 154.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (62, 'Produto 62', 2, 24.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (63, 'Produto 63', 3, 109.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (64, 'Produto 64', 4, 187.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (65, 'Produto 65', 5, 52.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (66, 'Produto 66', 6, 173.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (67, 'Produto 67', 7, 91.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (68, 'Produto 68', 8, 218.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (69, 'Produto 69', 9, 35.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (70, 'Produto 70', 10, 126.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (71, 'Produto 71', 1, 248.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (72, 'Produto 72', 2, 63.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (73, 'Produto 73', 3, 144.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (74, 'Produto 74', 4, 82.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (75, 'Produto 75', 5, 201.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (76, 'Produto 76', 6, 47.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (77, 'Produto 77', 7, 165.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (78, 'Produto 78', 8, 114.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (79, 'Produto 79', 9, 239.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (80, 'Produto 80', 10, 56.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (81, 'Produto 81', 1, 133.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (82, 'Produto 82', 2, 189.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (83, 'Produto 83', 3, 71.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (84, 'Produto 84', 4, 152.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (85, 'Produto 85', 5, 28.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (86, 'Produto 86', 6, 195.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (87, 'Produto 87', 7, 88.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (88, 'Produto 88', 8, 217.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (89, 'Produto 89', 9, 42.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (90, 'Produto 90', 10, 169.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (91, 'Produto 91', 1, 105.1);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (92, 'Produto 92', 2, 231.4);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (93, 'Produto 93', 3, 59.7);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (94, 'Produto 94', 4, 178.6);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (95, 'Produto 95', 5, 94.3);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (96, 'Produto 96', 6, 146.9);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (97, 'Produto 97', 7, 213.5);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (98, 'Produto 98', 8, 33.2);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (99, 'Produto 99', 9, 127.8);
INSERT INTO products(product_id, product_name, category_id, price) VALUES (100, 'Produto 100', 10, 185.4);

INSERT INTO customers(customer_id, first_name, last_name, email, city, created_at) VALUES
(1, 'João', 'Silva', 'joão.silva1@exemplo.com', 'Sao Paulo', '2024-05-17'),
(2, 'Maria', 'Silva', 'maria.silva1@exemplo.com', 'Belo Horizonte', '2024-06-02'),
(3, 'Pedro', 'Santos', 'pedro.santos@exemplo.com', 'Londrina', '2024-07-20'),
(4, 'Ana', 'Costa', 'ana.costa@exemplo.com', 'Rio de Janeiro', '2024-01-15'),
(5, 'Carlos', 'Oliveira', 'carlos.oliveira@exemplo.com', 'Porto Alegre', '2024-02-28'),
(6, 'Lucia', 'Pereira', 'lucia.pereira@exemplo.com', 'Salvador', '2024-03-10'),
(7, 'Ricardo', 'Almeida', 'ricardo.almeida@exemplo.com', 'Fortaleza', '2024-04-05'),
(8, 'Fernanda', 'Lima', 'fernanda.lima@exemplo.com', 'Recife', '2024-05-22'),
(9, 'Roberto', 'Martins', 'roberto.martins@exemplo.com', 'Brasilia', '2024-06-18'),
(10, 'Juliana', 'Rocha', 'juliana.rocha@exemplo.com', 'Curitiba', '2024-07-03'),
(11, 'Antonio', 'Ferreira', 'antonio.ferreira@exemplo.com', 'Manaus', '2024-08-14'),
(12, 'Patricia', 'Gomes', 'patricia.gomes@exemplo.com', 'Goiania', '2024-09-07'),
(13, 'Marcos', 'Ribeiro', 'marcos.ribeiro@exemplo.com', 'Campinas', '2024-10-25'),
(14, 'Sandra', 'Carvalho', 'sandra.carvalho@exemplo.com', 'Santos', '2024-11-12'),
(15, 'Paulo', 'Nascimento', 'paulo.nascimento@exemplo.com', 'Natal', '2024-12-30'),
(16, 'Claudia', 'Barbosa', 'claudia.barbosa@exemplo.com', 'Campo Grande', '2024-01-08'),
(17, 'Jose', 'Teixeira', 'jose.teixeira@exemplo.com', 'Teresina', '2024-02-19'),
(18, 'Monica', 'Pinto', 'monica.pinto@exemplo.com', 'Aracaju', '2024-03-26'),
(19, 'Rodrigo', 'Dias', 'rodrigo.dias@exemplo.com', 'Maceio', '2024-04-13'),
(20, 'Cristina', 'Moreira', 'cristina.moreira@exemplo.com', 'Joao Pessoa', '2024-05-01'),
(21, 'Fernando', 'Castro', 'fernando.castro@exemplo.com', 'Florianopolis', '2024-06-16'),
(22, 'Adriana', 'Souza', 'adriana.souza@exemplo.com', 'Vitoria', '2024-07-08'),
(23, 'Guilherme', 'Mendes', 'guilherme.mendes@exemplo.com', 'Cuiaba', '2024-08-21'),
(24, 'Renata', 'Cardoso', 'renata.cardoso@exemplo.com', 'Palmas', '2024-09-15'),
(25, 'Eduardo', 'Correia', 'eduardo.correia@exemplo.com', 'Boa Vista', '2024-10-02'),
(26, 'Simone', 'Fonseca', 'simone.fonseca@exemplo.com', 'Macapa', '2024-11-27'),
(27, 'Daniel', 'Ramos', 'daniel.ramos@exemplo.com', 'Rio Branco', '2024-12-11'),
(28, 'Vanessa', 'Nunes', 'vanessa.nunes@exemplo.com', 'Porto Velho', '2024-01-24'),
(29, 'Bruno', 'Lopes', 'bruno.lopes@exemplo.com', 'Sao Luis', '2024-02-06'),
(30, 'Camila', 'Monteiro', 'camila.monteiro@exemplo.com', 'Belém', '2024-03-18'),
(31, 'Thiago', 'Vieira', 'thiago.vieira@exemplo.com', 'Sao Paulo', '2024-04-29'),
(32, 'Larissa', 'Azevedo', 'larissa.azevedo@exemplo.com', 'Belo Horizonte', '2024-05-12'),
(33, 'Vinicius', 'Cunha', 'vinicius.cunha@exemplo.com', 'Londrina', '2024-06-25'),
(34, 'Priscila', 'Torres', 'priscila.torres@exemplo.com', 'Rio de Janeiro', '2024-07-16'),
(35, 'Leonardo', 'Campos', 'leonardo.campos@exemplo.com', 'Porto Alegre', '2024-08-03'),
(36, 'Tatiana', 'Franco', 'tatiana.franco@exemplo.com', 'Salvador', '2024-09-20'),
(37, 'Andre', 'Miranda', 'andre.miranda@exemplo.com', 'Fortaleza', '2024-10-14'),
(38, 'Carla', 'Freitas', 'carla.freitas@exemplo.com', 'Recife', '2024-11-01'),
(39, 'Raphael', 'Cavalcanti', 'raphael.cavalcanti@exemplo.com', 'Brasilia', '2024-12-18'),
(40, 'Bianca', 'Melo', 'bianca.melo@exemplo.com', 'Curitiba', '2024-01-31'),
(41, 'Mateus', 'Borges', 'mateus.borges@exemplo.com', 'Manaus', '2024-02-13'),
(42, 'Isabela', 'Duarte', 'isabela.duarte@exemplo.com', 'Goiania', '2024-03-22'),
(43, 'Diego', 'Moura', 'diego.moura@exemplo.com', 'Campinas', '2024-04-08'),
(44, 'Natalia', 'Santana', 'natalia.santana@exemplo.com', 'Santos', '2024-05-25'),
(45, 'Felipe', 'Guerra', 'felipe.guerra@exemplo.com', 'Natal', '2024-06-11'),
(46, 'Raquel', 'Reis', 'raquel.reis@exemplo.com', 'Campo Grande', '2024-07-28'),
(47, 'Lucas', 'Medeiros', 'lucas.medeiros@exemplo.com', 'Teresina', '2024-08-09'),
(48, 'Sabrina', 'Cruz', 'sabrina.cruz@exemplo.com', 'Aracaju', '2024-09-26'),
(49, 'Gustavo', 'Machado', 'gustavo.machado@exemplo.com', 'Maceio', '2024-10-17'),
(50, 'Caroline', 'Araujo', 'caroline.araujo@exemplo.com', 'Joao Pessoa', '2024-11-04'),
(51, 'Marcelo', 'Baptista', 'marcelo.baptista@exemplo.com', 'Florianopolis', '2024-12-21'),
(52, 'Aline', 'Vasconcelos', 'aline.vasconcelos@exemplo.com', 'Vitoria', '2024-01-07'),
(53, 'Fabio', 'Paiva', 'fabio.paiva@exemplo.com', 'Cuiaba', '2024-02-24'),
(54, 'Daniele', 'Xavier', 'daniele.xavier@exemplo.com', 'Palmas', '2024-03-14'),
(55, 'Igor', 'Farias', 'igor.farias@exemplo.com', 'Boa Vista', '2024-04-30'),
(56, 'Gabriela', 'Batista', 'gabriela.batista@exemplo.com', 'Macapa', '2024-05-18'),
(57, 'Caio', 'Peixoto', 'caio.peixoto@exemplo.com', 'Rio Branco', '2024-06-05'),
(58, 'Luana', 'Tavares', 'luana.tavares@exemplo.com', 'Porto Velho', '2024-07-22'),
(59, 'Henrique', 'Brito', 'henrique.brito@exemplo.com', 'Sao Luis', '2024-08-13'),
(60, 'Amanda', 'Godoy', 'amanda.godoy@exemplo.com', 'Belém', '2024-09-29'),
(61, 'Leandro', 'Siqueira', 'leandro.siqueira@exemplo.com', 'Sao Paulo', '2024-10-08'),
(62, 'Viviane', 'Moraes', 'viviane.moraes@exemplo.com', 'Belo Horizonte', '2024-11-24'),
(63, 'Rafael', 'Lacerda', 'rafael.lacerda@exemplo.com', 'Londrina', '2024-12-06'),
(64, 'Elaine', 'Magalhaes', 'elaine.magalhaes@exemplo.com', 'Rio de Janeiro', '2024-01-19'),
(65, 'William', 'Passos', 'william.passos@exemplo.com', 'Porto Alegre', '2024-02-02'),
(66, 'Mariana', 'Nogueira', 'mariana.nogueira@exemplo.com', 'Salvador', '2024-03-16'),
(67, 'Victor', 'Pacheco', 'victor.pacheco@exemplo.com', 'Fortaleza', '2024-04-27'),
(68, 'Kelly', 'Brandao', 'kelly.brandao@exemplo.com', 'Recife', '2024-05-09'),
(69, 'Alex', 'Silva', 'alex.silva@exemplo.com', 'Brasilia', '2024-06-26'),
(70, 'Milena', 'Evangelista', 'milena.evangelista@exemplo.com', 'Curitiba', '2024-07-12'),
(71, 'Sergio', 'Leal', 'sergio.leal@exemplo.com', 'Manaus', '2024-08-28'),
(72, 'Leticia', 'Bastos', 'leticia.bastos@exemplo.com', 'Goiania', '2024-09-11'),
(73, 'Edson', 'Valente', 'edson.valente@exemplo.com', 'Campinas', '2024-10-23'),
(74, 'Jaqueline', 'Coelho', 'jaqueline.coelho@exemplo.com', 'Santos', '2024-11-15'),
(75, 'Alan', 'Sampaio', 'alan.sampaio@exemplo.com', 'Natal', '2024-12-28'),
(76, 'Rosana', 'Damasceno', 'rosana.damasceno@exemplo.com', 'Campo Grande', '2024-01-10'),
(77, 'Julio', 'Barreto', 'julio.barreto@exemplo.com', 'Teresina', '2024-02-21'),
(78, 'Bruna', 'Carneiro', 'bruna.carneiro@exemplo.com', 'Aracaju', '2024-03-30'),
(79, 'Otavio', 'Figueiredo', 'otavio.figueiredo@exemplo.com', 'Maceio', '2024-04-16'),
(80, 'Debora', 'Veloso', 'debora.veloso@exemplo.com', 'Joao Pessoa', '2024-05-03'),
(81, 'Cesar', 'Andrade', 'cesar.andrade@exemplo.com', 'Florianopolis', '2024-06-17'),
(82, 'Flavia', 'Espinosa', 'flavia.espinosa@exemplo.com', 'Vitoria', '2024-07-04'),
(83, 'Jean', 'Alves', 'jean.alves@exemplo.com', 'Cuiaba', '2024-08-19'),
(84, 'Silvia', 'Bueno', 'silvia.bueno@exemplo.com', 'Palmas', '2024-09-12'),
(85, 'Wesley', 'Ferraz', 'wesley.ferraz@exemplo.com', 'Boa Vista', '2024-10-28'),
(86, 'Camilla', 'Guedes', 'camilla.guedes@exemplo.com', 'Macapa', '2024-11-19'),
(87, 'Giovanni', 'Esteves', 'giovanni.esteves@exemplo.com', 'Rio Branco', '2024-12-05'),
(88, 'Ingrid', 'Leite', 'ingrid.leite@exemplo.com', 'Porto Velho', '2024-01-22'),
(89, 'Murilo', 'Caldeira', 'murilo.caldeira@exemplo.com', 'Sao Luis', '2024-02-08'),
(90, 'Nicole', 'Guimaraes', 'nicole.guimaraes@exemplo.com', 'Belém', '2024-03-25'),
(91, 'Renan', 'Silveira', 'renan.silveira@exemplo.com', 'Sao Paulo', '2024-04-11'),
(92, 'Vanilda', 'Matos', 'vanilda.matos@exemplo.com', 'Belo Horizonte', '2024-05-28'),
(93, 'Arthur', 'Seabra', 'arthur.seabra@exemplo.com', 'Londrina', '2024-06-14'),
(94, 'Eliane', 'Pessoa', 'eliane.pessoa@exemplo.com', 'Rio de Janeiro', '2024-07-31'),
(95, 'Jonatan', 'Bernardes', 'jonatan.bernardes@exemplo.com', 'Porto Alegre', '2024-08-17'),
(96, 'Solange', 'Resende', 'solange.resende@exemplo.com', 'Salvador', '2024-09-03'),
(97, 'Emerson', 'Quaresma', 'emerson.quaresma@exemplo.com', 'Fortaleza', '2024-10-20'),
(98, 'Angelica', 'Lobato', 'angelica.lobato@exemplo.com', 'Recife', '2024-11-06'),
(99, 'Everton', 'Neves', 'everton.neves@exemplo.com', 'Brasilia', '2024-12-23'),
(100, 'Soraia', 'Falcao', 'soraia.falcao@exemplo.com', 'Curitiba', '2024-01-14'),
(101, 'Gabriel', 'Dantas', 'gabriel.dantas@exemplo.com', 'Manaus', '2024-02-27'),
(102, 'Roseli', 'Vargas', 'roseli.vargas@exemplo.com', 'Goiania', '2024-03-12'),
(103, 'Kleber', 'Furtado', 'kleber.furtado@exemplo.com', 'Campinas', '2024-04-28'),
(104, 'Regina', 'Gonzaga', 'regina.gonzaga@exemplo.com', 'Santos', '2024-05-15'),
(105, 'Davi', 'Maia', 'davi.maia@exemplo.com', 'Natal', '2024-06-01'),
(106, 'Celia', 'Mattos', 'celia.mattos@exemplo.com', 'Campo Grande', '2024-07-18'),
(107, 'Wanderson', 'Chaves', 'wanderson.chaves@exemplo.com', 'Teresina', '2024-08-04'),
(108, 'Valdirene', 'Cabral', 'valdirene.cabral@exemplo.com', 'Aracaju', '2024-09-21'),
(109, 'Ronaldo', 'Bittencourt', 'ronaldo.bittencourt@exemplo.com', 'Maceio', '2024-10-07'),
(110, 'Miriam', 'Borba', 'miriam.borba@exemplo.com', 'Joao Pessoa', '2024-11-23'),
(111, 'Edimilson', 'Gaspar', 'edimilson.gaspar@exemplo.com', 'Florianopolis', '2024-12-10'),
(112, 'Cleide', 'Dorneles', 'cleide.dorneles@exemplo.com', 'Vitoria', '2024-01-26'),
(113, 'Geraldo', 'Fernandes', 'geraldo.fernandes@exemplo.com', 'Cuiaba', '2024-02-12'),
(114, 'Neusa', 'Henriques', 'neusa.henriques@exemplo.com', 'Palmas', '2024-03-29'),
(115, 'Valmir', 'Prado', 'valmir.prado@exemplo.com', 'Boa Vista', '2024-04-15'),
(116, 'Marlene', 'Bandeira', 'marlene.bandeira@exemplo.com', 'Macapa', '2024-05-02'),
(117, 'Cleber', 'Lemos', 'cleber.lemos@exemplo.com', 'Rio Branco', '2024-06-19'),
(118, 'Vania', 'Galvao', 'vania.galvao@exemplo.com', 'Porto Velho', '2024-07-06'),
(119, 'Ademir', 'Pires', 'ademir.pires@exemplo.com', 'Sao Luis', '2024-08-22'),
(120, 'Dulce', 'Godinho', 'dulce.godinho@exemplo.com', 'Belém', '2024-09-08'),
(121, 'Mauro', 'Caetano', 'mauro.caetano@exemplo.com', 'Sao Paulo', '2024-10-25'),
(122, 'Ivone', 'Sales', 'ivone.sales@exemplo.com', 'Belo Horizonte', '2024-11-11'),
(123, 'Nilton', 'Cerqueira', 'nilton.cerqueira@exemplo.com', 'Londrina', '2024-12-28'),
(124, 'Luciene', 'Fialho', 'luciene.fialho@exemplo.com', 'Rio de Janeiro', '2024-01-09'),
(125, 'Ailton', 'Portela', 'ailton.portela@exemplo.com', 'Porto Alegre', '2024-02-25'),
(126, 'Terezinha', 'Ferreira', 'terezinha.ferreira@exemplo.com', 'Salvador', '2024-03-13'),
(127, 'Raimundo', 'Linhares', 'raimundo.linhares@exemplo.com', 'Fortaleza', '2024-04-29'),
(128, 'Valeria', 'Serafim', 'valeria.serafim@exemplo.com', 'Recife', '2024-05-16'),
(129, 'Luiz', 'Macedo', 'luiz.macedo@exemplo.com', 'Brasilia', '2024-06-02'),
(130, 'Aparecida', 'Couto', 'aparecida.couto@exemplo.com', 'Curitiba', '2024-07-19'),
(131, 'Francisco', 'Bezerra', 'francisco.bezerra@exemplo.com', 'Manaus', '2024-08-05'),
(132, 'Fatima', 'Santana', 'fatima.santana@exemplo.com', 'Goiania', '2024-09-22'),
(133, 'Nelson', 'Drumond', 'nelson.drumond@exemplo.com', 'Campinas', '2024-10-08'),
(134, 'Sueli', 'Amaral', 'sueli.amaral@exemplo.com', 'Santos', '2024-11-24'),
(135, 'Miguel', 'Velasco', 'miguel.velasco@exemplo.com', 'Natal', '2024-12-11'),
(136, 'Marli', 'Parente', 'marli.parente@exemplo.com', 'Campo Grande', '2024-01-27'),
(137, 'Sebastiao', 'Valle', 'sebastiao.valle@exemplo.com', 'Teresina', '2024-02-13'),
(138, 'Zilda', 'Viana', 'zilda.viana@exemplo.com', 'Aracaju', '2024-03-31'),
(139, 'Domingos', 'Braganca', 'domingos.braganca@exemplo.com', 'Maceio', '2024-04-17'),
(140, 'Conceicao', 'Toledo', 'conceicao.toledo@exemplo.com', 'Joao Pessoa', '2024-05-04'),
(141, 'Joao', 'Dutra', 'joao.dutra@exemplo.com', 'Florianopolis', '2024-06-20'),
(142, 'Iracema', 'Rocha', 'iracema.rocha@exemplo.com', 'Vitoria', '2024-07-07'),
(143, 'Gilberto', 'Carvalho', 'gilberto.carvalho@exemplo.com', 'Cuiaba', '2024-08-23'),
(144, 'Lourdes', 'Barcelos', 'lourdes.barcelos@exemplo.com', 'Palmas', '2024-09-09'),
(145, 'Cicero', 'Rangel', 'cicero.rangel@exemplo.com', 'Boa Vista', '2024-10-26'),
(146, 'Odete', 'Assis', 'odete.assis@exemplo.com', 'Macapa', '2024-11-12'),
(147, 'Manoel', 'Saldanha', 'manoel.saldanha@exemplo.com', 'Rio Branco', '2024-12-29'),
(148, 'Antonia', 'Araujo', 'antonia.araujo@exemplo.com', 'Porto Velho', '2024-01-15'),
(149, 'Benedito', 'Cordeiro', 'benedito.cordeiro@exemplo.com', 'Sao Luis', '2024-02-01'),
(150, 'Maria', 'Oliveira', 'maria.oliveira2@exemplo.com', 'Belém', '2024-03-20'),
(151, 'Joaquim', 'Mendes', 'joaquim.mendes@exemplo.com', 'Sao Paulo', '2024-04-06'),
(152, 'Rosa', 'Lima', 'rosa.lima@exemplo.com', 'Belo Horizonte', '2024-05-23'),
(153, 'Osvaldo', 'Santos', 'osvaldo.santos@exemplo.com', 'Londrina', '2024-06-09'),
(154, 'Benedita', 'Costa', 'benedita.costa@exemplo.com', 'Rio de Janeiro', '2024-07-26'),
(155, 'Raimundo', 'Silva', 'raimundo.silva@exemplo.com', 'Porto Alegre', '2024-08-12'),
(156, 'Georgina', 'Pereira', 'georgina.pereira@exemplo.com', 'Salvador', '2024-09-28'),
(157, 'Expedito', 'Almeida', 'expedito.almeida@exemplo.com', 'Fortaleza', '2024-10-15'),
(158, 'Joana', 'Martins', 'joana.martins@exemplo.com', 'Recife', '2024-11-01'),
(159, 'Getúlio', 'Ferreira', 'getulio.ferreira@exemplo.com', 'Brasilia', '2024-12-18'),
(160, 'Alzira', 'Gomes', 'alzira.gomes@exemplo.com', 'Curitiba', '2024-01-04'),
(161, 'Djalma', 'Ribeiro', 'djalma.ribeiro@exemplo.com', 'Manaus', '2024-02-20'),
(162, 'Herminia', 'Carvalho', 'herminia.carvalho@exemplo.com', 'Goiania', '2024-03-08'),
(163, 'Eurico', 'Nascimento', 'eurico.nascimento@exemplo.com', 'Campinas', '2024-04-24'),
(164, 'Nadir', 'Barbosa', 'nadir.barbosa@exemplo.com', 'Santos', '2024-05-11'),
(165, 'Waldemar', 'Teixeira', 'waldemar.teixeira@exemplo.com', 'Natal', '2024-06-27'),
(166, 'Josefa', 'Pinto', 'josefa.pinto@exemplo.com', 'Campo Grande', '2024-07-14'),
(167, 'Humberto', 'Dias', 'humberto.dias@exemplo.com', 'Teresina', '2024-08-30'),
(168, 'Edna', 'Moreira', 'edna.moreira@exemplo.com', 'Aracaju', '2024-09-16'),
(169, 'Arlindo', 'Castro', 'arlindo.castro@exemplo.com', 'Maceio', '2024-10-03'),
(170, 'Dirce', 'Souza', 'dirce.souza@exemplo.com', 'Joao Pessoa', '2024-11-19'),
(171, 'Agnaldo', 'Mendes', 'agnaldo.mendes@exemplo.com', 'Florianopolis', '2024-12-06'),
(172, 'Yolanda', 'Cardoso', 'yolanda.cardoso@exemplo.com', 'Vitoria', '2024-01-23'),
(173, 'Laercio', 'Correia', 'laercio.correia@exemplo.com', 'Cuiaba', '2024-02-09'),
(174, 'Nair', 'Fonseca', 'nair.fonseca@exemplo.com', 'Palmas', '2024-03-28'),
(175, 'Alvaro', 'Ramos', 'alvaro.ramos@exemplo.com', 'Boa Vista', '2024-04-14'),
(176, 'Eunice', 'Nunes', 'eunice.nunes@exemplo.com', 'Macapa', '2024-05-31'),
(177, 'Adalberto', 'Lopes', 'adalberto.lopes@exemplo.com', 'Rio Branco', '2024-06-17'),
(178, 'Nilza', 'Monteiro', 'nilza.monteiro@exemplo.com', 'Porto Velho', '2024-07-04'),
(179, 'Rubens', 'Vieira', 'rubens.vieira@exemplo.com', 'Sao Luis', '2024-08-20'),
(180, 'Zenaide', 'Azevedo', 'zenaide.azevedo@exemplo.com', 'Belém', '2024-09-06'),
(181, 'Almir', 'Cunha', 'almir.cunha@exemplo.com', 'Sao Paulo', '2024-10-23'),
(182, 'Wilma', 'Torres', 'wilma.torres@exemplo.com', 'Belo Horizonte', '2024-11-09'),
(183, 'Ivair', 'Campos', 'ivair.campos@exemplo.com', 'Londrina', '2024-12-26'),
(184, 'Elza', 'Franco', 'elza.franco@exemplo.com', 'Rio de Janeiro', '2024-01-12'),
(185, 'Alcides', 'Miranda', 'alcides.miranda@exemplo.com', 'Porto Alegre', '2024-02-28'),
(186, 'Neide', 'Freitas', 'neide.freitas@exemplo.com', 'Salvador', '2024-03-17'),
(187, 'Sinval', 'Cavalcanti', 'sinval.cavalcanti@exemplo.com', 'Fortaleza', '2024-04-03'),
(188, 'Cida', 'Melo', 'cida.melo@exemplo.com', 'Recife', '2024-05-20'),
(189, 'Armando', 'Borges', 'armando.borges@exemplo.com', 'Brasilia', '2024-06-06'),
(190, 'Diva', 'Duarte', 'diva.duarte@exemplo.com', 'Curitiba', '2024-07-23'),
(191, 'Lourival', 'Moura', 'lourival.moura@exemplo.com', 'Manaus', '2024-08-09'),
(192, 'Dilma', 'Santana', 'dilma.santana@exemplo.com', 'Goiania', '2024-09-25'),
(193, 'Almiro', 'Guerra', 'almiro.guerra@exemplo.com', 'Campinas', '2024-10-12'),
(194, 'Vera', 'Reis', 'vera.reis@exemplo.com', 'Santos', '2024-11-28'),
(195, 'Gerson', 'Medeiros', 'gerson.medeiros@exemplo.com', 'Natal', '2024-12-15'),
(196, 'Dalva', 'Cruz', 'dalva.cruz@exemplo.com', 'Campo Grande', '2024-01-01'),
(197, 'Orlando', 'Machado', 'orlando.machado@exemplo.com', 'Teresina', '2024-02-17'),
(198, 'Glaucia', 'Araujo', 'glaucia.araujo@exemplo.com', 'Aracaju', '2024-03-06'),
(199, 'Valdemir', 'Baptista', 'valdemir.baptista@exemplo.com', 'Maceio', '2024-04-22'),
(200, 'Ivete', 'Vasconcelos', 'ivete.vasconcelos@exemplo.com', 'Joao Pessoa', '2024-05-09');


INSERT INTO orders(order_id, customer_id, order_date, status, total_amount) VALUES
(1, 42, '2024-05-11', 'SHIPPED', 818.76),
(2, 159, '2024-02-05', 'PENDING', 217.47),
(3, 78, '2024-07-29', 'DELIVERED',357.60),
(4, 200, '2024-01-16', 'CANCELLED',48.22),
(5, 16, '2024-10-07', 'DELIVERED',623.19),
(496, 54, '2024-03-21', 'SHIPPED', 442.55),
(497, 91, '2024-08-17', 'DELIVERED',912.30),
(498, 37, '2024-11-24', 'PENDING', 135.44),
(499, 172, '2024-06-09', 'SHIPPED', 507.89),
(500, 8, '2024-09-02', 'DELIVERED',718.64);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 11, 2, 89.23),
(2, 1, 57, 1, 33.45),
(3, 1, 3, 3, 105.34),
(4, 1, 79, 1, 127.09),
(5, 1, 42, 2, 256.65);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(6, 2, 24, 1, 152.33),
(7, 2, 15,5,13.42);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(8, 3, 88, 2, 75.20),
(9, 3, 49, 1, 113.10),
(10, 3, 6, 3, 56.80);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(11, 4, 92, 1, 48.22);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(12, 5, 5, 2, 60.10),
(13, 5, 70, 1, 175.00),
(14, 5, 29, 1, 108.23),
(15, 5, 63, 1, 279.86);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(2471, 496, 10, 4, 22.25),
(2472, 496, 35, 1, 76.80),
(2473, 496, 61, 2, 171.50);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(2474, 497, 2, 2, 389.99),
(2475, 497, 12, 1, 132.31),
(2476, 497, 31, 3, 133.33);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(2477, 498, 45, 1, 74.25),
(2478, 498, 78, 2, 30.59);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(2479, 499, 88, 1, 135.44),
(2480, 499, 9, 2, 186.22),
(2481, 499, 67, 1, 186.23);

INSERT INTO order_items(order_item_id, order_id, product_id, quantity, unit_price) VALUES
(2482, 500, 14, 2, 114.13),
(2483, 500, 21, 1, 196.38),
(2484, 500, 47, 3, 136.04);
