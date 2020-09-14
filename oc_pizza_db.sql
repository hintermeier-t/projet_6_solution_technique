CREATE DATABASE IF NOT EXISTS ocpizza;
USE ocpizza;

CREATE TABLE addresses (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(60) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    street_label VARCHAR(100) NOT NULL,
    street_number VARCHAR(4) NOT NULL,
    complement VARCHAR(60) NULL,
    phone_number VARCHAR(10)
)ENGINE = InnoDB;

CREATE TABLE shops(
    id INTEGER UNSIGNED AUTO_INCREMENT,
    fk_address_id INTEGER UNSIGNED,
    contact_mail VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (fk_address_id) REFERENCES addresses(id)
)ENGINE = InnoDB;

CREATE TABLE users (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fk_address_id INTEGER UNSIGNED,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash BINARY(64) NOT NULL,
    FOREIGN KEY (fk_address_id) REFERENCES addresses(id)
)ENGINE = InnoDB;

CREATE TABLE customers (
    id INTEGER UNSIGNED PRIMARY KEY,
    fk_favorite_shop_id INTEGER UNSIGNED,
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (fk_favorite_shop_id) REFERENCES shops (id)
)ENGINE = InnoDB;

CREATE TABLE employees (
    id INTEGER UNSIGNED PRIMARY KEY,
    fk_workplace_id INTEGER UNSIGNED,
    occupation VARCHAR(30),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (fk_workplace_id) REFERENCES shops(id)
)ENGINE = InnoDB;

CREATE TABLE ingredients (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(50),
    raw_price DECIMAL (6,2),
    net_price DECIMAL (6,2)
)ENGINE = InnoDB;

CREATE TABLE pizzas (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(30),
    raw_price DECIMAL (6,2),
    net_price DECIMAL (6,2),
    vegan BIT
)ENGINE = InnoDB;

CREATE TABLE compositions (
    fk_pizza_id INTEGER UNSIGNED,
    fk_ingredient_id INTEGER UNSIGNED,
    quantity INTEGER,
    FOREIGN KEY (fk_pizza_id) REFERENCES pizzas(id),
    FOREIGN KEY (fk_ingredient_id) REFERENCES ingredients(id),
    PRIMARY KEY (fk_ingredient_id, fk_pizza_id)
)ENGINE = InnoDB;

CREATE TABLE drinkings (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(50),
    raw_price DECIMAL (6,2),
    net_price DECIMAL (6,2),
    alcooholic BIT
)ENGINE = InnoDB;

CREATE TABLE ingredientStocks (
    fk_shop_id INTEGER UNSIGNED,
    fk_ingredient_id INTEGER UNSIGNED,
    quantity INTEGER,
    FOREIGN KEY (fk_shop_id) REFERENCES shops(id),
    FOREIGN KEY (fk_ingredient_id) REFERENCES ingredients(id),
    PRIMARY KEY (fk_ingredient_id, fk_shop_id)
)ENGINE = InnoDB;

CREATE TABLE drinkingsStocks (
    fk_shop_id INTEGER UNSIGNED,
    fk_drinkings_id INTEGER UNSIGNED,
    quantity INTEGER,
    FOREIGN KEY (fk_shop_id) REFERENCES shops(id),
    FOREIGN KEY (fk_drinkings_id) REFERENCES drinkings(id),
    PRIMARY KEY (fk_drinkings_id, fk_shop_id)
)ENGINE = InnoDB;

CREATE TABLE commands (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fk_client_id INTEGER UNSIGNED,
    raw_price DECIMAL (6,2),
    net_price DECIMAL (6,2),
    date_cmd DATETIME,
    FOREIGN KEY (fk_client_id) REFERENCES customers(id)
)ENGINE = InnoDB;

CREATE TABLE drinkingLines (
    fk_cmd_id INTEGER UNSIGNED,
    fk_item_id INTEGER UNSIGNED,
    quantity TINYINT UNSIGNED,
    total_price DECIMAL (6,2),
    FOREIGN KEY (fk_cmd_id) REFERENCES commands(id),
    FOREIGN KEY (fk_item_id) REFERENCES drinkings(id),
    PRIMARY KEY (fk_item_id, fk_cmd_id)
)ENGINE = InnoDB;

CREATE TABLE pizzaLines (
    fk_cmd_id INTEGER UNSIGNED,
    fk_item_id INTEGER UNSIGNED,
    quantity TINYINT UNSIGNED,
    total_price DECIMAL (6,2),
    FOREIGN KEY (fk_cmd_id) REFERENCES commands(id),
    FOREIGN KEY (fk_item_id) REFERENCES pizzas(id),
    PRIMARY KEY (fk_item_id, fk_cmd_id)
)ENGINE = InnoDB;

CREATE TABLE bills (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fk_order_id INTEGER UNSIGNED NOT NULL,
    payment_method ENUM('CB','Espèces', 'Chèque', 'Paiement en ligne'),
    FOREIGN KEY (fk_order_id) REFERENCES commands(id)
)ENGINE = InnoDB;

CREATE TABLE expeditions (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fk_client_id INTEGER UNSIGNED,
    fk_bill_id INTEGER UNSIGNED,
    fk_deliverer_id INTEGER UNSIGNED,
    paid_status BIT,
    order_date DATETIME,
    delivery_date DATETIME,
    delivery_mehod ENUM('Livraison','A Emporter'),
    FOREIGN KEY (fk_client_id) REFERENCES customers(id),
    FOREIGN KEY (fk_bill_id) REFERENCES bills(id),
    FOREIGN KEY (fk_deliverer_id) REFERENCES employees(id)
)ENGINE = InnoDB;

