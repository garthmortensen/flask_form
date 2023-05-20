-- create schema
DROP TABLE IF EXISTS calendar_year;
CREATE TABLE calendar_year (
    year_id INTEGER PRIMARY KEY,
    year INTEGER,
    description TEXT
);

DROP TABLE IF EXISTS ingredient;
CREATE TABLE ingredient (
    ingredient_id INTEGER PRIMARY KEY,
    ingredient TEXT,
    description TEXT,
    seller TEXT,
    season TEXT,
    year_id INTEGER,
    FOREIGN KEY (year_id) REFERENCES calendar_year(year_id)
);

DROP TABLE IF EXISTS menu_item;
CREATE TABLE menu_item (
    menu_item_id INTEGER PRIMARY KEY,
    buyer TEXT,
    description TEXT,
    step TEXT,
    season TEXT,
    year_id INTEGER,
    FOREIGN KEY (year_id) REFERENCES calendar_year(year_id)
);

-- seed tables
-- Insert into calendar_year table
INSERT INTO calendar_year (year_id, year, description)
VALUES
    (1, 2020, 'Year 2020'),
    (2, 2021, 'Year 2021'),
    (3, 2022, 'Year 2022'),
    (4, 2023, 'Year 2023'),
    (5, 2024, 'Year 2024'),
    (6, 2025, 'Year 2025'),
    (7, 2026, 'Year 2026'),
    (8, 2027, 'Year 2027'),
    (9, 2028, 'Year 2028'),
    (10, 2029, 'Year 2029')
;

-- Insert into ingredient table
INSERT INTO ingredient (ingredient_id, ingredient, description, seller, season, year_id)
VALUES
    (1, 'Tomato', 'Fresh red tomatoes', 'Local Farm', 'Summer', 2),
    (2, 'Chicken', 'Boneless chicken breast', 'Butcher Shop', 'All Seasons', 3),
    (3, 'Lettuce', 'Crisp green lettuce', 'Supermarket', 'All Seasons', 4),
    (4, 'Cheese', 'Mozzarella cheese', 'Dairy Farm', 'All Seasons', 2),
    (5, 'Onion', 'Yellow onion', 'Local Farm', 'Fall', 3),
    (6, 'Pasta', 'Spaghetti pasta', 'Supermarket', 'All Seasons', 4),
    (7, 'Beef', 'Lean beef steak', 'Butcher Shop', 'Winter', 5),
    (8, 'Fish', 'Fresh cod fish', 'Seafood Market', 'Spring', 6),
    (9, 'Potato', 'Russet potato', 'Local Farm', 'Fall', 4),
    (10, 'Garlic', 'Fresh garlic cloves', 'Supermarket', 'All Seasons', 3)
;

-- Insert into menu_item table
INSERT INTO menu_item (menu_item_id, buyer, description, step, season, year_id)
VALUES
    (1, 'John', 'Grilled Salmon', 'Grill salmon to perfection', 'Summer', 2),
    (2, 'Jane', 'Margherita Pizza', 'Bake pizza in wood-fired oven', 'All Seasons', 3),
    (3, 'Mark', 'Chicken Parmesan', 'Bread chicken and fry until golden', 'Winter', 4),
    (4, 'Sarah', 'Shrimp Scampi', 'Sauté shrimp in garlic butter sauce', 'Spring', 5),
    (5, 'Robert', 'Beef Stir-Fry', 'Stir-fry beef with vegetables', 'All Seasons', 6),
    (6, 'Alice', 'Caprese Salad', 'Combine tomatoes, mozzarella, and basil', 'Summer', 4),
    (7, 'Michael', 'Vegetable Curry', 'Simmer vegetables in spicy curry sauce', 'Fall', 3),
    (8, 'Emily', 'Steak with Mashed Potatoes', 'Grill steak and prepare creamy mashed potatoes', 'Winter', 2),
    (9, 'Daniel', 'Pasta Primavera', 'Cook pasta and toss with mixed vegetables', 'Spring', 5),
    (10, 'Olivia', 'Lobster Roll', 'Prepare lobster meat and assemble in a roll', 'Summer', 2)
;
