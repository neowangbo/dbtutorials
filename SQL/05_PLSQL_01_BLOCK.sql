/*
-Blocks
Procedure Language Extension for SQL (PL/SQL) has a block structure.
Every piece of code executes in a block, similar to Java, JavaScript ....
PL/SQL has 4 keywords,

    DECLARE: Every PL/SQL has declaration section. This is where you allocate memory for cursors, data type definations, variables, embedded functions, and procedures. Somethimes when you code a PL/SQL program, you won't even use the declaration section, but it's still there.
    
    BEGIN:  Every PL/SQL has executable section. It starts with the key words BEGIN. BEGIN marks the beginning of where you put your program logic. And every PL/SQL program must have at least one line of executable code, even if it's the keyword NULL, which in this context means on operation.
    
    EXCEPTION: Every PL/SQL has exception-handling section. If starts with the keyword EXCEPTION. This is where you will catch any database or PL/SQL errors, or as they are affectionately known, exceptins. Like the declaration sesion, sometimes you won't even use an exception-handling sesion, but it's still there.
    
    END: Every PL/SQL block ends with the keyword END.
*/

/*
-Anonymous blocks
Called anonymous because it's not going to be saved in the database, so it will never have a name.
*/

-- anonymous procedure, so it has no name
SET serveroutput on size 1000000000
DECLARE
BEGIN
  NULL;
EXCEPTION
  when NO_DATA_FOUND then
    raise_application_error(-20000,'Hey, This is ni the exception-handling section!');
END;
/

--Type following                                                using sqlplus
--SQL> set serveroutput on size 1000000
--SQL> begin
--  2    SYS.DBMS_OUTPUT.put_line('Hi there genius!');
--  3  end;
--  4  /
--Hi there genius!
--PL/SQL procedure successfully completed.
--SQL>

/*
Common exceptions:
  NO_DATA_FOUND
  TOO MANY ROWS
*/