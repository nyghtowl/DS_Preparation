/* Only drop table if it exists */
drop table if exists person;

/* Create again to work with it. */
create table person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);

/* Rename the table to peoples. */
alter table person rename to peoples;

/* Add a hatred column to peoples. */
alter table peoples add column hatred INTEGER;

/* Rename peoples back to person. */
alter table peoples rename to person;

.schema person

/* We don't need that. */
drop table person;