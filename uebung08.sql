-- TW01
select distinct CName, count(Id)
from country join tuser on country.Code = tuser.Country
group by country;

-- TW02
select distinct CName, count(country) AS AnzahlUser
from country left outer join tuser on country.Code = tuser.Country
group by CName, country
order by AnzahlUser desc;

-- TW03
select tuser.Id, Name
from tuser join tweet using (Id)
group by tweet.id
having count(tweet.id) > 1;

-- TW04
select Name, Location
from tuser 
where country = 'DE'
and Location = 'Limburg'; -- Limburg anstelle von Marburg

-- TW05
select follows.A AS 'Anhänger von Maria'
from follows join tuser on follows.B = tuser.Id
where name = 'Maria'; 

-- TW06
select tuser.id
from tuser
where tuser.id not in 
(select tweet.id from tweet);

-- TW07
-- intersect wird nicht unterstützt, deswegen alternative
select name, id
from(
	select name,id from tuser join follows on tuser.id = follows.A
	where follows.B = 5
	union all
	select distinct name, id 
	from tuser join follows on tuser.id = follows.B
	where follows.A = 5
) 
AS tbl GROUP BY tbl.ID HAVING COUNT(*) = 2
;


-- TW08
-- intersect wird nicht unterstützt, deswegen alternative
select name, id
from(
    select name, id 
	from tuser join follows on tuser.id = follows.B
	where follows.A = 5
) 
 AS TUser
 where TUser.id not in 
 (
	select id 
	from tuser join follows on tuser.id = follows.A
	where follows.B = 5
 )
;













