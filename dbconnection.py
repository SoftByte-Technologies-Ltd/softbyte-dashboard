import pymysql
import os

def connection():
    conn = pymysql.connect(host=os.getenv('DB_HOST'), user=os.getenv('DB_USERNAME'), passwd=os.getenv('DB_PASSWORD'),db=os.getenv('DB_DATABASE'))

    return conn
