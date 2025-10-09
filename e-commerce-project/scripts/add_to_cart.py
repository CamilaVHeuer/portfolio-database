from mysql.connector import Error
from connect_db import connect_to_db

def validate_customer(cursor):
    """Asks for customer_id and validates that it exists in the DB."""
    while True:
        try:
            customer_id = int(input("Enter customer ID: "))
            cursor.execute("SELECT 1 FROM customers WHERE customer_id=%s", (customer_id,))
            if cursor.fetchone():
                return customer_id
            print("❌ Customer does not exist. Please try again.")
        except ValueError:
            print("❌ You must enter an integer number.")


def validate_product(cursor):
    """Asks for product_id and validates that it exists in the DB. Also returns available stock."""
    while True:
        try:
            product_id = int(input("Enter product ID: "))
            cursor.execute("SELECT stock FROM products WHERE product_id=%s", (product_id,))
            result = cursor.fetchone()
            if result:
                available_stock = result[0]
                return product_id, available_stock
            print("❌ Product does not exist. Please try again.")
        except ValueError:
            print("❌ You must enter an integer number.")


def request_quantity(available_stock):
    """Asks for quantity and validates that it's positive and less than or equal to stock."""
    while True:
        try:
            quantity = int(input(f"Enter quantity (available stock: {available_stock}): "))
            if quantity <= 0:
                print("❌ Quantity must be greater than 0.")
            elif quantity > available_stock:
                print(f"⚠️ Only {available_stock} units available.")
            else:
                return quantity
        except ValueError:
            print("❌ You must enter an integer number.")


def add_to_cart(connection, customer_id, product_id, quantity):
    """Inserts product into the customer's cart."""
    try:
        cursor = connection.cursor()
        query = """
        INSERT INTO cart (customer_id, product_id, quantity)
        VALUES (%s, %s, %s)
        """
        cursor.execute(query, (customer_id, product_id, quantity))
        connection.commit()
        print(f"🛒 Product {product_id} x{quantity} added to customer {customer_id}'s cart")
    except Error as e:
        print(f"⚠️ Error adding product to cart: {e}")
        connection.rollback()


def create_order(connection, customer_id):
    """Creates order using the stored procedure."""
    try:
        cursor = connection.cursor()
        cursor.callproc('insert_order_from_cart_3', [customer_id])
        connection.commit()
        print(f"🧾 Order created successfully for customer {customer_id}")
    except Error as e:
        print(f"⚠️ Error creating order: {e}")
        connection.rollback()


def main():
    """Main program flow."""
    connection = connect_to_db()
    if not connection:
        return

    cursor = connection.cursor()

    # 1️⃣ Validate customer
    customer_id = validate_customer(cursor)

    # 2️⃣ Add products
    while True:
        product_id, available_stock = validate_product(cursor)
        quantity = request_quantity(available_stock)
        add_to_cart(connection, customer_id, product_id, quantity)

        more = input("Do you want to add another product? (y/n): ").strip().lower()
        if more != 'y':
            break

    # 3️⃣ Confirm order creation
    confirm = input("Do you want to create the order now? (y/n): ").strip().lower()
    if confirm == 'y':
        create_order(connection, customer_id)

    # 4️⃣ Close connection
    cursor.close()
    connection.close()
    print("🔒 Connection closed.")


if __name__ == "__main__":
    main()
