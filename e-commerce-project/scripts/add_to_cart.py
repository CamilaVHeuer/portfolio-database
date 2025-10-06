
from mysql.connector import Error

from connect_db import connect_to_db



def add_to_cart(connection, customer_id, product_id, quantity):
    """
    Inserta un producto en el carrito del cliente indicado.
    """
    try:
        cursor = connection.cursor()
        query = """
        INSERT INTO cart (customer_id, product_id, quantity)
        VALUES (%s, %s, %s);
        """
        cursor.execute(query, (customer_id, product_id, quantity))
        connection.commit()
        print(f"🛒 Producto {product_id} x{quantity} agregado al carrito del cliente {customer_id}")
    except Error as e:
        print(f"⚠️ Error al agregar producto al carrito: {e}")
        connection.rollback()

def create_order(connection, customer_id):
    """
    Llama al procedimiento almacenado insert_order_from_cart_3 para generar un pedido.
    """
    try:
        cursor = connection.cursor()
        cursor.callproc('insert_order_from_cart_3', [customer_id])
        connection.commit()
        print(f"🧾 Pedido creado exitosamente para el cliente {customer_id}")
    except Error as e:
        print(f"⚠️ Error al crear pedido: {e}")
        connection.rollback()

def main():
    # 1️⃣ Conectar
    connection = connect_to_db()
    if not connection:
        return

    # 2️⃣ Pedir datos del cliente
    customer_id = int(input("Ingrese el ID del cliente: "))

    # 3️⃣ Insertar productos al carrito (pueden ser varios)
    while True:
        product_id = int(input("Ingrese el ID del producto: "))
        quantity = int(input("Ingrese la cantidad: "))
        add_to_cart(connection, customer_id, product_id, quantity)

        more = input("¿Desea agregar otro producto? (s/n): ").strip().lower()
        if more != 's':
            break

    # 4️⃣ Confirmar pedido
    confirm = input("¿Desea crear el pedido ahora? (s/n): ").strip().lower()
    if confirm == 's':
        create_order(connection, customer_id)

    # 5️⃣ Cerrar conexión
    connection.close()
    print("🔒 Conexión cerrada.")

if __name__ == "__main__":
    main()
