import pymysql

def connection():
<<<<<<< HEAD
    conn = pymysql.connect(host='localhost',user='root',passwd='root08xFFD8',db='sbpos' )
=======
    conn = pymysql.connect(host=os.getenv('DB_HOST'), user=os.getenv('DB_USERNAME'), passwd=os.getenv('DB_PASSWORD'),db=os.getenv('DB_DATABASE'))
>>>>>>> release/1.2.1

    return conn
