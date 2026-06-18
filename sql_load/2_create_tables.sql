CREATE TABLE products (
    item_code BIGINT PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    category_code INTEGER NOT NULL,
    category_name VARCHAR(30) NOT NULL
);

CREATE TABLE loss_rates (
    item_code BIGINT PRIMARY KEY REFERENCES products(item_code),
    item_name VARCHAR(50) NOT NULL,
    loss_rate_pct NUMERIC(5,2) NOT NULL
);

CREATE TABLE prices (
    price_date DATE NOT NULL,
    item_code BIGINT NOT NULL REFERENCES products(item_code),
    wholesale_price NUMERIC(8,2) NOT NULL,
    PRIMARY KEY (item_code, price_date)
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    sale_time TIME NOT NULL,
    item_code BIGINT NOT NULL REFERENCES products(item_code),
    quantity_kg NUMERIC(10,3) NOT NULL,
    unit_price NUMERIC(8,2) NOT NULL,
    sale_type VARCHAR(10) NOT NULL,
    is_discount BOOLEAN NOT NULL
);