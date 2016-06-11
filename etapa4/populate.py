#!/usr/bin/python3
import csv
import MySQLdb as mdb

tabela = []

with open('upa.csv', 'r') as csvfile:
	for line in csvfile:
		tabela.append(line[:-1].split(","))

conn = mdb.connect('localhost', 'root', 'teutudao', 'agenciaUpa')
with conn:
	cur = conn.cursor()
	for i in range(1, len(tabela)):
		data = (tabela[i][0], tabela[i][1], tabela[i][2], tabela[i][3], tabela[i][4], tabela[i][5], tabela[i][6], tabela[i][7], tabela[i][8], tabela[i][9], tabela[i][10], tabela[i][11], tabela[i][12], tabela[i][13], tabela[i][14])
		cur.execute("""INSERT INTO geral (fid, id, empreendimento, subeixo, tipo, orgao_resp, executor, unidade_fed, municipio, invest_prev, obs, estagio, data, geometria, count)
		VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""", data)
