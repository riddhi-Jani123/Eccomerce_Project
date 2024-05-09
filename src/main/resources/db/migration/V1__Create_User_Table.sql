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


CREATE TABLE IF NOT EXISTS brand (
            brand_id BIGINT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            description TEXT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);


INSERT INTO brand (name, description) VALUES ('Nike', 'Nike is a multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services.');
INSERT INTO brand (name, description) VALUES ('Adidas', 'Adidas AG is a multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing, and accessories.');
INSERT INTO brand (name, description) VALUES ('Under Armour', 'Under Armour, Inc. is an American company that manufactures footwear, sports, and casual apparel.');
INSERT INTO brand (name, description) VALUES ('Puma', 'Puma SE, branded as Puma, is a German multinational corporation that designs and manufactures athletic and casual footwear, apparel, and accessories.');
INSERT INTO brand (name, description) VALUES ('Lululemon', 'Lululemon Athletica Inc., styled as lululemon athletica, is a Canadian athletic apparel retailer.');
INSERT INTO brand (name, description) VALUES ('The North Face', 'The North Face is an American outdoor recreation product company. The company produces outdoor clothing, footwear, and equipment.');
INSERT INTO brand (name, description) VALUES ('Columbia Sportswear', 'Columbia Sportswear Company is an American company that manufactures and distributes outerwear, sportswear, and footwear.');
INSERT INTO brand (name, description) VALUES ('Levi Strauss & Co.', 'Levi Strauss & Co. is an American clothing company known worldwide for its Levi''s brand of denim jeans.');
INSERT INTO brand (name, description) VALUES ('H&M', 'Hennes & Mauritz AB is a Swedish multinational clothing-retail company.');
INSERT INTO brand (name, description) VALUES ('Zara', 'Zara is a Spanish apparel retailer based in Arteixo in Galicia, Spain.');