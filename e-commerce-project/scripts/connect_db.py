import mysql.connector
from mysql.connector import Error
import os
from dotenv import load_dotenv

load_dotenv()  # Load environment variables from .env

def connect_to_db():
    """Connects to ecommerce_db database using dev_user and returns the connection."""
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),         # server
            user=os.getenv("DB_USER"),          # created user
            password=os.getenv("DB_PASSWORD"),      # user password
            database=os.getenv("DB_NAME")       # database to connect to
        )

        if connection.is_connected():
            print("✅ Connected to ecommerce_db as dev_user")
            return connection

    except Error as e:
        print("❌ Error connecting to database:", e)
        return None

def fetch_products(connection):
    """Executes SELECT * FROM products and displays results."""
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM products;")
        rows = cursor.fetchall()

        if rows:
            print("📦 Products in database:")
            for row in rows:
                print(row)
        else:
            print("⚠️ No products in the table")

    except Error as e:
        print("❌ Error executing query:", e)

    finally:
        cursor.close()

def main():
    conn = connect_to_db()
    if conn:
        fetch_products(conn)
        conn.close()
        print("🔒 Connection closed")

if __name__ == "__main__":
    main()
