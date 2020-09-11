# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

import os

# Grabs the folder where the script runs.
basedir = os.path.abspath(os.path.dirname(__file__))

class Config():

	CSRF_ENABLED = True
	SECRET_KEY   = "77tgFCdrEEdv77554##@3" 
	
	SQLALCHEMY_TRACK_MODIFICATIONS 	= False

<<<<<<< HEAD
	SQLALCHEMY_DATABASE_URI = 'mysql://root:root08xFFD8@localhost/sbpos'
=======
	# SQLALCHEMY_DATABASE_URI = 'mysql://root:rootxFFD8@localhost/sbpos'
	SQLALCHEMY_DATABASE_URI = os.getenv('DB_CONNECTION') + '://' + os.getenv('DB_USERNAME') + ':' + os.getenv('DB_PASSWORD') + '@' + os.getenv('DB_HOST') + '/' + os.getenv('DB_DATABASE')
>>>>>>> release/1.2.1
