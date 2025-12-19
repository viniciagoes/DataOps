from random import choice, randint, random, uniform

from faker import Faker

fake = Faker("en_US")


def generate_client(n: int) -> dict:
    """
    Generates a dictionary of clean client data.

    Args:
        n (int): Number of clients to generate.

    Returns:
        dict: A dictionary where keys are string IDs and values are client details
              (first_name, last_name, email, loyalty_tier).
    """
    clients = dict()
    i = 0

    while len(clients) < n:
        fn = fake.first_name()
        ln = fake.last_name()

        clients[str(i)] = {
            "first_name": fn,
            "last_name": ln,
            "email": f"{fn}.{ln}@email.com",
            "loyalty_tier": choice(["Gold", "Silver", "Bronze"]),
        }

        i += 1

    return clients


def mess_up_string(s: str) -> str:
    """
    Randomly modifies a string to simulate messy data.
    
    Operations:
    - Randomly capitalizes or lowercases individual characters.
    - Randomly adds trailing whitespace.

    Args:
        s (str): The original string.

    Returns:
        str: The modified (messy) string.
    """
    if not s:
        return s

    # Random capitalization
    s_list = list(s)
    num_chars_to_change = randint(1, len(s))
    for _ in range(num_chars_to_change):
        idx = randint(0, len(s) - 1)
        if random() > 0.5:
            s_list[idx] = s_list[idx].upper()
        else:
            s_list[idx] = s_list[idx].lower()

    res = "".join(s_list)

    # Add trailing whitespace
    if random() > 0.5:
        res += " " * randint(1, 3)

    return res


def generate_messy_client(n: int, messiness_rate: float = 0.1) -> dict:
    """
    Generates a dictionary of client data with random data quality issues.

    Data issues introduced based on `messiness_rate`:
    1. Null or empty first names.
    2. Invalid or malformed email addresses (missing '@', missing domain, or None).
    3. Invalid loyalty tiers (e.g., 'Plastic', 'Diamond', 'Wood').
    4. Inconsistent string formatting (random capitalization, trailing spaces).

    Args:
        n (int): Number of clients to generate.
        messiness_rate (float): Probability of introducing an error for each field checks.

    Returns:
        dict: A dictionary of messy client data.
    """
    clients = dict()
    i = 0

    while len(clients) < n:
        fn = fake.first_name()
        ln = fake.last_name()
        email = f"{fn}.{ln}@email.com"
        loyalty = choice(["Gold", "Silver", "Bronze"])

        # Messy Logic
        # 1. Null/Empty Names
        if random() < messiness_rate:
            if random() < 0.5:
                fn = None
            else:
                fn = ""

        # 2. Messy Email (No @, or None)
        if random() < messiness_rate:
            r = random()
            if r < 0.3:
                email = None
            elif r < 0.6:
                email = f"{fn}.{ln}email.com"  # Missing @
            else:
                email = f"{fn}@{ln}"  # Missing domain

        # 3. Invalid Loyalty
        if random() < messiness_rate:
            loyalty = choice(["Plastic", "Diamond", "Wood", None])

        # 4. Inconsistent Formatting
        if fn and isinstance(fn, str) and random() < messiness_rate:
            fn = mess_up_string(fn)
        if ln and isinstance(ln, str) and random() < messiness_rate:
            ln = mess_up_string(ln)

        clients[str(i)] = {
            "first_name": fn,
            "last_name": ln,
            "email": email,
            "loyalty_tier": loyalty,
        }

        i += 1

    return clients


def generate_geo(n: int) -> dict:
    """
    Generates geographical data (Country and Branch/State names).

    Args:
        n (int): Number of locations to generate.

    Returns:
        dict: A dictionary of location data with 'country' and 'Branch'.
    """
    geo = dict()
    i = 0

    while len(geo) < n:
        geo[str(i)] = {"country": fake.current_country(), "Branch": fake.state()}
        i += 1

    return geo


def generate_messy_products(
    n: int, product_type: str, messiness_rate: float = 0.1
) -> dict:
    """
    Generates a dictionary of product data with random data quality issues.

    Data issues introduced based on `messiness_rate`:
    1. Invalid unit prices (negative, zero, or extremely high).
    2. Null or empty product names, or excessively long names.
    3. Inconsistent string formatting in product names.

    Args:
        n (int): Number of products to generate.
        product_type (str): Type of product ('Beverages', 'Foods', 'Sweets').
        messiness_rate (float): Probability of introducing an error.

    Returns:
        dict: A dictionary of messy product data.
    """
    # First generate clean products, then mess them up
    products = generate_products(n, product_type)

    for key, prod in products.items():
        # Messy Unit Price
        if random() < messiness_rate:
            r = random()
            if r < 0.3:
                prod["unit_price"] = round(uniform(-10, -5), 2)  # Negative
            elif r < 0.6:
                prod["unit_price"] = 0.0  # Zero
            else:
                prod["unit_price"] = round(uniform(1000, 5000), 2)  # Extremely high

        # Messy Product Name
        if random() < messiness_rate:
            r = random()
            if r < 0.3:
                prod["product_name"] = None
            elif r < 0.6:
                prod["product_name"] = ""
            else:
                # Very long string
                prod["product_name"] = "Long " * 20 + prod.get("product_name", "")

        # Inconsistent Formatting
        if (
            prod.get("product_name")
            and isinstance(prod["product_name"], str)
            and random() < messiness_rate
        ):
            prod["product_name"] = mess_up_string(prod["product_name"])

    return products


