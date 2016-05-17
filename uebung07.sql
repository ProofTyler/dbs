-- DOZ01
select name, vorname, fbname
from doz join fb using(fbkurz);

-- DOZ02
select name, vorname
from doz left outer join fb using(fbkurz)
where fbname is null;

-- DOZ03
select name, vorname, fbname
from doz left outer join fb using(fbkurz);

-- DOZ04
select fbname, name, vorname 
from doz right outer join fb using(fbkurz);

-- DOZ05
select fbname, count(doz.fbkurz) 
from fb left join doz using(fbkurz)
group by fbkurz;

-- DOZ06
select fbkurz from doz;
select fbname 
from fb left join doz using(fbkurz)
where doz.fbkurz is null;

-- DOZ07
