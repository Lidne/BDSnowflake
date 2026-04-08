DROP TABLE IF EXISTS sales;

DROP TABLE IF EXISTS customers;

DROP TABLE IF EXISTS sellers;

DROP TABLE IF EXISTS products;

DROP TABLE IF EXISTS stores;

DROP TABLE IF EXISTS pets;

DROP TABLE IF EXISTS suppliers;
-- чтобы не заморачиваться с ALTER

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    age INTEGER,
    email VARCHAR,
    country VARCHAR,
    postal_code VARCHAR,
    pet_type VARCHAR,
    pet_name VARCHAR,
    pet_breed VARCHAR
);

CREATE TABLE sellers (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    country VARCHAR,
    postal_code VARCHAR
);

CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name VARCHAR,
    category VARCHAR,
    price NUMERIC(10, 2),
    quantity INTEGER,
    weight NUMERIC(10, 2),
    color VARCHAR,
    size VARCHAR,
    brand VARCHAR,
    material VARCHAR,
    description TEXT,
    rating NUMERIC(3, 1),
    reviews INTEGER,
    release_date DATE,
    expiry_date DATE
);

CREATE TABLE stores (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    location VARCHAR,
    city VARCHAR,
    state VARCHAR,
    country VARCHAR,
    phone VARCHAR,
    email VARCHAR
);

CREATE TABLE pets (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category VARCHAR
);

CREATE TABLE suppliers (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    contact VARCHAR,
    email VARCHAR,
    phone VARCHAR,
    address VARCHAR,
    city VARCHAR,
    country VARCHAR
);

CREATE TABLE sales (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date DATE,
    customer_id INTEGER REFERENCES customers (id),
    seller_id INTEGER REFERENCES sellers (id),
    product_id INTEGER REFERENCES products (id),
    store_id INTEGER REFERENCES stores (id),
    pet_id INTEGER REFERENCES pets (id),
    supplier_id INTEGER REFERENCES suppliers (id),
    quantity INTEGER,
    total_price NUMERIC(10, 2)
);

CREATE INDEX idx_sales_customer_id ON sales (customer_id);

CREATE INDEX idx_sales_seller_id ON sales (seller_id);

CREATE INDEX idx_sales_product_id ON sales (product_id);

CREATE INDEX idx_sales_store_id ON sales (store_id);

CREATE INDEX idx_sales_pet_id ON sales (pet_id);

CREATE INDEX idx_sales_supplier_id ON sales (supplier_id);