from flask import render_template,redirect,request,session,flash

from flask_app.models.dojo_model import Dojo
from flask_app.models.ninja_model import Ninja
from flask_app import app


@app.route('/')
def index():
	return redirect('/dojos')

#RUTA DE LECTURA
@app.route('/dojos')
def dojos():
	return render_template("dojos.html", dojos=Dojo.get_all())

#RUTA DE CREACION
@app.route('/creardojo', methods=['POST'])
def creardojo():
	data = {
		"name" : request.form['dojo_name']
	}
	Dojo.save(data)
	return redirect('/dojos')

#agregado
@app.route('/dojo/<int:dojo_id>')
def show_dojo(dojo_id):
	dojo = Dojo.get_one(dojo_id)
	ninjas_dojo = Ninja.get_by_dojo(dojo_id)
	print(ninjas_dojo)
	return render_template('vista_dojo.html', dojo=dojo, ninjas_dojo=ninjas_dojo)
