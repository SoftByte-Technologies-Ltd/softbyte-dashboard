import pymysql

def connection():
    conn = pymysql.connect(host='localhost',user='root',passwd='rootxFFD8',db='sbpos' )

    return conn
