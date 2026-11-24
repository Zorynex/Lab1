-- Таблица 1: Заказы
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    client_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    assembly_deadline DATE NOT NULL,
    additional_info TEXT,
    delivery_address TEXT NOT NULL
);

-- Таблица 2: Содержимое заказов
CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    packaging VARCHAR(100),

    CONSTRAINT pk_order_items
        PRIMARY KEY (order_id, product_id),

    CONSTRAINT fk_order_items_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

