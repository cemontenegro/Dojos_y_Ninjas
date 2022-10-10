from flask import render_template,redirect,request,session,flash

from flask_app.models.ninja_model import Ninja
from flask_app.models.dojo_model import Dojo
from flask_app import app

@app.route('/ninjas', methods=["GET"])
def formulario_ninja():
	return render_template("ninjas.html", todos_dojos=Dojo.get_all())

@app.route('/crearninja', methods=["POST"])
def crearninja():
	data = {
		"first_name": request.form["fname"],
		"last_name" : request.form["lname"],
		"age" : request.form["age"],
		"dojo_id" : request.form["dojo_id"]
	}
	dojo_id=Ninja.save(data)
	return redirect('/dojo/' +  request.form["dojo_id"])