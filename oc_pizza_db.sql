CREATE DATABASE IF NOT EXISTS ocpizza;
USE ocpizza;

CREATE TABLE addresses (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(60) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    street_label VARCHAR(100) NOT NULL,
    street_number VARCHAR(4) NOT NULL,
    complement VARCHAR(60) NOT NULL,
    phone_number VARCHAR(10)
);

CREATE TABLE shops(
    id INTEGER UNSIGNED AUTO_INCREMENT,
    fk_address_id INTEGER,
    contact_mail VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (fk_address_id) REFERENCES addresses(id)
);

CREATE TABLE users (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fk_address_id INTEGER UNSIGNED,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash BINARY(64) NOT NULL,
    FOREIGN KEY (fk_address_id) REFERENCES addresses(id)
);

CREATE TABLE customers (
    id INTEGER UNSIGNED PRIMARY KEY,
    fk_favorite_shop_id INTEGER,
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (fk_favorite_shop_id) REFERENCES shops (id)
);

CREATE TABLE employees (
    id INTEGER UNSIGNED PRIMARY KEY,
    fk_workplace_id INTEGER,git add OBJECT
    occupation VARCHAR(30),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (fk_workplace_id) REFERENCES shops(id)
);

CREATE TABLE ingredients (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(50),
    raw_price DECIMAL,
    net_price DECIMAL
);

CREATE TABLE pizzas (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(30),
    raw_price DECIMAL,
    net_price DECIMAL,
    vegan BOOLEAN
);

CREATE TABLE compositions (
    fk_pizza_id INTEGER UNSIGNED PRIMARY KEY,
    fk_ingredient_id INTEGER UNSIGNED PRIMARY KEY,
    quantity INTEGER,
    FOREIGN KEY (pizza_id) REFERENCES pizzas(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE drinkings (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(50),
    raw_price DECIMAL,
    net_price DECIMAL,
    alcooholic BOOLEAN
);

CREATE TABLE ingredientStocks (
    shop_id INTEGER UNSIGNED PRIMARY KEY,
    ingredient_id INTEGER UNSIGNED PRIMARY KEY,
    quantity INTEGER,
    FOREIGN KEY (shop_id) REFERENCES shops(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE drinkingsStocks (
    shop_id INTEGER UNSIGNED PRIMARY KEY,
    drinkings_id INTEGER UNSIGNED PRIMARY KEY,
    quantity INTEGER,
    FOREIGN KEY (shop_id) REFERENCES shops(id),
    FOREIGN KEY (drinkings_id) REFERENCES drinkings(id)
);

CREATE TABLE drinkingLines (
    cmd_id INTEGER UNSIGNED PRIMARY KEY,
    item_id INTEGER UNSIGNED PRIMARY KEY,
    quantity TINYINT UNSIGNED,
    total_price DECIMAL,
    FOREIGN KEY (cmd_id) REFERENCES commands(id),
    FOREIGN KEY (item_id) REFERENCES drinkings(id)
);

CREATE TABLE pizzaLines (
    cmd_id INTEGER UNSIGNED PRIMARY KEY,
    item_id INTEGER UNSIGNED PRIMARY KEY,
    quantity TINYINT UNSIGNED,
    total_price DECIMAL,
    FOREIGN KEY (cmd_id) REFERENCES commands(id),
    FOREIGN KEY (item_id) REFERENCES pizzas(id)
);

CREATE TABLE commands (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    client_id INTEGER UNSIGNED,
    raw_price DECIMAL,
    net_price DECIMAL,
    date_cmd DATETIME
    FOREIGN KEY (client_id) REFERENCES customers(id)
);

CREATE TABLE bills (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fk_order_id INTEGER NOT NULL,
    payment_method ENUM('test','truc'),
    FOREIGN KEY (fk_order_id) REFERENCES commands(id)
)

CREATE TABLE expeditions (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    client_id INTEGER UNSIGNED,
    bill_id INTEGER UNSIGNED,
    deliverer_id INTEGER UNSIGNED,
    paid_status BOOLEAN,
    order_date DATETIME,
    delivery_date DATETIME,
    delivery_mehod ENUM,
    FOREIGN KEY (client_id) REFERENCES customers(id),
    FOREIGN KEY (bill_id) REFERENCES bills(id),
    FOREIGN KEY (deliverer_id) REFERENCES employees(id)
);