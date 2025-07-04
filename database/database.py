import sqlite3
import os
from pathlib import Path

class Database:
    def __init__(self):
        
        home_dir = Path.home()
        self.db_dir = home_dir / "UNB_database"
        
        
        self.db_dir.mkdir(parents=True, exist_ok=True)
        
        
        self.db_path = self.db_dir / "database.db"
        
        
        os.chmod(self.db_dir, 0o777)  
        
        print(f"📁 Database path: {self.db_path}")
        self.init_db()
    
    def get_connection(self):
        """Retorna uma conexão com o banco de dados"""
        try:
            
            open(self.db_path, 'a').close()
            return sqlite3.connect(str(self.db_path))
        except Exception as e:
            print(f"🚨 Critical DB error: {e}")
            raise
    
    def init_db(self):
        """Inicializa o banco de dados criando as tabelas necessárias"""
        try:
            conn = self.get_connection()
            cursor = conn.cursor()
            
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
            print("✅ Banco de dados inicializado com sucesso!")
        except Exception as e:
            print(f"❌ Erro ao inicializar banco de dados: {e}")
            raise
        finally:
            if conn:
                conn.close()
db = Database()