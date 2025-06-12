import sqlite3


class Database:

    def __init__(self):
        """Inicializa la conexión a la base de datos SQLite."""
        self.db_path = 'db/app.db'
        self.conn = None
        self.cursor = None

    def conectar(self):
        """Establece la conexión a la base de datos."""
        self.conn = sqlite3.connect(self.db_path)
        self.conn.row_factory = sqlite3.Row  # Para obtener resultados como diccionarios
        self.cursor = self.conn.cursor()

    def cerrar(self):
        """Cierra la conexión a la base de datos."""
        if self.cursor:
            self.cursor.close()
        if self.conn:
            self.conn.close()

    def ejecutar(self, query, params=None):
        """Ejecuta una consulta SQL que modifica datos (INSERT, UPDATE, DELETE)."""
        if params is None:
            params = []
        try:
            self.cursor.execute(query, params)
            self.conn.commit()
        except sqlite3.Error as e:
            print(f"❌ Error al ejecutar query: {e}")
            self.conn.rollback()

    def consultar(self, query, params=None):
        """Ejecuta una consulta SELECT y devuelve los resultados."""
        if params is None:
            params = []
        try:
            self.cursor.execute(query, params)
            return self.cursor.fetchall()
        except sqlite3.Error as e:
            print(f"❌ Error al ejecutar consulta: {e}")
            return []

    def __enter__(self):
        self.conectar()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.cerrar()
