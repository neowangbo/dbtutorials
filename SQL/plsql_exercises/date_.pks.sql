create or replace package DATE_ as

-- constant?
-- The maxium and minum date values.
d_MAX constant date := to_date('99991231235959','YYYYMMDDHH24MISS');
d_MIN constant date := to_date('-47120101','SYYYYMMDD');


-- Returns the specified date with the time set to 23:59:59, therefore, the end of the day
function end_of_day(
    d_date in date )
return date;


-- Returns constant d_MAX. 
-- This is useful in SQL statements where the constant DATE_.d_MAX is not accessible.
function get_max
return date;


-- Returns constant d_MIN. 
-- This is useful in SQL statements where the constant DATE_.d_MIN is not accessible.
function get_min
return date;


-- Text-based help for this package. "set serveroutput on" in SQL*Plus.
procedure help;


-- Returns a randomly generated date that exists between the years specified.
function random(
    n_starting_year in number,
    n_ending_year in number)
return date;


-- Returns the specified date with the time set to 00:00:00, therefore, the start of the date
function start_of_day(
    d_date in date)
return date;


-- Test unit for this package
procedure test;


end DATE_;
/