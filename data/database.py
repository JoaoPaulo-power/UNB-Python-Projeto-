import sqlite3
import os
from config import Config

class Database:
    def __init__(self):
        self.db_path = os.path = os.path.join(Config.DATA_PATH, 'appdb')
        self.init_db()

    def get_connection(self):
        return sqlite3.connect(self.db_path)
    
    def init_db(self):

        conn = self.get_connection()
        cursor = conn.cursor

        cursor.execute('''
            CREATE TABLE IF NOT EXISTS auth_users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                username TEXT UNIQUE NOT NULL,
                email TEXT UNIQUE NOT NULL,
                password_hash TEXT NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                is_active BOOLEAN DEFAULT 1
            )
        ''')

        conn.commit()
        conn.close()
        print("Banco de Dados Acessado!!!")

db = Database()