from random import choice, randint, uniform

from faker import Faker

fake = Faker("en_US")


def generate_client(n: int) -> dict:
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


def generate_geo(n: int) -> dict:
    geo = dict()
    i = 0

    while len(geo) < n:
        geo[str(i)] = {"country": fake.current_country(), "Branch": fake.state()}
        i += 1

    return geo


def generate_products(n: int, product_type: str) -> dict:
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
    params:
        n_orders - Number of orders to be generated A.K.A. len(orders)
        n_customers - Number of customers generated beforehand
        n_regions - Number of regions generated beforehand
        n_products - Number of products generated beforehand
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
