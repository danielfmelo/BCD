CREATE TABLE `central` (
  `codigo` tinyint(3) unsigned NOT NULL,
  `operadora` tinyint(3) unsigned NOT NULL,
  `regiao` varchar(10) DEFAULT NULL,
  `capacidadeDeLigacoes` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk__operadora_id` (`operadora`),
  CONSTRAINT `fk__operadora_id` FOREIGN KEY (`operadora`) REFERENCES `operadora` (`id`)
);

CREATE TABLE `Plano` (
  `codigo` smallint(5) unsigned NOT NULL,
  `operadora_P` tinyint(3) unsigned NOT NULL,
  `vigencia` varchar(30) NOT NULL,
  `fidelização` tinyint(3) unsigned DEFAULT NULL,
  `tipo` varchar(10) NOT NULL,
  `cadência` float(6,2) NOT NULL,
  `custoCadencia` float(6,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_operador_P_id` (`operadora_P`),
  CONSTRAINT `fk_operador_P_id` FOREIGN KEY (`operadora_P`) REFERENCES `operadora` (`id`)
);

CREATE TABLE `pessoa` (
  `id_pessoa` smallint(255) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `documento` varchar(30) NOT NULL,
  `endereço` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pessoa`)
);

CREATE TABLE `operadora` (
  `id` tinyint(3) unsigned NOT NULL,
  `cnpj` bigint(20) unsigned NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
);

CREATE TABLE `numero` (
  `numero` bigint(20) unsigned NOT NULL,
  `operadora_` tinyint(3) unsigned NOT NULL,
  `crédito` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `numero` (`numero`),
  KEY `fk_operadoraNum_id` (`operadora_`),
  CONSTRAINT `fk_operadoraNum_id` FOREIGN KEY (`operadora_`) REFERENCES `operadora` (`id`)
);

CREATE TABLE `IMEI` (
  `numero_IMEI` bigint(20) unsigned NOT NULL,
  `proprietario` smallint(255) unsigned NOT NULL,
  `numeroSerial` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`numero_IMEI`),
  UNIQUE KEY `numero_IMEI` (`numero_IMEI`),
  KEY `fk_proprietario_id` (`proprietario`),
  CONSTRAINT `fk_proprietario_id` FOREIGN KEY (`proprietario`) REFERENCES `pessoa` (`id_pessoa`)
);

CREATE TABLE `erb` (
  `id` int(10) unsigned NOT NULL,
  `operadora` tinyint(3) unsigned NOT NULL,
  `qos` smallint(5) unsigned DEFAULT '500',
  `limite` smallint(5) unsigned DEFAULT '2500',
  `area` tinyint(3) unsigned DEFAULT '48',
  `longitude` float(8,6) DEFAULT NULL,
  `latitude` float(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_operadora_id` (`operadora`),
  CONSTRAINT `fk_operadora_id` FOREIGN KEY (`operadora`) REFERENCES `operadora` (`id`)
);

CREATE TABLE `Contrato` (
  `numero` int(10) unsigned NOT NULL,
  `contratante` smallint(255) unsigned DEFAULT NULL,
  `contratado` tinyint(3) unsigned NOT NULL,
  `plano` smallint(5) unsigned NOT NULL,
  `endereçoCobrança` varchar(50) NOT NULL,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `plano` (`plano`),
  KEY `fk_contratante_id` (`contratante`),
  KEY `fk_contratado_id` (`contratado`),
  CONSTRAINT `fk_plano_numero` FOREIGN KEY (`plano`) REFERENCES `Plano` (`codigo`),
  CONSTRAINT `fk_contratado_id` FOREIGN KEY (`contratado`) REFERENCES `operadora` (`id`),
  CONSTRAINT `fk_contratante_id` FOREIGN KEY (`contratante`) REFERENCES `pessoa` (`id_pessoa`)
);

CREATE TABLE `Chip` (
  `ICCID` bigint(20) unsigned NOT NULL,
  `registro` int(10) unsigned NOT NULL,
  `vinculo` bigint(20) unsigned NOT NULL,
  `associacao` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ICCID`),
  UNIQUE KEY `ICCID` (`ICCID`),
  UNIQUE KEY `associacao` (`associacao`),
  KEY `fk_vinculo_numero` (`vinculo`),
  KEY `fk_registro_id` (`registro`),
  CONSTRAINT `fk_registro_id` FOREIGN KEY (`registro`) REFERENCES `erb` (`id`),
  CONSTRAINT `fk_vinculo_numero` FOREIGN KEY (`vinculo`) REFERENCES `numero` (`numero`)
);
