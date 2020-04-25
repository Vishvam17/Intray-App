from flask_restful import Resource

class User(Resource):
    def __init__(self, api_key, firstname, lastname, emailadress, password, username):
        self.api_key = api_key
        self.firstname = firstname
        self.lastname = lastname
        self.emailadress = emailadress
        self.password = password
        self.username = username
    

    def get(self):
        return {"message":"Hello, World!"}
    