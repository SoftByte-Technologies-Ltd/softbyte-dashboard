# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""

import os

from flask            import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login      import LoginManager
from flask_bcrypt     import Bcrypt
from flask_migrate    import Migrate
from dotenv           import load_dotenv

# load dotenv in the base root
APP_ROOT = os.path.join(os.path.dirname(__file__), '..')   # refers to application_top
dotenv_path = os.path.join(APP_ROOT, '.env')
load_dotenv(dotenv_path)

# Grabs the folder where the script runs.
basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__)

app.config.from_object('app.configuration.Config')

db = SQLAlchemy  (app) # flask-sqlalchemy
bc = Bcrypt      (app) # flask-bcrypt
migrate = Migrate(app, db)

lm = LoginManager(   ) # flask-loginmanager
lm.init_app(app) # init the login manager

# Setup database
@app.before_first_request
def initialize_database():
    db.create_all()

# Import routing, models and Start the App
from app import views, models
