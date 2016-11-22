create or replace package body NUMBER_ as


function to_number_or_null (
v_number in varchar2 )
return number is
begin
    return to_number(v_number);
exception
    when OTHERS then
        return NULL;
end to_number_or_null;

end NUMBER_;
/