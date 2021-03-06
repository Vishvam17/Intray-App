from flask import Flask
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy
from marshmallow import Schema, fields, pre_load, validate

ma = Marshmallow()
db = SQLAlchemy()


class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer(), primary_key=True)
    username = db.Column(db.String(), unique=True)
    firstname = db.Column(db.String())
    lastname = db.Column(db.String())
    password = db.Column(db.String())
    emailaddress = db.Column(db.String())
    api_key = db.Column(db.String())
 
    def __init__(self,api_key, firstname, lastname, emailaddress, password, username):
        self.api_key = api_key
        self.firstname = firstname
        self.lastname = lastname
        self.emailaddress = emailaddress 
        self.password = password
        self.username = username

    def __repr__(self):
        return '<id {}>'.format(self.id)

    def serialize(self):
        return {
            'api_key' : self.api_key,
            'id' : self.id,
            'username' : self.username,
            'firstname' : self.firstname,
            'lastname' : self.lastname,
            'password' : self.password,
            'emailaddress' : self.emailaddress,
        }
