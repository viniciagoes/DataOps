"""
Script to verify the generation of messy data.
Prints samples of clients, products, and orders to the console.
"""
from rand_data_generator import (
    generate_messy_client,
    generate_messy_orders,
    generate_messy_products,
)


def print_messy_samples():
    """
    Generates and prints samples of messy data for visual verification.
    """
    print("--- Messy Clients (Sample) ---")
    clients = generate_messy_client(10, messiness_rate=0.5)
    for k, v in list(clients.items())[:5]:
        print(v)

    print("\n--- Messy Products (Beverages) (Sample) ---")
    products = generate_messy_products(10, "Beverages", messiness_rate=0.5)
    for k, v in list(products.items())[:5]:
        print(v)

    print("\n--- Messy Orders (Sample) ---")
    orders, order_items = generate_messy_orders(5, 10, 2, 10, messiness_rate=0.5)
    for k, items in list(order_items.items())[:3]:
        print(f"Order {k}: {items}")


if __name__ == "__main__":
    print_messy_samples()
