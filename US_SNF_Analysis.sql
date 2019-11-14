use snf;
select * from provider_info
limit 5;

#Inspect dataset, get number of rows/columns
SELECT count(`COLUMN_NAME`)
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='snf' 
    AND `TABLE_NAME`='provider_info';
#count of columns = 86
select count(*) from provider_info;
#count of rows = 13511

select count(*) from provider_info
where `Provider State` like ("IL");
#count of IL providers = 647


select count(*) from provider_info 
where `Provider City` like "%Chicago%"
and  `Provider State` like ("IL");
#count of Chicago Providers = 76.  Wildcards used because here is some variation in city input like "south chicago" etc.  IL filter pulled out one IN entry which would be there otherwise. 
select `Ownership Type`, `Provider Name`, count(*)
from provider_info
where `Provider City` like "%Chicago%"
and  `Provider State` like ("IL")
group by `Ownership Type`;
#For profit - Corporation	36
#For profit - Individual	12
#Non profit - Corporation	9
#For profit - Partnership	8
#For profit - Limited Liability company	5
#Non profit - Church related	5
#Non profit - Other	1


#look at size by number of beds
select `Provider Name`, `Number of Certified Beds`
from provider_info
where `Provider City` like "%Chicago%"
and  `Provider State` like ("IL")
order by `Number of Certified Beds` desc;
#largest: BRIA OF FOREST EDGE	328; smallest: MERCY CIRCLE	23
select avg(`Number of Certified Beds`)
from provider_info
where `Provider City` like "%Chicago%"
and  `Provider State` like ("IL");
#average size in Chicago: 171.7500 beds
select avg(`Number of Certified Beds`)
from provider_info
where `Provider State` like ("IL");
#average size in IL: 126.9552 beds
select avg(`Number of Certified Beds`)
from provider_info;
#national average: 111.4079 beds

#Inspect dataset, get number of rows/columns
SELECT `COLUMN_NAME`
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='snf' 
    AND `TABLE_NAME`='deficiencies_displayed_on_nursing_home_compare___cycle_1';
    
alter table deficiencies_displayed_on_nursing_home_compare___cycle_1 rename to deficiencies;
#Inspect dataset, get number of rows/columns
SELECT `COLUMN_NAME`
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='snf' 
    AND `TABLE_NAME`='deficiencies';
    
select `Provider Name`, count(`Deficiency Tag Number`)
from deficiencies
group by `Provider Name`
order by count(`Deficiency Tag Number`) desc;
#top result country: MILLER'S MERRY MANOR	144
select `Provider Name`, count(`Deficiency Tag Number`)
from deficiencies
where `Provider State` in ("IL")
group by `Provider Name`
order by count(`Deficiency Tag Number`) desc;
#top result IL: APERION CARE CAPITOL	46 and GENERATIONS AT LINCOLN	46

#`Provider Name`, `Overall Rating`
select * from provider_info
where `Provider City` like "%Chicago%"
and  `Provider State` like ("IL")
and `Overall Rating` in (1)
order by `Provider Name`;






    

    
