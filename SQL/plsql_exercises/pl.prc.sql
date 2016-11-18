-- create procedure pl

create or replace procedure pl ( 
    v_test in varchar2 ) is

begin
    sys.dbms_output.put_line(v_test);
end pl;
/