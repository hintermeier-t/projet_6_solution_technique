CREATE DATABASE IF NOT EXISTS ocpizza;
USE ocpizza;

CREATE TABLE addresses (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    city_name VARCHAR(60) NOT NULL,
    zip_code VARCHAR(5) NOT NULL,
    street_label VARCHAR(100) NOT NULL,
    street_number VARCHAR(4) NOT NULL,
    complement VARHCAR(60) NOT NULL,
    phone_number VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE shops(
    id INTEGER UNSIGNED AUTO_INCREMENT,
    fk_address_id INTEGER,
    contact_mail VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (fk_address_id) REFERENCES addresses (id)
);

CREATE TABLE users (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    fk_address_id INTEGER,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password BINARY(64) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_address_id) REFERENCES addresses (id)
);

CREATE TABLE customers (
    id INTEGER,
    fk_favorite_shop_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users (id),
    FOREIGN KEY (fk_favorite_shop_id) REFERENCES shops (id)
);

CREATE TABLE employees (
    id INTEGER,
    fk_workplace_id INTEGER,
    occupation VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users (id),
    FOREIGN KEY (fk_workplace_id) REFERENCES shops (id)
);

CREATE TABLE ingredients (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    label VARCHAR (50),
    raw_unit_price DECIMAL,
    net_unit_price DECIMAL
);

CREATE TABLE pizzas (
    id INTEGER UNSIGNED AUTO_INCREMENT,
    label VARCHAR(30),
    raw_price DECIMAL,
    net_price DECIMAL,
    vegan BOOLEAN
);

CREATE TABLE drinkings (
    id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(50),
    raw_price DECIMAL,
    net_price DECIMAL,
    alcooholic BOOLEAN
);