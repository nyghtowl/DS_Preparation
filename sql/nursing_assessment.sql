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

To run from CLI:  sqlite3 -header -column beds.sqlite < nursing_assessment.sql
*/

/* answers count of how many censuses were reported */
select count(*) from beds where Facility_ID = 17;

/* answers earliest census date */
select Bed_Census_Date from beds where Facility_ID = 17 and Bed_Census_Date like "%2009" order by Bed_Census_Date limit 1;

/* answers most recent census date */
select Bed_Census_Date from beds where Facility_ID = 17 and Most_Recently_Submitted_Facility_Census_Data = 1;

/* answers ten census dates with the highest number of available beds */
select Facility_Name, Bed_Census_Date,Available_Residential_Beds from beds where Facility_ID = 17 order by Available_Residential_Beds desc limit 10;

/* answers ten census dates with the lowest number of available beds */
select Facility_Name, Bed_Census_Date,Available_Residential_Beds from beds where Facility_ID = 17 order by Available_Residential_Beds limit 10;