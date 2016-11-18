-- unit test for function to_mmsddsyyyy_or_null
begin
    SYS.DBMS_OUTPUT.put_line(to_mmsddsyyyy_or_null('01/01/1980'));
    SYS.DBMS_OUTPUT.put_line(to_mmsddsyyyy_or_null('9/9/9999'));
    SYS.DBMS_OUTPUT.put_line(to_mmsddsyyyy_or_null('1/1/4712 BC'));
end;
/