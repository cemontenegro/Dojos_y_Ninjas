from flask_app.config.mysqlconnection import connectToMySQL

class Ninja:
	def __init__( self , data ):
		self.id = data['id']
		self.first_name = data['first_name']
		self.last_name = data['last_name']
		self.age = data['age']
		self.created_at = data['created_at']
		self.updated_at = data['updated_at']
		self.dojo_id = data ['dojo_id']

	def full_name(self):
		return f"{self.first_name} {self.last_name}"

	@classmethod
	def get_all(cls):
		consulta = "SELECT * FROM ninjas;"
		results = connectToMySQL('esquema_dojos_y_ninjas').query_db(consulta)
		esquema_dojos_y_ninjas = []
		for ninja_model in results:
			esquema_dojos_y_ninjas.append( cls(ninja_model) )
		return esquema_dojos_y_ninjas

	@classmethod
	def save(cls, data ):
		query = "INSERT INTO ninjas ( first_name , last_name , age , created_at, updated_at, dojo_id ) VALUES ( %(first_name)s , %(last_name)s , %(age)s , NOW() , NOW(), %(dojo_id)s);"
		return connectToMySQL('esquema_dojos_y_ninjas').query_db( query, data )


	@classmethod
	def get_by_dojo(cls,dojo_id):
		cond = {"dojo_id": dojo_id}
		consulta = "SELECT * FROM ninjas WHERE dojo_id = %(dojo_id)s"
		results = connectToMySQL('esquema_dojos_y_ninjas').query_db(consulta, cond)
		ninjas = []
		for ninja_model in results:
			ninjas.append( cls(ninja_model) )
		return ninjas
