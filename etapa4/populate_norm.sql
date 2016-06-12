USE agenciaUpa;


delete from unidade_fed;
delete from municipio;

delete from unidade_fed;
insert into unidade_fed(nome) 
	select distinct g.unidade_fed from geral g;

delete from municipio;
insert into municipio(nome, idUni) 
	select distinct g.municipio, u.idUni from geral g inner join unidade_fed u on g.unidade_fed = u.nome;