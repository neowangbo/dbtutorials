/*
PROCEDURE
Procedures don't return a value. They just perform their directives/instructions and return.

Syntax
CREATE OR REPLACE PROCEDURE <procedure_name> [(
<parameter_name_1>  [IN] [OUT] <parameter_data_type_1>,
<parameter_name_2>  [IN] [OUT] <parameter_data_type_2>,...
<parameter_name_n>  [IN] [OUT] <parameter_data_type_n>)] IS
    -- the declaration section
BEGIN
    -- the executable section
EXCEPTION
    -- the exception-handling section
END;
/


Resolve: Error(5,5): PLS-00201: identifier 'SYS.DBMS_LOCK' must be declared
grant execute on <object> to <user>;
connect as sys
grant execute on SYS.DBMS_LOCK to someuser;


Use EXECUTE to run a procedure.
*/

CREATE OR REPLACE PROCEDURE wait(
ain_seconds IN NUMBER
) IS
BEGIN
    SYS.DBMS_LOCK.sleep(ain_seconds);
END wait;
/


EXECUTE wait( 120 );

select SYS.DBMS_LOCK.sleep(ain_seconds) from dual;
-- Exercise

