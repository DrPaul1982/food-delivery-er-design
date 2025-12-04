CREATE TABLE Customer (
    customer_id     INT PRIMARY KEY,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(100) NOT NULL,
    phone           VARCHAR(20),
    password_hash   VARCHAR(255) NOT NULL
);

CREATE TABLE Restaurant (
    restaurant_id   INT PRIMARY KEY,
    name            VARCHAR(150) NOT NULL,
    address         VARCHAR(255) NOT NULL,
    phone           VARCHAR(20),
    is_active       BOOLEAN NOT NULL
);

CREATE TABLE MenuItem (
    item_id         INT PRIMARY KEY,
    restaurant_id   INT NOT NULL,
    name            VARCHAR(150) NOT NULL,
    description     TEXT,
    price           DECIMAL(10,2) NOT NULL,
    is_available    BOOLEAN NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

CREATE TABLE "Order" (
    order_id        INT PRIMARY KEY,
    customer_id     INT NOT NULL,
    restaurant_id   INT NOT NULL,
    order_datetime  DATETIME NOT NULL,
    delivery_address VARCHAR(255) NOT NULL,
    status          VARCHAR(50) NOT NULL,
    total_amount    DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

CREATE TABLE OrderItem (
    order_id    INT NOT NULL,
    item_id     INT NOT NULL,
    quantity    INT NOT NULL,
    unit_price  DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES "Order"(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItem(item_id)
);

CREATE TABLE Payment (
    payment_id      INT PRIMARY KEY,
    order_id        INT UNIQUE NOT NULL,
    payment_method  VARCHAR(50) NOT NULL,
    payment_status  VARCHAR(50) NOT NULL,
    payment_datetime DATETIME,
    FOREIGN KEY (order_id) REFERENCES "Order"(order_id)
);
