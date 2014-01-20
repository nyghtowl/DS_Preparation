-- Learn SQL the Hard Way

drop table if exists person;
drop table if exists pet;
drop table if exists person_pet;


create table person (
    id integer primary key,
    first_name text,
    last_name text,
    age integer
);

create table pet (
    id integer primary key,
    name text,
    breed text,
    age integer,
    dead integer
);

create table person_pet (
    person_id integer,
    pet_id integer
);

INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, "Fluffy", "Unicorn", 1000, 0);

INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);
INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);

select * from person;
select name, age from pet;
select name, age from pet where dead = 0;
select * from person where first_name != "Zed";
select name, age from pet where age > 10;
select * from person where first_name = "Zed" AND age > 30;

select pet.id, pet.name, pet.age, pet.dead
    from pet, person_pet, person
    where
    pet.id = person_pet.pet_id and
    person_pet.person_id = person.id and
    person.first_name = "Zed";

/* make sure there's dead pets */
select name, age from pet where dead = 1;

/* aww poor robot */
delete from pet where dead = 1;

/* make sure the robot is gone */
select * from pet;

/* let's resurrect the robot */
insert into pet values (1, "Gigantor", "Robot", 1, 0);

/* the robot LIVES! */
select * from pet;