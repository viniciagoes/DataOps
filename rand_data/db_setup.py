import argparse
import os
from datetime import datetime

from dotenv import load_dotenv
from rand_data_generator import (
    generate_client,
    generate_geo,
    generate_orders,
    generate_products,
)
from sqlalchemy import (
    Column,
    DateTime,
    ForeignKey,
    Integer,
    Numeric,
    String,
    create_engine,
)
from sqlalchemy.orm import declarative_base, sessionmaker
from sqlalchemy_utils import create_database, database_exists

load_dotenv()

db_url = os.getenv("DATABASE_URL")
engine = create_engine(db_url, echo=True)

if not database_exists(engine.url):
    create_database(engine.url)
    print("Database created.")
else:
    print("Database already exists.")

Base = declarative_base()


# --- GEOGRAPHY & ORG STRUCTURE ---
class Region(Base):
    __tablename__ = "regions"
    region_id = Column(Integer, primary_key=True)
    region_name = Column(String(50))


class Branch(Base):
    __tablename__ = "branches"
    branch_id = Column(Integer, primary_key=True)
    branch_name = Column(String(100))
    region_id = Column(Integer, ForeignKey("regions.region_id"))


# --- PRODUCT HIERARCHY (The Snowflake Seed) ---
class Category(Base):
    __tablename__ = "categories"
    category_id = Column(Integer, primary_key=True)
    name = Column(String(50))


class Product(Base):
    __tablename__ = "products"
    product_id = Column(Integer, primary_key=True)
    product_name = Column(String(100))
    unit_price = Column(Numeric(10, 2))
    category = Column(Integer, ForeignKey("categories.category_id"))


# --- CUSTOMERS ---
class Customer(Base):
    __tablename__ = "customers"
    customer_id = Column(Integer, primary_key=True)
    first_name = Column(String(100))
    last_name = Column(String(100))
    email = Column(String(100))
    loyalty_tier = Column(String(20))  # 'Gold', 'Silver', 'Bronze'


# --- THE TRANSACTIONAL CORE (Header + Line Items) ---
class OrderHeader(Base):
    __tablename__ = "order_headers"
    order_id = Column(Integer, primary_key=True)
    customer_id = Column(Integer, ForeignKey("customers.customer_id"))
    branch_id = Column(Integer, ForeignKey("branches.branch_id"))
    order_timestamp = Column(DateTime, default=datetime.now())


class OrderLineItem(Base):
    __tablename__ = "order_line_items"
    line_item_id = Column(Integer, primary_key=True)
    order_id = Column(Integer, ForeignKey("order_headers.order_id"))
    product_id = Column(Integer, ForeignKey("products.product_id"))
    quantity = Column(Integer)


Base.metadata.create_all(engine)


def divide_integer_with_remainder(number, parts):
    quotient, remainder = divmod(number, parts)

    result_int = [quotient + 1] * remainder + [quotient] * (parts - remainder)

    return result_int


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--num-geo",
        type=int,
        default=5,
        help="Number of different locations to generate",
    )

    parser.add_argument(
        "--num-products", type=int, default=30, help="Number of products to generate"
    )

    parser.add_argument(
        "--num-customers", type=int, default=100, help="Number of customers to generate"
    )

    parser.add_argument(
        "--num-orders", type=int, default=500, help="Number of orders to generate"
    )

    return parser.parse_args()


def main():
    args = parse_arguments()

    Session = sessionmaker(bind=engine)
    with Session() as session:
        # Generate geografical data
        try:
            # Based on a base ID and on randomly generated data, create a list with all data that will be inserted
            # Create a base region
            # Create new Branches objects, all in the sabe region
            # Commmit all to DB

            reg = Region(region_id=1, region_name="United States")

            session.add(reg)
            session.commit()

        except Exception as e:
            print(f"(Regions) Error: {e}")
            session.rollback()

        try:
            commit_data = []
            geo_id = 0
            geo = generate_geo(args.num_geo)

            for data in geo.values():
                geo_id += 1

                commit_data.append(
                    Branch(branch_id=geo_id, branch_name=data["Branch"], region_id=1)
                )

            session.add_all(commit_data)
            session.commit()

        except Exception as e:
            print(f"(Branches) Error: {e}")
            session.rollback()

        # Generate products categories
        try:
            cat1 = Category(category_id=1, name="Beverages")
            cat2 = Category(category_id=2, name="Foods")
            cat3 = Category(category_id=3, name="Sweets")

            commit_data = [cat1, cat2, cat3]
            session.add_all(commit_data)
            session.commit()

        except Exception as e:
            print(f"(Categories) Error: {e}")
            session.rollback()

        # Generate products
        try:
            sizes = divide_integer_with_remainder(args.num_products, 3)

            beverages = generate_products(sizes[0], "Beverages")
            foods = generate_products(sizes[1], "Foods")
            sweets = generate_products(sizes[2], "Sweets")

            product_id = 0
            commit_data = []

            for data in beverages.values():
                product_id += 1

                commit_data.append(
                    Product(
                        product_id=product_id,
                        product_name=data["product_name"],
                        unit_price=data["unit_price"],
                        category=data["category"],
                    )
                )

            for data in foods.values():
                product_id += 1

                commit_data.append(
                    Product(
                        product_id=product_id,
                        product_name=data["product_name"],
                        unit_price=data["unit_price"],
                        category=data["category"],
                    )
                )

            for data in sweets.values():
                product_id += 1

                commit_data.append(
                    Product(
                        product_id=product_id,
                        product_name=data["product_name"],
                        unit_price=data["unit_price"],
                        category=data["category"],
                    )
                )

            session.add_all(commit_data)
            session.commit()

        except Exception as e:
            print(f"(Products) Error: {e}")
            session.rollback()

        # Generate customer
        try:
            customers = generate_client(args.num_customers)
            customer_id = 0
            commit_data = []

            for data in customers.values():
                customer_id += 1

                commit_data.append(
                    Customer(
                        customer_id=customer_id,
                        first_name=data["first_name"],
                        last_name=data["last_name"],
                        email=data["email"],
                        loyalty_tier=data["loyalty_tier"],
                    )
                )

            session.add_all(commit_data)
            session.commit()

        except Exception as e:
            print(f"(Customers) Error: {e}")
            session.rollback()

        try:
            # Generate N = 500 orders
            # Generate random X items for each order and random quantity
            orders, order_items = generate_orders(
                n_orders=args.num_orders,
                n_customers=args.num_customers,
                n_regions=args.num_geo,
                n_products=args.num_products,
            )

            all_orders = list()
            all_order_items = list()

            for data in orders.values():
                all_orders.append(
                    OrderHeader(
                        order_id=data["order_id"],
                        customer_id=data["customer_id"],
                        branch_id=data["branch_id"],
                    )
                )

            for data in order_items.values():
                for el in data:
                    all_order_items.append(
                        OrderLineItem(
                            order_id=el["order_id"],
                            product_id=el["product_id"],
                            quantity=el["quantity"],
                        )
                    )

            session.add_all(all_orders)
            session.add_all(all_order_items)
            session.commit()

        except Exception as e:
            print(f"(Orders) Error: {e}")
            session.rollback()


if __name__ == "__main__":
    main()
