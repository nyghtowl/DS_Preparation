/*
SQL Beds Assessment

Challenge to assess nursing home bed data and answer 5 questions

-- The count of how many censuses were reported
-- The earliest census date
-- The latest census date
-- The ten census dates with the highest number of available beds for that nursing home
-- The ten census dates with the lowest number of available beds for that nursing home

Assuming - Available Residential Beds encapsulates the Pediatric bed number

Using SQL file run analysis on bed census
*/

/* answers count of how many censuses were reported */
select count(*) from beds where Facility_ID = 17;

/* answers earliest census date */
select Facility_ID, min(Bed_Census_Date) from beds where group by Facility_ID;

/* answers most recent census date */
select Bed_Census_Date from beds where Facility_ID = 17 and Most_Recently_Submitted_Facility_Census_Data = "True";

/* answers ten census dates with the highest number of available beds */

/* answers ten census dates with the lowest number of available beds */