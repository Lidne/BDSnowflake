TRUNCATE TABLE sales,
customers,
sellers,
products,
stores,
pets,
suppliers
RESTART IDENTITY;

INSERT INTO
    customers (
        id,
        first_name,
        last_name,
        age,
        email,
        country,
        postal_code,
        pet_type,
        pet_name,
        pet_breed
    )
SELECT DISTINCT
    ON (sale_customer_id) sale_customer_id AS id,
    NULLIF(customer_first_name, '') AS first_name,
    NULLIF(customer_last_name, '') AS last_name,
    customer_age AS age,
    NULLIF(customer_email, '') AS email,
    NULLIF(customer_country, '') AS country,
    NULLIF(customer_postal_code, '') AS postal_code,
    NULLIF(customer_pet_type, '') AS pet_type,
    NULLIF(customer_pet_name, '') AS pet_name,
    NULLIF(customer_pet_breed, '') AS pet_breed
FROM mock_data
ORDER BY sale_customer_id, id;

INSERT INTO
    sellers (
        id,
        first_name,
        last_name,
        email,
        country,
        postal_code
    )
SELECT DISTINCT
    ON (sale_seller_id) sale_seller_id AS id,
    NULLIF(seller_first_name, '') AS first_name,
    NULLIF(seller_last_name, '') AS last_name,
    NULLIF(seller_email, '') AS email,
    NULLIF(seller_country, '') AS country,
    NULLIF(seller_postal_code, '') AS postal_code
FROM mock_data
ORDER BY sale_seller_id, id;

INSERT INTO
    products (
        id,
        name,
        category,
        price,
        quantity,
        weight,
        color,
        size,
        brand,
        material,
        description,
        rating,
        reviews,
        release_date,
        expiry_date
    )
SELECT DISTINCT
    ON (sale_product_id) sale_product_id AS id,
    NULLIF(product_name, '') AS name,
    NULLIF(product_category, '') AS category,
    product_price AS price,
    product_quantity AS quantity,
    product_weight AS weight,
    NULLIF(product_color, '') AS color,
    NULLIF(product_size, '') AS size,
    NULLIF(product_brand, '') AS brand,
    NULLIF(product_material, '') AS material,
    NULLIF(product_description, '') AS description,
    product_rating AS rating,
    product_reviews AS reviews,
    TO_DATE (
        NULLIF(product_release_date, ''),
        'MM/DD/YYYY'
    ) AS release_date,
    TO_DATE (
        NULLIF(product_expiry_date, ''),
        'MM/DD/YYYY'
    ) AS expiry_date
FROM mock_data
ORDER BY sale_product_id, id;

INSERT INTO
    stores (
        name,
        location,
        city,
        state,
        country,
        phone,
        email
    )
SELECT DISTINCT
    NULLIF(store_name, '') AS name,
    NULLIF(store_location, '') AS location,
    NULLIF(store_city, '') AS city,
    NULLIF(store_state, '') AS state,
    NULLIF(store_country, '') AS country,
    NULLIF(store_phone, '') AS phone,
    NULLIF(store_email, '') AS email
FROM mock_data;

INSERT INTO
    pets (category)
SELECT DISTINCT
    NULLIF(pet_category, '') AS category
FROM mock_data;

INSERT INTO
    suppliers (
        name,
        contact,
        email,
        phone,
        address,
        city,
        country
    )
SELECT DISTINCT
    NULLIF(supplier_name, '') AS name,
    NULLIF(supplier_contact, '') AS contact,
    NULLIF(supplier_email, '') AS email,
    NULLIF(supplier_phone, '') AS phone,
    NULLIF(supplier_address, '') AS address,
    NULLIF(supplier_city, '') AS city,
    NULLIF(supplier_country, '') AS country
FROM mock_data;

INSERT INTO
    sales (
        date,
        customer_id,
        seller_id,
        product_id,
        store_id,
        pet_id,
        supplier_id,
        quantity,
        total_price
    )
SELECT
    TO_DATE (
        NULLIF(sale_date, ''),
        'MM/DD/YYYY'
    ) AS date,
    sale_customer_id AS customer_id,
    sale_seller_id AS seller_id,
    sale_product_id AS product_id,
    NULL AS store_id,
    NULL AS pet_id,
    NULL AS supplier_id,
    sale_quantity AS quantity,
    sale_total_price AS total_price
FROM mock_data;