def generate_products(n: int, product_type: str) -> dict:
    """
    Generates a dictionary of clean product data for a specific type.

    Args:
        n (int): Number of products to generate.
        product_type (str): The category of products ('Beverages', 'Foods', 'Sweets').

    Returns:
        dict: A dictionary of product data items.
    """
    products = dict()

    match product_type:
        case "Beverages":
            bev_modifiers = [
                "Venti",
                "Grande",
                "Tall",
                "Iced",
                "Toasted",
                "Blended",
                "Decaf",
                "Hot",
            ]

            bev_flavors = [
                "Caramel",
                "Vanilla",
                "Pumpkin Spice",
                "Oatmilk",
                "Matcha",
                "Hazelnut",
                "Peppermint",
                "Dragonfruit",
            ]

            bev_formats = [
                "Latte",
                "Macchiato",
                "Frappuccino",
                "Refresher",
                "Cold Brew",
                "Flat White",
                "Mocha",
                "Americano",
            ]

            i = 0

            while len(products) < n:
                product_name = f"{choice(bev_modifiers)} {choice(bev_flavors)} {choice(bev_formats)}"

                random_price = round(uniform(5, 15.0), 2)

                products[str(i)] = {
                    "product_name": product_name,
                    "unit_price": random_price,
                    "category": 1,
                }
                i += 1

        case "Foods":
            food_proteins = [
                "Bacon & Gruyère",
                "Sausage & Cheddar",
                "Spinach & Feta",
                "Turkey Bacon",
                "Ham & Swiss",
                "Tomato & Mozzarella",
                "Impossible",
                "Kale & Mushroom",
            ]
            food_bases = [
                "Sandwich",
                "Wrap",
                "Egg Bites",
                "Bagel",
                "Panini",
                "Baguette",
                "Focaccia",
                "Oatmeal",
            ]

            i = 0

            while len(products) < n:
                product_name = f"{choice(food_proteins)} {choice(food_bases)}"

                random_price = round(uniform(10, 25), 2)

                products[str(i)] = {
                    "product_name": product_name,
                    "unit_price": random_price,
                    "category": 2,
                }
                i += 1

        case "Sweets":
            sweet_flavors = [
                "Birthday",
                "Chocolate Chip",
                "Lemon",
                "Pumpkin",
                "Vanilla Bean",
                "Red Velvet",
                "Cranberry Bliss",
                "Cinnamon",
            ]
            sweet_types = [
                "Cake Pop",
                "Cookie",
                "Brownie",
                "Loaf",
                "Danish",
                "Scone",
                "Doughnut",
                "Croissant",
            ]

            i = 0

            while len(products) < n:
                product_name = f"{choice(sweet_flavors)} {choice(sweet_types)}"

                random_price = round(uniform(5, 15.0), 2)

                products[str(i)] = {
                    "product_name": product_name,
                    "unit_price": random_price,
                    "category": 3,
                }
                i += 1

    return products


def generate_orders(
    n_orders: int, n_customers: int, n_regions: int, n_products: int
) -> tuple[dict, dict]:
    """
    Generates clean orders and order line items.

    Args:
        n_orders (int): Number of orders to generate.
        n_customers (int): Total number of customers available (for random ID generation).
        n_regions (int): Total number of regions/branches available (for random ID generation).
        n_products (int): Total number of products available (for random ID generation).

    Returns:
        tuple[dict, dict]:
            - orders: Dictionary of order headers.
            - order_items: Dictionary of lists, where each list contains line items for an order.
    """
    orders = dict()
    order_items = dict()

    for i in range(n_orders):
        i += 1

        # Generate order header
        orders[str(i)] = {
            "order_id": i,
            "customer_id": randint(1, n_customers),
            "branch_id": randint(1, n_regions),
        }

        # Genrate X order items
        n_items = randint(1, 6)
        items = list()

        for j in range(n_items):
            items.append(
                {
                    "order_id": i,
                    "product_id": randint(1, n_products),
                    "quantity": randint(1, 5),
                }
            )

        order_items[str(i)] = items

    return orders, order_items


def generate_messy_orders(
    n_orders: int,
    n_customers: int,
    n_regions: int,
    n_products: int,
    messiness_rate: float = 0.1,
) -> tuple[dict, dict]:
    """
    Generates orders and order line items with random data quality issues.

    Data issues introduced based on `messiness_rate` (specifically in line items):
    1. Zero quantity.
    2. Negative quantity.
    3. Unusually high quantity (100-1000).

    Args:
        n_orders (int): Number of orders.
        n_customers (int): Number of customers.
        n_regions (int): Number of regions.
        n_products (int): Number of products.
        messiness_rate (float): Probability of introducing an error in line items.

    Returns:
        tuple[dict, dict]: Messy orders and order items.
    """
    orders, order_items = generate_orders(n_orders, n_customers, n_regions, n_products)

    for i in range(1, n_orders + 1):
        # We can mess up orders header here (e.g. invalid dates) but focusing on items as requested
        # Let's actually mess up the items for this order

        items = order_items[str(i)]
        for item in items:
            # Messy Quantity
            if random() < messiness_rate:
                r = random()
                if r < 0.3:
                    item["quantity"] = 0
                elif r < 0.6:
                    item["quantity"] = -randint(1, 5)  # Negative quantity
                else:
                    item["quantity"] = randint(100, 1000)  # Unusually high quantity

            # Note: Not messing up IDs to avoid Database Integrity Errors that would stop insertion
            # We want the data to get IN, but be messy.

    return orders, order_items
