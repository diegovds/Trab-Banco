USE agenciaUpa;

drop table if exists `agenciaUpa`.`unidade_fed`;
create table `agenciaUpa`.`unidade_fed`(
	`idUni` int not null AUTO_INCREMENT,
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

drop table if exists `agenciaUpa`.`orgao_resp`;
create table `agenciaUpa`.`orgao_resp`(
	`idOrgao` int not null,
	`nome` varchar(20) not null,
	primary key(`idOrgao`)
);

drop table if exists `agenciaUpa`.`empreendimento`;
create table `agenciaUpa`.`empreendimento`(
	`idEmpreendimento` int not null,
	`fid` varchar(50) not null,
	`idEstagio` int not null,
	`idExecutor` int not null,
	`idOrgao` int not null,
	`invest_prev` varchar(10) not null,
	`obs` varchar(100),
	`data` varchar(20) not null,
	primary key(`idEmpreendimento`),
	foreign key (`idEstagio`) references `estagioObra`(`idEstagio`),
	foreign key (`idOrgao`) references `orgao_resp`(`idOrgao`),
	foreign key (`idExecutor`) references `executor`(`idExecutor`)
);

drop table if exists `agenciaUpa`.`municipio`;
create table `agenciaUpa`.`municipio`(
	`idUni` int not null,
	`idMuni` int not null AUTO_INCREMENT,
	`nome` varchar(30) not null,
	constraint `mu_UF` primary key(`idMuni`, `idUni`),
	foreign key (`idUni`) references `unidade_fed`(`idUni`)
);

drop table if exists `agenciaUpa`.`tipo_upa`;
create table `agenciaUpa`.`tipo_upa`(
	`idTipo` int not null,
	`nome` varchar(30),
	primary key (`idTipo`)
);

drop table if exists `agenciaUpa`.`subeixo`;
create table `agenciaUpa`.`subeixo`(
	`idSubeixo` int not null,
	`nome` varchar(30),
	primary key (`idSubeixo`)
);

drop table if exists `agenciaUpa`.`upa`;
create table `agenciaUpa`.`upa`(
	`idEmpreendimento` int not null,
	`cod` int not null,
	`idMuni` int not null,
	`nome` varchar(100) not null,
	`idSubeixo` int not null,
	`idTipo` int not null,
	`geometria` varchar(100) not null,
	`count` int default '0',
	constraint `empre_UPA` primary key(`idEmpreendimento`, `cod`),
	foreign key (`idEmpreendimento`) references `empreendimento`(`idEmpreendimento`),
	foreign key (`idMuni`) references `municipio`(`idMuni`),
	foreign key (`idTipo`) references `tipo_upa`(`idTipo`),
	foreign key (`idSubeixo`) references `subeixo`(`idSubeixo`)
);