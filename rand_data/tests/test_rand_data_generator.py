import pytest
import sys
import os

# Add parent directory to path to import rand_data_generator
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from rand_data_generator import generate_client, generate_products, generate_orders, generate_geo

def test_generate_client():
    n = 10
    clients = generate_client(n)
    assert len(clients) == n
    for client in clients.values():
        assert "first_name" in client
        assert "last_name" in client
        assert "email" in client
        assert "loyalty_tier" in client
        assert client["loyalty_tier"] in ["Gold", "Silver", "Bronze"]
        # Basic email check
        assert "@" in client["email"]
        assert "." in client["email"]

def test_generate_geo():
    n = 5
    geo = generate_geo(n)
    assert len(geo) == n
    for loc in geo.values():
        assert "country" in loc
        assert "Branch" in loc

def test_generate_products_beverages():
    n = 10
    products = generate_products(n, "Beverages")
    assert len(products) == n
    for prod in products.values():
        assert prod["category"] == 1
        assert prod["unit_price"] > 0
        assert isinstance(prod["product_name"], str)

def test_generate_products_foods():
    n = 10
    products = generate_products(n, "Foods")
    assert len(products) == n
    for prod in products.values():
        assert prod["category"] == 2
        assert prod["unit_price"] > 0

def test_generate_products_sweets():
    n = 10
    products = generate_products(n, "Sweets")
    assert len(products) == n
    for prod in products.values():
        assert prod["category"] == 3
        assert prod["unit_price"] > 0

def test_generate_orders():
    n_orders = 20
    n_customers = 50
    n_regions = 5
    n_products = 30
    
    orders, order_items = generate_orders(n_orders, n_customers, n_regions, n_products)
    
    assert len(orders) == n_orders
    assert len(order_items) == n_orders
    
    for order_id, order in orders.items():
        assert order["order_id"] == int(order_id)
        assert 1 <= order["customer_id"] <= n_customers
        assert 1 <= order["branch_id"] <= n_regions
        
    for order_id, items in order_items.items():
        assert len(items) >= 1
        for item in items:
            assert item["order_id"] == int(order_id)
            assert 1 <= item["product_id"] <= n_products
            assert item["quantity"] >= 1
