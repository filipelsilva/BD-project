#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request
import psycopg2
import psycopg2.extras

## SGBD configs
local = True
if (local):
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

app = Flask(__name__)

# @app.route("/")
# def list_accounts():
#	 dbConn = None
#	 cursor = None
#	 try:
#		 dbConn = psycopg2.connect(DB_CONNECTION_STRING)
#		 cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
#		 query = "select * from categoria;"
#		 cursor.execute(query)
#		 return render_template("index.html", cursor = cursor)
#	 except Exception as e:
#		 return str(e)  # Renders a page with the error.
#	 finally:
#		 cursor.close()
#		 dbConn.close()

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

# old stuff
@app.route("/")
def list_accounts():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "SELECT * FROM account;"
		cursor.execute(query)
		return render_template("index.html", cursor = cursor)
	except Exception as e:
		return str(e)  # Renders a page with the error.
	finally:
		cursor.close()
		dbConn.close()

@app.route("/accounts")
def list_accounts_edit():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		query = "SELECT account_number, branch_name, balance FROM account;"
		cursor.execute(query)
		return render_template("accounts.html", cursor = cursor)
	except Exception as e:
		return str(e)
	finally:
		cursor.close()
		dbConn.close()

@app.route("/balance")
def change_balance():
	try:
		return render_template("balance.html", params = request.args)
	except Exception as e:
		return str(e)

@app.route("/update", methods = ["POST"])
def update_balance():
	dbConn = None
	cursor = None
	try:
		dbConn = psycopg2.connect(DB_CONNECTION_STRING)
		cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
		balance = request.form["balance"]
		account_number = request.form["account_number"]
		query = "UPDATE account SET balance = %s WHERE account_number = %s"
		data = (balance, account_number)
		cursor.execute(query, data)
		return query
	except Exception as e:
		return str(e)
	finally:
		dbConn.commit()
		cursor.close()
		dbConn.close()

CGIHandler().run(app)
