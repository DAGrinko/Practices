/* Для начального отображения разделов */
SELECT s.name_section AS Section_name, COUNT(sp.product_id) AS Count_product 
FROM section s 
LEFT JOIN section_product sp ON s.section_id=sp.section_id 
WHERE sp.product_id IS NOT NULL 
ORDER BY COUNT(sp.product_id) DESC;

/* Для детального отображения раздела */
SELECT p.name_product AS Product_name, s.name_section AS Section_name, s.section_dicription AS Section_dicription, i.img_name 
FROM section s 
JOIN section_product sp ON s.section_id=sp.section_id 
JOIN product p ON p.product_id=sp.product_id 
JOIN image i ON p.product_id=i.product_id 
WHERE p.product_id IS NOT NULL LIMIT 12;

/* Для детального отображения товара */
SELECT p.name_product AS Product_name, i.img_name, s.name_section AS Section_name, p.price_product AS Product_price, p.price_product*p.discount AS Promo_code_price, p.discription_product AS Product_discrtption
FROM product p 
JOIN section_product sp ON p.product_id=sp.product_id 
JOIN section s ON s.section_id=sp.section_id 
JOIN image i ON p.product_id=i.product_id 
