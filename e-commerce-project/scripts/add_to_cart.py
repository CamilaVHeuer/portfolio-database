from mysql.connector import Error
from connect_db import connect_to_db

def validar_customer(cursor):
    """Pide customer_id y valida que exista en la BD."""
    while True:
        try:
            customer_id = int(input("Ingrese el ID del cliente: "))
            cursor.execute("SELECT 1 FROM customers WHERE customer_id=%s", (customer_id,))
            if cursor.fetchone():
                return customer_id
            print("❌ Cliente no existe. Intente de nuevo.")
        except ValueError:
            print("❌ Debe ingresar un número entero.")

def validar_product(cursor):
    """Pide product_id y valida que exista en la BD."""
    while True:
        try:
            product_id = int(input("Ingrese el ID del producto: "))
            cursor.execute("SELECT 1 FROM products WHERE product_id=%s", (product_id,))
            if cursor.fetchone():
                return product_id
            print("❌ Producto no existe. Intente de nuevo.")
        except ValueError:
            print("❌ Debe ingresar un número entero.")

def pedir_cantidad():
    """Pide cantidad y valida que sea positiva."""
    while True:
        try:
            quantity = int(input("Ingrese la cantidad: "))
            if quantity > 0:
                return quantity
            print("❌ La cantidad debe ser mayor a 0.")
        except ValueError:
            print("❌ Debe ingresar un número entero.")

def add_to_cart(connection, customer_id, product_id, quantity):
    """Inserta producto en el carrito del cliente."""
    try:
        cursor = connection.cursor()
        query = """
        INSERT INTO cart (customer_id, product_id, quantity)
        VALUES (%s, %s, %s)
        """
        cursor.execute(query, (customer_id, product_id, quantity))
        connection.commit()
        print(f"🛒 Producto {product_id} x{quantity} agregado al carrito del cliente {customer_id}")
    except Error as e:
        print(f"⚠️ Error al agregar producto al carrito: {e}")
        connection.rollback()

def create_order(connection, customer_id):
    """Crea pedido usando el procedimiento almacenado."""
    try:
        cursor = connection.cursor()
        cursor.callproc('insert_order_from_cart_3', [customer_id])
        connection.commit()
        print(f"🧾 Pedido creado exitosamente para el cliente {customer_id}")
    except Error as e:
        print(f"⚠️ Error al crear pedido: {e}")
        connection.rollback()

def main():
    # Conexión
    connection = connect_to_db()
    if not connection:
        return

    cursor = connection.cursor()

    # Validar cliente
    customer_id = validar_customer(cursor)

    # Agregar productos
    while True:
        product_id = validar_product(cursor)
        quantity = pedir_cantidad()
        add_to_cart(connection, customer_id, product_id, quantity)

        more = input("¿Desea agregar otro producto? (s/n): ").strip().lower()
        if more != 's':
            break

    # Confirmar pedido
    confirm = input("¿Desea crear el pedido ahora? (s/n): ").strip().lower()
    if confirm == 's':
        create_order(connection, customer_id)

    # Cerrar conexión
    cursor.close()
    connection.close()
    print("🔒 Conexión cerrada.")

if __name__ == "__main__":
    main()
