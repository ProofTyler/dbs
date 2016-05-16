-- LIT11
select Titel, Verlag, Ort, Jahr from buch
where Titel LIKE 'Datenbank%';

-- LIT12
select Titel, Jahr, Name, Vorname 
  from Autor join BA using (AId)
			 join Buch using (BId)
  where Name LIKE 'Da%'
  order by Name,Vorname;
  
-- LIT13
select Name,Vorname, count(*) AS Anzahl
from autor join BA using (AId)
		   join Buch using (BId)
group by BId 
having Anzahl > 2
order by Name,Vorname;

-- LIT14
select BId, Titel, ISBN, count(*) AS Anzahl_Autoren
from Buch join BA using(BId)
group by BId;

-- LIT15
select Verlag, Jahr, Titel, BId, ISBN, Name
from buch join BA using(BId)
		  join Autor using(AId)
where Verlag in ('Springer','Oldenbourg','Vieweg','Teubner')
order by Verlag,Jahr,Titel;

-- LIT16
select Verlag from Buch
where ort LIKE 'München'
order by Verlag;

-- LIT17
select Name, Titel, Verlag, Jahr, Anmerkung
from buch join BA using(BId)
		  join Autor using(AId)
		  join BS using(BId)
		  join Sachverz using(SId)
where Schlagwort in ('Datenbanken','Datenbanksystem')
and Jahr between 1995 and 2010
order by Jahr, Name;

-- LIT18
select count(*) from
	(select count(BId) AS MIND_EIN_SCHLAGWORT from BS
	 group by BId
	 having MIND_EIN_SCHLAGWORT >=1
	) 
    BS;

-- LIT19
select count(*) from
	(select count(BId) AS MIND_EIN_SCHLAGWORT from BS
	 group by BId
	 having MIND_EIN_SCHLAGWORT =0
	) 
    BS;

-- LIT20
-- Überprüfung durch Äüßerer Verbund??
select BS.BId, Buch.BId 
from BS left outer join Buch using(BId)
where Buch.BId is NULL;
