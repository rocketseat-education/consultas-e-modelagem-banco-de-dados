CREATE TABLE departments (
    department_id INT NOT NULL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE positions (
    position_id INT NOT NULL PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    position_id INT NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (position_id) REFERENCES positions(position_id)
);

CREATE TABLE salaries (
    salary_id INT NOT NULL PRIMARY KEY,
    employee_id INT NOT NULL,
    salary_amount DECIMAL(12,2) NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informacao'),
(3, 'Vendas'),
(4, 'Marketing'),
(5, 'Financeiro'),
(6, 'Operacoes');

INSERT INTO positions (position_id, position_name) VALUES
(1, 'Analista Junior'),
(2, 'Analista Pleno'),
(3, 'Analista Senior'),
(4, 'Coordenador'),
(5, 'Gerente'),
(6, 'Diretor'),
(7, 'Estagiario'),
(8, 'Assistente');

INSERT INTO employees (employee_id, first_name, last_name, department_id, position_id, hire_date) VALUES
(1, 'Joao', 'Silva', 2, 3, '2020-01-15'),
(2, 'Maria', 'Santos', 1, 4, '2019-03-22'),
(3, 'Pedro', 'Oliveira', 3, 2, '2021-06-10'),
(4, 'Ana', 'Costa', 4, 2, '2020-11-05'),
(5, 'Carlos', 'Ferreira', 5, 5, '2018-07-20'),
(6, 'Juliana', 'Rodrigues', 2, 1, '2022-02-14'),
(7, 'Lucas', 'Almeida', 3, 3, '2019-09-30'),
(8, 'Beatriz', 'Lima', 1, 8, '2023-01-10'),
(9, 'Rafael', 'Pereira', 6, 4, '2020-05-18'),
(10, 'Fernanda', 'Souza', 4, 5, '2017-12-01'),
(11, 'Gabriel', 'Martins', 2, 7, '2023-08-15'),
(12, 'Patricia', 'Barbosa', 5, 3, '2021-03-25');

INSERT INTO salaries (salary_id, employee_id, salary_amount, effective_from, effective_to) VALUES
(1, 1, 7500.00, '2020-01-15', NULL),
(2, 1, 8500.00, '2021-01-15', NULL),
(3, 1, 9500.00, '2022-01-15', NULL),
(4, 2, 6000.00, '2019-03-22', NULL),
(5, 2, 7000.00, '2020-03-22', NULL),
(6, 2, 8000.00, '2021-03-22', NULL),
(7, 3, 4500.00, '2021-06-10', NULL),
(8, 3, 5200.00, '2022-06-10', NULL),
(9, 4, 4800.00, '2020-11-05', NULL),
(10, 4, 5500.00, '2021-11-05', NULL),
(11, 5, 12000.00, '2018-07-20', NULL),
(12, 5, 14000.00, '2020-07-20', NULL),
(13, 5, 16000.00, '2022-07-20', NULL),
(14, 6, 3500.00, '2022-02-14', NULL),
(15, 6, 4000.00, '2023-02-14', NULL),
(16, 7, 7000.00, '2019-09-30', NULL),
(17, 7, 8200.00, '2021-09-30', NULL),
(18, 8, 2800.00, '2023-01-10', NULL),
(19, 9, 6500.00, '2020-05-18', NULL),
(20, 9, 7500.00, '2022-05-18', NULL),
(21, 10, 11000.00, '2017-12-01', NULL),
(22, 10, 13000.00, '2019-12-01', NULL),
(23, 10, 15000.00, '2021-12-01', NULL),
(24, 11, 1800.00, '2023-08-15', NULL),
(25, 12, 7200.00, '2021-03-25', NULL),
(26, 12, 8000.00, '2022-03-25', NULL);