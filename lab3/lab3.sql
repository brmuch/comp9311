

-- Q1: how many page accesses on March 2


create or replace view Q1(nacc) as
select count(*) from accesses where DATE(accTime) = '2005-03-02'
;


-- Q2: how many times was the MessageBoard search facility used?

create or replace view Q2(nsearches) as
select count(*) from accesses where page like 'messageboard%' and params like '%state=search%';
;


-- Q3: on which Tuba lab machines were there incomplete sessions?


create or replace view Q3(hostname) as
select hostname from hosts,sessions where hosts.id = sessions.host and sessions.complete = 'f' and hosts.hostname like 'tuba%' group by hosts.hostname order by hostname;
;


-- Q4: min,avg,max bytes transferred in page accesses


create or replace view Q4(min,avg,max) as
select min(nbytes), trunc(avg(nbytes)), max(nbytes) from accesses
;


-- Q5: number of sessions from CSE hosts


create or replace view Q5(nhosts) as
select count(*) from hosts,sessions where hostname like '%cse.unsw.edu.au' and hosts.id = sessions.host
;


-- Q6: number of sessions from non-CSE hosts


create or replace view Q6(nhosts) as
select count(*) from hosts,sessions where hostname not like '%cse.unsw.edu.au' and hosts.id = sessions.host
;


-- Q7: session id and number of accesses for the longest session?

create view gavin(sessions, mins) as
select session, count(*) from accesses group by session;

create or replace view Q7(session,length) as 
select sessions, mins from gavin where mins = (select max(mins) from gavin)
;


-- Q8: frequency of page accesses


create or replace view Q8(page,freq) as
select page, count(*) from accesses group by page 
;


-- Q9: frequency of module accesses


create or replace view Q9(module,freq)  as
select regexp_matches(page, '^[a-z]+'), count(*) from accesses group by regexp_matches(page, '^[a-z]+')
;


-- Q10: "sessions" which have no page accesses


create or replace view Q10(session) as
select id from sessions where id not in (select session from accesses)
;


-- Q11: hosts which are not the source of any sessions


create or replace view Q11(unused) as
select hostname from hosts where id not in (select host from sessions) and hostname is not null
;
