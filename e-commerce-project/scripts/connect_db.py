import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

load_dotenv()  # Cargar variables de entorno desde .env

def connect_to_db():
    """Conecta a la base ecommerce_db usando dev_user y devuelve la conexión."""
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),         # servidor
            user=os.getenv("DB_USER"),          # usuario creado
            password=os.getenv("DB_PASSWORD"),      # contraseña del usuario
            database=os.getenv("DB_NAME")       # base a conectar
        )

        if connection.is_connected():
            print("✅ Conectado a ecommerce_db como dev_user")
            return connection

    except Error as e:
        print("❌ Error al conectar a la base de datos:", e)
        return None

def fetch_products(connection):
    """Ejecuta SELECT * FROM products y muestra resultados."""
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM products;")
        rows = cursor.fetchall()

        if rows:
            print("📦 Productos en la base:")
            for row in rows:
                print(row)
        else:
            print("⚠️ No hay productos en la tabla")

    except Error as e:
        print("❌ Error al ejecutar consulta:", e)

    finally:
        cursor.close()

def main():
    conn = connect_to_db()
    if conn:
        fetch_products(conn)
        conn.close()
        print("🔒 Conexión cerrada")

if __name__ == "__main__":
    main()
