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