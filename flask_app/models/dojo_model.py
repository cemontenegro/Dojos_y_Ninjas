from unittest import result
from flask_app.config.mysqlconnection import connectToMySQL

class Dojo:
	def __init__(self,data):
		self.id = data['id']
		self.name= data['name']
		self.created_at = data['created_at']
		self.updated_at = data['updated_at']

	#METODO PARA CREAR
	@classmethod
	def save(cls,data):
		consulta = "Insert INTO dojos (name,created_at,updated_at) VALUES(%(name)s,NOW(),NOW());"
		return connectToMySQL('esquema_dojos_y_ninjas').query_db(consulta,data)

	#METODO DE LECTURA
	@classmethod
	def get_all(cls):
		consulta = "SELECT * FROM dojos"
		dojos_from_db = connectToMySQL('esquema_dojos_y_ninjas').query_db(consulta)
		dojos = []
		for b in dojos_from_db:
			dojos.append(cls(b))
		return dojos

	@classmethod
	def get_one(cls, id):
		consulta = "SELECT * FROM dojos WHERE id = %(id)s;"
		data = connectToMySQL('esquema_dojos_y_ninjas').query_db(consulta, {"id": id})
		return cls(data[0])