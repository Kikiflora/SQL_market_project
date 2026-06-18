COPY products 
FROM '/home/aron/Важное/SQL_project/csv_files/annex1.csv' DELIMITER ',' CSV HEADER;
COPY loss_rates 
FROM '/home/aron/Важное/SQL_project/csv_files/annex4.csv' DELIMITER ',' CSV HEADER;
COPY prices 
FROM '/home/aron/Важное/SQL_project/csv_files/annex3.csv' DELIMITER ',' CSV HEADER;
COPY sales (sale_date, sale_time, item_code, quantity_kg, unit_price, sale_type, is_discount)
FROM '/home/aron/Важное/SQL_project/csv_files/annex2.csv' DELIMITER ',' CSV HEADER;