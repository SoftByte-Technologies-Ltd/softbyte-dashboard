# -*- encoding: utf-8 -*-
"""
License: MIT
Copyright (c) 2019 - present AppSeed.us
"""
import os
from app import app, db

if __name__ == "__main__":
    app.config['ENV'] = os.getenv('APP_ENV')
    app.config['DEBUG'] = os.getenv('APP_DEBUG')
    app.config['TESTING'] = os.getenv('APP_TESTING')
    app.run()
