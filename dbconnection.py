import pymysql

def connection():
    conn = pymysql.connect(host='localhost',user='root',passwd='root08FFD8',db='sbpos' )

    return conn
