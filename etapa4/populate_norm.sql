USE agenciaUpa;

delete from unidade_fed;
delete from municipio;
delete from tipo_upa;
delete from subeixo;
delete from estagioObra;
delete from executor;
delete from orgao_resp;
delete from upa;
delete from empreendimento;

delete from unidade_fed;
insert into unidade_fed(nome) 
	select distinct g.unidade_fed from geral g;

delete from municipio;
insert into municipio(nome, idUni)
	select distinct g.municipio, u.idUni from geral g inner join unidade_fed u on g.unidade_fed = u.nome;

delete from tipo_upa;
insert into tipo_upa(nome)
	select distinct g.tipo from geral g;

delete from subeixo;
insert into subeixo(nome)
	select distinct g.subeixo from geral g;

delete from estagioObra;
insert into estagioObra(nome)
	select distinct g.estagio from geral g;

delete from executor;
insert into executor(nome)
	select distinct g.executor from geral g;

delete from orgao_resp;
insert into orgao_resp(nome)
	select distinct g.orgao_resp from geral g;

delete from upa;
insert into upa(idMuni, nome, idSubeixo, idTipo, geometria, count)
	select distinct m.idMuni ,g.empreendimento, s.idSubeixo, t.idTipo, g.geometria, g.count from geral g 
	inner join municipio m on g.municipio = m.nome
	inner join subeixo s on g.subeixo = s.nome
	inner join tipo_upa t on g.tipo = t.nome;

delete from empreendimento;
insert into empreendimento(idUpa, fid, idEstagio, idExecutor, idOrgao, invest_prev, obs, data)
	select distinct u.idUpa, g.fid, p.idEstagio, e.idExecutor, o.idOrgao, g.invest_prev, g.obs, g.data from geral g
	inner join upa u on g.empreendimento = u.nome 
	inner join orgao_resp o on g.orgao_resp = o.nome
	inner join executor e on g.executor = e.nome
	inner join estagioObra p on g.estagio = p.nome;

drop table geral;