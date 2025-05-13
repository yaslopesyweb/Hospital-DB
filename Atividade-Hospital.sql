CREATE TABLE `medico` (
  `id_medico` int PRIMARY KEY,
  `nome` varchar(100),
  `telefone` varchar(20),
  `email` varchar(100),
  `tipo` enum(generalista,especialista,residente)
);

CREATE TABLE `especialidade` (
  `id_especialidade` int PRIMARY KEY,
  `nome_especialidade` varchar(100)
);

CREATE TABLE `medico_especialidade` (
  `medico_id` int,
  `especialidade_id` int,
  `Primary` Key(medico_id,especialidade_id)
);

CREATE TABLE `endereco` (
  `id_endereco` int PRIMARY KEY,
  `rua` varchar(250),
  `numero` varchar(10),
  `complemento` varchar(30),
  `bairro` varchar(180),
  `cidade` varchar(180),
  `estado` char(2),
  `cep` varchar(9)
);

CREATE TABLE `paciente` (
  `id_paciente` int PRIMARY KEY,
  `nome` varchar(100),
  `data_nascimento` date,
  `id_endereco` int,
  `telefone` varchar(20),
  `email` varchar(100),
  `cpf` varchar(14),
  `rg` varchar(20),
  `id_convenio` int
);

CREATE TABLE `convenio` (
  `id_convenio` int PRIMARY KEY,
  `nome` varchar(100),
  `cnpj` varchar(18),
  `carencia` varchar(20)
);

CREATE TABLE `consulta` (
  `id_consulta` int(30) PRIMARY KEY,
  `id_paciente` int,
  `id_medico` int,
  `data_consulta` datetime,
  `valor` decimal(10,2),
  `id_especialidade` int,
  `numero_carteira` varchar(30)
);

CREATE TABLE `receita` (
  `id_receita` int PRIMARY KEY,
  `id_consulta` int
);

CREATE TABLE `medicamento_receitado` (
  `id_medicamento` int PRIMARY KEY,
  `nome_medicamento` varchar(100),
  `id_receita` int,
  `quantidade` varchar(20),
  `instrucoes` varchar(255)
);

ALTER TABLE `medico_especialidade` ADD FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `medico_especialidade` ADD FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`id_convenio`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `receita` ADD FOREIGN KEY (`id_consulta`) REFERENCES `consulta` (`id_consulta`);

ALTER TABLE `medicamento_receitado` ADD FOREIGN KEY (`id_receita`) REFERENCES `receita` (`id_receita`);
