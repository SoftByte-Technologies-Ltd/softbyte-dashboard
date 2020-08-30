import pymysql

def connection():
    conn = pymysql.connect(host='localhost',user='root',passwd='password',db='pythondashboard' )

    return conn