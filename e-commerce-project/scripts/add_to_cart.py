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
    """Pide product_id y valida que exista en la BD. Devuelve también el stock disponible."""
    while True:
        try:
            product_id = int(input("Ingrese el ID del producto: "))
            cursor.execute("SELECT stock FROM products WHERE product_id=%s", (product_id,))
            result = cursor.fetchone()
            if result:
                stock_disponible = result[0]
                return product_id, stock_disponible
            print("❌ Producto no existe. Intente de nuevo.")
        except ValueError:
            print("❌ Debe ingresar un número entero.")


def pedir_cantidad(stock_disponible):
    """Pide cantidad y valida que sea positiva y menor o igual al stock."""
    while True:
        try:
            quantity = int(input(f"Ingrese la cantidad (stock disponible: {stock_disponible}): "))
            if quantity <= 0:
                print("❌ La cantidad debe ser mayor a 0.")
            elif quantity > stock_disponible:
                print(f"⚠️ Solo hay {stock_disponible} unidades disponibles.")
            else:
                return quantity
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
    """Flujo principal del programa."""
    connection = connect_to_db()
    if not connection:
        return

    cursor = connection.cursor()

    # 1️⃣ Validar cliente
    customer_id = validar_customer(cursor)

    # 2️⃣ Agregar productos
    while True:
        product_id, stock_disponible = validar_product(cursor)
        quantity = pedir_cantidad(stock_disponible)
        add_to_cart(connection, customer_id, product_id, quantity)

        more = input("¿Desea agregar otro producto? (s/n): ").strip().lower()
        if more != 's':
            break

    # 3️⃣ Confirmar creación del pedido
    confirm = input("¿Desea crear el pedido ahora? (s/n): ").strip().lower()
    if confirm == 's':
        create_order(connection, customer_id)

    # 4️⃣ Cerrar conexión
    cursor.close()
    connection.close()
    print("🔒 Conexión cerrada.")


if __name__ == "__main__":
    main()
