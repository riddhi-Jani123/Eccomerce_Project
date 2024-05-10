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




-- Insert products associated with Nike
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Nike Air Max 270', 'Nike Air Max 270 is a stylish and comfortable sneaker.', 150.00, 100, 0.0, 1);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Nike Dri-FIT T-Shirt', 'Nike Dri-FIT T-Shirt is a lightweight and breathable workout shirt.', 30.00, 200, 0.0, 1);

-- Insert products associated with Adidas
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Adidas Ultraboost', 'Adidas Ultraboost is a popular running shoe with responsive cushioning.', 180.00, 150, 0.0, 2);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Adidas Essentials Hoodie', 'Adidas Essentials Hoodie is a comfortable and stylish hoodie for everyday wear.', 50.00, 100, 0.0, 2);

-- Insert products associated with Under Armour
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Under Armour Tech 2.0 Shorts', 'Under Armour Tech 2.0 Shorts are lightweight and sweat-wicking shorts for workouts.', 25.00, 120, 0.0, 3);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Under Armour Charged Assert 9', 'Under Armour Charged Assert 9 is a durable and cushioned running shoe.', 70.00, 100, 0.0, 3);

-- Insert products associated with Puma
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Puma Future Rider Twofold', 'Puma Future Rider Twofold is a retro-style sneaker with a modern twist.', 80.00, 80, 0.0, 4);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Puma Essentials Fleece Joggers', 'Puma Essentials Fleece Joggers are soft and comfortable joggers for lounging.', 45.00, 90, 0.0, 4);


-- Insert products associated with Lululemon
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Lululemon Align Pant II', 'Lululemon Align Pant II is a high-rise, versatile yoga pant made with Nulu™ fabric.', 98.00, 120, 0.0, 5);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Lululemon Define Jacket', 'Lululemon Define Jacket is a lightweight, sweat-wicking jacket perfect for warm-ups and cool-downs.', 118.00, 80, 0.0, 5);

-- Insert products associated with The North Face
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('The North Face Venture 2 Jacket', 'The North Face Venture 2 Jacket is a waterproof, breathable jacket designed for outdoor adventures.', 99.00, 150, 0.0, 6);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('The North Face Thermoball Eco Jacket', 'The North Face Thermoball Eco Jacket is a lightweight, packable jacket insulated with eco-friendly materials.', 199.00, 80, 0.0, 6);

-- Insert products associated with Levi Strauss & Co.
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Levi''s 501 Original Fit Jeans', 'Levi''s 501 Original Fit Jeans are classic straight-leg jeans with a button fly.', 69.50, 120, 0.0, 7);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Levi''s Sherpa Trucker Jacket', 'Levi''s Sherpa Trucker Jacket is a warm and stylish denim jacket lined with sherpa.', 98.00, 80, 0.0, 7);

-- Insert products associated with H&M
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('H&M Slim Fit Chinos', 'H&M Slim Fit Chinos are versatile trousers with a slim silhouette.', 29.99, 150, 0.0, 8);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('H&M Oversized Hoodie', 'H&M Oversized Hoodie is a cozy and stylish hoodie with an oversized fit.', 39.99, 100, 0.0, 8);

-- Insert products associated with Zara
INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Zara Basic T-Shirt', 'Zara Basic T-Shirt is a soft and comfortable essential for everyday wear.', 12.99, 200, 0.0, 9);

INSERT INTO product (name, description, price, quantity, discount, brand_id)
VALUES ('Zara High Waisted Jeans', 'Zara High Waisted Jeans are trendy jeans designed to flatter your figure.', 49.99, 120, 0.0, 9);


INSERT INTO e_commerce.product_image (product_id, image) VALUES
 (4, LOAD_FILE('/var/lib/mysql-files/Adidas Essentials Hoodie.jpeg')),
 (3, LOAD_FILE('/var/lib/mysql-files/Adidas Ultraboost.jpeg')),
 (1, LOAD_FILE('/var/lib/mysql-files/Nike-270.jpeg')),
 (2, LOAD_FILE('/var/lib/mysql-files/Nike Dri-FIT T-Shirt.png')),
 (8, LOAD_FILE('/var/lib/mysql-files/Puma Essentials Fleece Joggers.jpeg')),
 (7, LOAD_FILE('/var/lib/mysql-files/Puma Future Rider Twofold.jpeg')),
 (6, LOAD_FILE('/var/lib/mysql-files/Under Armour Charged Assert 9.jpeg')),
 (5, LOAD_FILE('/var/lib/mysql-files/Under Armour Tech 2.0 Shorts.jpeg')),
 (9, LOAD_FILE('/var/lib/mysql-files/Lululemon Align Pant II.jpeg')),
 (10, LOAD_FILE('/var/lib/mysql-files/Lululemon Define Jacket.jpeg')),
 (11, LOAD_FILE('/var/lib/mysql-files/The North Face Venture 2 Jacket.jpeg')),
 (12, LOAD_FILE('/var/lib/mysql-files/The North Face Thermoball Eco Jacket.jpeg')),
 (13, LOAD_FILE('/var/lib/mysql-files/Levis 501 Original Fit Jeans.jpeg')),
 (14, LOAD_FILE('/var/lib/mysql-files/Levis Sherpa Trucker Jacket.jpeg')),
 (15, LOAD_FILE('/var/lib/mysql-files/H&M Slim Fit Chinos.jpeg')),
 (16, LOAD_FILE('/var/lib/mysql-files/H&M Oversized Hoodie.jpeg')),
 (17, LOAD_FILE('/var/lib/mysql-files/Zara Basic T-Shirt.jpeg')),
 (18, LOAD_FILE('/var/lib/mysql-files/Zara High Waisted Jeans.jpeg'));



