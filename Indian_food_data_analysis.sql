select * from indian_food;

/* Interpreting the taste palette*/

select case when flavor_profile='-1' then 'tasteless' else flavor_profile end flavor,
count(*) as no_of_dishes  from indian_food group by flavor_profile order by no_of_dishes desc;

-- INFERENCE:
-- People mostly preferred spicy food

/*vegetarian vs Non-Vegetarian*/

select diet,count(*) as count from indian_food group by diet;

-- INFERENCE:
-- A majority of people are vegetarians, only 11% of the total population data are non-vegetarians

/* total duration(prep_time+cook_time) vs course and diet*/

select course,diet,avg(prep_time+cook_time) as avg_total_duration from indian_food
group by course,diet order by avg_total_duration desc;

-- INFERENCE:
-- Non-vegetarian starter dishes have maximum average prep+cook time.

/*flavor_profile vs region*/

select case when region='-1' or region=''  then 'Others' else region end region,
case when flavor_profile='-1' then 'tasteless' else flavor_profile end flavor,
count(flavor_profile) as count from indian_food
group by region,flavor_profile order by count desc;

-- INFERENCE:
-- North,West and South people majorly prefer spicy food

/*STATE WISE MOST PREFFERD TYPE OF DIET*/

select case when state='-1' then 'Unknown' else state end state,
diet,count(*) as count from indian_food
group by state,diet order by state;
 -- INFERENCE:
 -- People from Assam prefer veg and non-veg dishes almost equally.
 -- People of Gujarat are only vegetarians as per the dataset.

/*DIET BASED ON REGION*/

select case when region='-1' or region=''  then 'Others' else region end region,
diet,count(*) as count from indian_food group by region,diet 
order by count desc;

-- INFERENCE:
-- Regions West,South,North and East have majority of vegetarians.

/*names of the dishes along with the ingredients used which consume minimum time for preparation under each course type*/

select course,name,ingredients,prep_time from indian_food group by course having min(prep_time);
