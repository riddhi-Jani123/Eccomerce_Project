-- User table
CREATE TABLE IF NOT EXISTS users (
                       user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       email VARCHAR(100) UNIQUE NOT NULL,
                       first_name VARCHAR(50) NOT NULL,
                       last_name VARCHAR(50) NOT NULL,
                       mobile_number VARCHAR(15),
                       provider VARCHAR(15),
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- User Address Table
CREATE TABLE IF NOT EXISTS user_address (
            address_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            user_id BIGINT,
            address_line1 VARCHAR(100),
            address_line2 VARCHAR(100),
            city VARCHAR(50),
            state VARCHAR(50),
            country VARCHAR(50),
            postal_code VARCHAR(20),
            is_default BOOLEAN,
            FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Order Table
CREATE TABLE IF NOT EXISTS orders (
            order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            user_id BIGINT,
            address_id BIGINT,
            total_amount DECIMAL(10,2),
            status VARCHAR(20),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(user_id),
            FOREIGN KEY (address_id) REFERENCES user_address(address_id)
);


-- Brand Table
CREATE TABLE IF NOT EXISTS brand (
            brand_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            description TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Product Table
CREATE TABLE IF NOT EXISTS product (
            product_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            description TEXT,
            price DECIMAL(10,2),
            quantity INT,
            discount DECIMAL(10,2),
            brand_id BIGINT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- Product Color Table
CREATE TABLE IF NOT EXISTS product_color (
             product_color_id BIGINT AUTO_INCREMENT PRIMARY KEY,
             product_id BIGINT,
             color VARCHAR(50),
             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
             FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Product Size Table
CREATE TABLE IF NOT EXISTS product_size (
            product_size_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            product_id BIGINT,
            size VARCHAR(20),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Product Image Table
CREATE TABLE IF NOT EXISTS product_image (
             product_image_id BIGINT AUTO_INCREMENT PRIMARY KEY,
             product_id BIGINT,
             image BLOB,
             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
             updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
             FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Product Variant Table
CREATE TABLE IF NOT EXISTS product_variant (
            product_variant_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            product_id BIGINT,
            product_size_id BIGINT,
            product_color_id BIGINT,
            quantity INT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (product_id) REFERENCES product(product_id),
            FOREIGN KEY (product_size_id) REFERENCES product_size(product_size_id),
            FOREIGN KEY (product_color_id) REFERENCES product_color(product_color_id)
);

-- Similar Product Table
CREATE TABLE IF NOT EXISTS similar_products (
            id BIGINT AUTO_INCREMENT PRIMARY KEY,
            product_id BIGINT,
            similar_product_id BIGINT,
            FOREIGN KEY (product_id) REFERENCES product(product_id),
            FOREIGN KEY (similar_product_id) REFERENCES product(product_id)
);

-- Order Item Table
CREATE TABLE IF NOT EXISTS order_item (
            order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            order_id BIGINT,
            product_id BIGINT,
            quantity INT,
            price DECIMAL(10,2),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (order_id) REFERENCES orders(order_id),
            FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Cart Table
CREATE TABLE IF NOT EXISTS cart (
            cart_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            user_id BIGINT,
            product_id BIGINT,
            quantity INT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(user_id),
            FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Wishlist Table
CREATE TABLE IF NOT EXISTS wishlist (
            wishlist_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            user_id BIGINT,
            product_id BIGINT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users(user_id),
            FOREIGN KEY (product_id) REFERENCES product(product_id)
);

