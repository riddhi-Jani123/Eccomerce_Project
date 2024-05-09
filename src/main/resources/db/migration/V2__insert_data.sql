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
