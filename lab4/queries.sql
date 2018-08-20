-- COMP9311 18s2 Lab 04 Exercises

-- Q1. What beers are made by Toohey's?

create or replace view Q1 as
select beers.name
from   brewers,beers
where  brewers.id=beers.brewer and brewers.name ='Toohey''s'
;

-- Q2. Show beers with headings "Beer", "Brewer".

create or replace view Q2(Beer,Brewer) as
select beers.name, brewers.name
from   brewers,beers
where  brewers.id=beers.brewer
;

-- Q3. Find the brewers whose beers John likes.

create or replace view Q3  as
select brewers.name
from   brewers,likes,drinkers,beers
where  drinkers.name = 'John' and drinkers.id = likes.drinker and likes.beer = beers.id and beers.brewer= brewers.id
;

-- Q4. How many different beers are there?

create or replace view Q4(beers) as
select count(*)
from beers
;

-- Q5. How many different brewers are there?

create or replace view Q5 as
select count(*)
from   brewers
;

-- Q6. Find pairs of beers by the same manufacturer
--     (but no pairs like (a,b) and (b,a), and no (a,a))

create or replace view Q6 (beer1,beer2)as
select br1.name, br2.name
from   beers as br1,beers as br2
where  br1.name > br2.name and br1.brewer = br2.brewer
;

-- Q7. How many beers does each brewer make?

create or replace view Q7(brewer,nbeers) as
select brewers.name, count(*) from brewers,beers where beers.brewer= brewers.id group by brewers.name order by brewers.name;
;

-- Q8. Which brewer makes the most beers?

create or replace view Q8 as
select brewer from q7 where nbeers = (select max(nbeers) from q7);
;

-- Q9. Beers that are the only one by their brewer.

create or replace view Q9 as
select ...
from   ...
where  ...
;

-- Q10. Beers sold at bars where John drinks.

create or replace view Q10 as
select ...
from   ...
where  ...
;

-- Q11. Bars where either Gernot or John drink.

create or replace view Q11 as
select ...
from   ...
where  ...
;

-- Q12. Bars where both Gernot and John drink.

create or replace view Q12 as
select ...
from   ...
where  ...
;

-- Q13. Bars where John drinks but Gernot doesn't

create or replace view Q13 as
select ...
from   ...
where  ...
;

-- Q14. What is the most expensive beer?

create or replace view Q14 as
select ...
from   ...
where  ...
;

-- Q15. Find bars that serve New at the same price
--      as the Coogee Bay Hotel charges for VB.

create or replace view Q15 as
select ...
from   ...
where  ...
;

-- Q16. Find the average price of common beers
--      ("common" = served in more than two hotels).

create or replace view Q16 as
select ...
from   ...
where  ...
;

-- Q17. Which bar sells 'New' cheapest?

create or replace view Q17 as
select ...
from   ...
where  ...
;

-- Q18. Which bar is most popular? (Most drinkers)

create or replace view Q18 as
select ...
from   ...
where  ...
;

-- Q19. Which bar is least popular? (May have no drinkers)

create or replace view Q19 as
select ...
from   ...
where  ...
;

-- Q20. Which bar is most expensive? (Highest average price)

create or replace view Q20 as
select ...
from   ...
where  ...
;

-- Q21. Which beers are sold at all bars?

create or replace view Q21 as
select ...
from   ...
where  ...
;

-- Q22. Price of cheapest beer at each bar?

create or replace view Q22 as
select ...
from   ...
where  ...
;

-- Q23. Name of cheapest beer at each bar?

create or replace view Q23 as
select ...
from   ...
where  ...
;

-- Q24. How many drinkers are in each suburb?

create or replace view Q24 as
select ...
from   ...
where  ...
;

-- Q25. How many bars in suburbs where drinkers live?
--      (Must include suburbs with no bars)

create or replace view Q25 as
select ...
from   ...
where  ...
;