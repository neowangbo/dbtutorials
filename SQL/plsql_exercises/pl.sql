-- to test pl precedure
declare
    v_max_line varchar2(32767);
begin
    -- Th next three lines initialize the variable v_max_line with 32,767 spaces.
    for i in 1..32767 loop
        v_max_line := v_max_line || ' ';
    end loop;
    
    pl('Test a line of text.');
    
    pl('Test a number, such as 1?');
    pl(1);
    
    pl('Test a date, such as 01/01/1980?');
    pl(to_date('19800101','YYYYMMDD'));
    
    pl('Test a line <= 3267');
    pl(v_max_line);
    
    pl('Test a line > 3267');
    pl(v_max_line || ' ');
    
    pl('Test a multi-line');
    pl('12345678901234567890123456789012345678901234567890' ||
       '12345678901234567890123456789012345678901234567890' || chr(10) ||
       '12345678901234567890123456789012345678901234567890' ||
       '12345678901234567890123456789012345678901234567890' || chr(10) ||
       '12345678901234567890123456789012345678901234567890' ||
       '12345678901234567890123456789012345678901234567890');
end;
/   