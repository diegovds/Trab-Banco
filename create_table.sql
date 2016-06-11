drop database if exists agenciaUpa;

create database agenciaUpa;

USE agenciaUpa;

drop table if exists `agenciaUpa`.`geral`;
create table `agenciaUpa`.`geral`(
	`id` int(10) unsigned not null default '0',
	`empreendimento` varchar(50),
	`fid` varchar(50) not null,
	`subeixo` varchar(50) not null,
	`tipo` varchar(3) not null,
	`orgao_resp` varchar(30) not null,
	`executor` varchar(30) not null,
	`unidade_fed` varchar(2) not null,
	`municipio` varchar(30) not null,
	`invest_prev` varchar(10) not null,
	`obs` varchar(100),
	`estagio` varchar(20) not null,
	`data` varchar(20) not null,
	`geometria` varchar(100) not null,
	`count` int default '0',
	primary key(id)
);