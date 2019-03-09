use dobro;
LOAD DATA LOCAL INFILE 'C://Users/Admin/PycharmProjects/dobro/Dobro/database/good_deeds.csv' INTO TABLE deeds
FIELDS TERMINATED BY ','
enclosed by '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(deadline,duration,org_name,description, place, timeline, event_type);



