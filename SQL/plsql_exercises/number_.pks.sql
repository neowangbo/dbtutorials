create or replace package NUMBER_ as

/*
REturns the passed varchar2 as a number if it represents a number,
otherwise, it returns NULL
*/
function to_number_or_null (
v_number in varchar2 )
return number;

end NUMBER_;
/