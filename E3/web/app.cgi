#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request
import psycopg2
import psycopg2.extras

# SGBD configs
local = False

if (local):
	DB_HOST = "localhost"
	DB_USER = "filipe"
	DB_DATABASE = DB_USER
	DB_PASSWORD = "postgres"
else:
	DB_HOST = "db.tecnico.ulisboa.pt"
	DB_USER = "ist195574"
	DB_DATABASE = DB_USER
	DB_PASSWORD = "postgres"

DB_CONNECTION_STRING = "host = %s dbname = %s user = %s password = %s" % (
	DB_HOST,
	DB_DATABASE,
	DB_USER,
	DB_PASSWORD,
)

# App
app = Flask(__name__)

@app.route("/")
def main_point():
	try:
		return render_template("index.html")
	except Exception as e:
		return str(e)

@app.route("/categoria")
def list_categoria():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from categoria;"
		cursor.execute(query)
		return render_template("categoria.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/categoria_simples")
def list_categoria_simples():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from categoria_simples;"
		cursor.execute(query)
		return render_template("categoria_simples.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/super_categoria")
def list_super_categoria():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from super_categoria;"
		cursor.execute(query)
		return render_template("super_categoria.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/tem_outra")
def list_tem_outra():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from tem_outra;"
		cursor.execute(query)
		return render_template("tem_outra.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/produto")
def list_produto():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from produto;"
		cursor.execute(query)
		return render_template("produto.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/tem_categoria")
def list_tem_categoria():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from tem_categoria;"
		cursor.execute(query)
		return render_template("tem_categoria.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/ivm")
def list_ivm():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from ivm;"
		cursor.execute(query)
		return render_template("ivm.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/ponto_de_retalho")
def list_ponto_de_retalho():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from ponto_de_retalho;"
		cursor.execute(query)
		return render_template("ponto_de_retalho.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/instalada_em")
def list_instalada_em():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from instalada_em;"
		cursor.execute(query)
		return render_template("instalada_em.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/prateleira")
def list_prateleira():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from prateleira;"
		cursor.execute(query)
		return render_template("prateleira.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/planograma")
def list_planograma():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from planograma;"
		cursor.execute(query)
		return render_template("planograma.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/retalhista")
def list_retalhista():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from retalhista;"
		cursor.execute(query)
		return render_template("retalhista.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/responsavel_por")
def list_responsavel_por():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from responsavel_por;"
		cursor.execute(query)
		return render_template("responsavel_por.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/evento_reposicao")
def list_evento_reposicao():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "select * from evento_reposicao;"
		cursor.execute(query)
		return render_template("evento_reposicao.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/adicionar_categoria", methods = ["POST"])
def adicionar_categoria():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		nome_categoria = request.form["nome_categoria"]
		tipo_categoria = request.form["tipo_categoria"]
		data = (nome_categoria,)
		queries = ["insert into categoria values (%s);",]
		if (tipo_categoria == "simples"):
			queries += ["insert into categoria_simples values (%s);",]
		else:
			queries += ["insert into super_categoria values (%s);",]
		for query in queries:
			cursor.execute(query, data)
		return queries[-1]
	except Exception as e:
		return str(e)
	finally:
		dbConn.commit()
		cursor.close()
		dbConn.close()

@app.route("/remover_categoria")
def remover_categoria():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		params = request.args
		nome_categoria = params.get("nome_categoria")
		tipo_categoria = params.get("tipo_categoria")
		data = (nome_categoria,)
		queries = []
		queries += ["delete from tem_outra where nome_super_categoria = %s;",]
		queries += ["delete from tem_outra where nome_categoria = %s;",]
		if (tipo_categoria == "super"):
			queries += ["delete from super_categoria where nome_categoria = %s;",]
		else:
			queries += ["delete from tem_categoria where nome_categoria = %s;",]
			queries += ["delete from produto where nome_categoria = %s;",]
			queries += ["delete from categoria_simples where nome_categoria = %s;",]
		queries += ["delete from categoria where nome_categoria = %s;",]
		for query in queries:
			cursor.execute(query, data)
		return queries[-1]
	except Exception as e:
		return str(e)
	finally:
		dbConn.commit()
		cursor.close()
		dbConn.close()

@app.route("/adicionar_retalhista", methods = ["POST"])
def adicionar_retalhista():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		tin = request.form["tin"]
		nome_retalhista = request.form["nome_retalhista"]
		data = (tin, nome_retalhista)
		query = "insert into retalhista values (%s, %s);"
		cursor.execute(query, data)
		return query
	except Exception as e:
		return str(e)
	finally:
		dbConn.commit()
		cursor.close()
		dbConn.close()

@app.route("/remover_retalhista")
def remover_retalhista():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		params = request.args
		tin = params.get("tin")
		data = (tin,)
		queries = []
		queries += ["delete from responsavel_por where tin = %s;",]
		queries += ["delete from evento_reposicao where tin = %s;",]
		queries += ["delete from retalhista where tin = %s;",]
		for query in queries:
			cursor.execute(query, data)
		return queries[-1]
	except Exception as e:
		return str(e)
	finally:
		dbConn.commit()
		cursor.close()
		dbConn.close()

@app.route("/evento_reposicao_ivm")
def list_evento_reposicao_ivm():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		params = request.args
		num_serie = params.get("num_serie")
		data = (num_serie,)
		query = "select * from evento_reposicao where num_serie = %s;"
		cursor.execute(query, data)
		return render_template("evento_reposicao_ivm.html", cursor = cursor, params = request.args)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/subcategorias")
def subcategorias():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		params = request.args
		nome_categoria = params.get("nome_categoria")
		data = (nome_categoria,)
		query = """
		with recursive recursivo as (
			select * from tem_outra where nome_super_categoria = %s
			union all
			select tem_outra.nome_super_categoria, tem_outra.nome_categoria from recursivo, tem_outra where recursivo.nome_categoria = tem_outra.nome_super_categoria
		) select * from recursivo;
		"""
		cursor.execute(query, data)
		return render_template("subcategorias.html", cursor = cursor, params = request.args)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

CGIHandler().run(app)
