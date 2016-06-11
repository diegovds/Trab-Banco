USE agenciaUpa;

drop table if exists `agenciaUpa`.`unidade_fed`;
create table `agenciaUpa`.`unidade_fed`(
	`idUni` int not null,
	`nome` varchar(2) not null,
	primary key(`idUni`)
);

drop table if exists `agenciaUpa`.`estagioObra`;
create table `agenciaUpa`.`estagioObra`(
	`idEstagio` int not null,
	`nome` varchar(20) not null,
	primary key(`idEstagio`)
);

drop table if exists `agenciaUpa`.`executor`;
create table `agenciaUpa`.`executor`(
	`idExecutor` int not null,
	`nome` varchar(20) not null,
	primary key(`idExecutor`)
);

drop table if exists `agenciaUpa`.`empreendimento`;
create table `agenciaUpa`.`empreendimento`(
	`idEmpreendimento` int not null,
	`fid` varchar(50) not null,
	`idEstagio` int not null,
	`idExecutor` int not null,
	`invest_prev` varchar(10) not null,
	`obs` varchar(100),
	`data` varchar(20) not null,
	`orgao_resp` varchar(30) not null,
	primary key(`idEmpreendimento`),
	foreign key (`idEstagio`) references `estagioObra`(`idEstagio`),
	foreign key (`idExecutor`) references `executor`(`idExecutor`)
);

drop table if exists `agenciaUpa`.`municipio`;
create table `agenciaUpa`.`municipio`(
	`idUni` int not null,
	`idMuni` int not null,
	`nome` varchar(2) not null,
	constraint `mu_UF` primary key(`idMuni`, `idUni`),
	foreign key (`idUni`) references `unidade_fed`(`idUni`)
);

drop table if exists `agenciaUpa`.`upa`;
create table `agenciaUpa`.`upa`(
	`idEmpreendimento` int not null,
	`cod` int not null,
	`idMuni` int not null,
	`nome` varchar(100) not null,
	`subeixo` varchar(50) not null,
	`tipo` varchar(3) not null,
	`geometria` varchar(100) not null,
	`count` int default '0',
	constraint `empre_UPA` primary key(`idEmpreendimento`, `cod`),
	foreign key (`idEmpreendimento`) references `empreendimento`(`idEmpreendimento`),
	foreign key (`idMuni`) references `municipio`(`idMuni`)
);