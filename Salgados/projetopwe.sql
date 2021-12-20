-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Dez-2021 às 02:04
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetopwe`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinhos`
--

CREATE TABLE `carrinhos` (
  `Id` int(11) NOT NULL,
  `Quantidade` int(11) DEFAULT NULL,
  `ValorTotal` decimal(8,2) DEFAULT NULL,
  `FKprodutos` int(11) DEFAULT NULL,
  `FkVendas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Telefone` varchar(9) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `Id` int(11) NOT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Valor` decimal(8,2) DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`Id`, `Foto`, `Nome`, `Valor`, `Tipo`) VALUES
(1, 'https://i.imgur.com/LugqYUq.jpg', 'Coca Cola', '7.95', 'Bebidas'),
(2, 'https://i.imgur.com/7rjovw8.jpg', 'Coxinha de Catupiry', '1.99', 'Salgados'),
(3, 'https://i.imgur.com/iu1X4nZ.jpg', 'Bolo de Chocolate', '9.99', 'Doces'),
(4, 'https://i.imgur.com/SXPF3UY.jpg', 'Pastel de Queijo', '10.99', 'Salgados'),
(121, 'https://i.imgur.com/IlUeidR.png', 'Churros', '5.50', 'Doces'),
(122, 'https://i.imgur.com/kau73li.jpg', 'Cheesecake', '12.00', 'Doces'),
(123, 'https://i.imgur.com/E3I4nai.jpg', 'Brigadeiro', '3.00', 'Doces'),
(124, 'https://i.imgur.com/WbOPZ4j.jpg', 'Fanta Guaraná', '4.50', 'Bebidas'),
(125, 'https://i.imgur.com/vervmkV.jpg', 'Virado à Paulista', '25.00', 'Pratos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `Nome` varchar(30) DEFAULT NULL,
  `Senha` varchar(500) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Nivel_Acesso` varchar(30) DEFAULT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`Nome`, `Senha`, `Email`, `Nivel_Acesso`, `Id`) VALUES
('novo usarui', '827ccb0eea8a706c4c34a16891f84e7b', 'novouser@gmail.com', '2', 46),
('Ciro Esteves', '827ccb0eea8a706c4c34a16891f84e7b', 'ciro.esteves@hotmail.com', '5', 47),
('Jackson Tavares', '827ccb0eea8a706c4c34a16891f84e7b', 'jackson@gmail.com', '5', 48),
('Professor', '827ccb0eea8a706c4c34a16891f84e7b', 'professor@gmail.com', '5', 49);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `Id` int(11) NOT NULL,
  `ValorTotal` decimal(8,2) DEFAULT NULL,
  `Metodo_Pagamento` varchar(20) DEFAULT NULL,
  `Data` date DEFAULT curtime(),
  `FKClientes` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinhos`
--
ALTER TABLE `carrinhos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FkVendas` (`FkVendas`),
  ADD KEY `FKprodutos` (`FKprodutos`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FKClientes` (`FKClientes`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinhos`
--
ALTER TABLE `carrinhos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carrinhos`
--
ALTER TABLE `carrinhos`
  ADD CONSTRAINT `carrinhos_ibfk_1` FOREIGN KEY (`FkVendas`) REFERENCES `vendas` (`Id`),
  ADD CONSTRAINT `carrinhos_ibfk_2` FOREIGN KEY (`FKprodutos`) REFERENCES `produtos` (`Id`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`FKClientes`) REFERENCES `clientes` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
