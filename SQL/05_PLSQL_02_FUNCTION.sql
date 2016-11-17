/*
A FUNCTION is a PL/SQL block or method that returns a value.

DDL syntax:

CREATE [OR REPLACE] FUNCTION <function_name> [(
<parameter_name_1>  [IN] [OUT] <parameter_data_type_1>,
<parameter_name_2>  [IN] [OUT] <parameter_data_type_2>,...
<parameter_name_n>  [IN] [OUT] <parameter_data_type_n> )]
RETURN <return_data_type> IS
    -- the declaration section
BEGIN
    -- the executable section
    return <return_data_type>;
EXCEPTION
    - the exception-handling section
END;
/

*/

CREATE OR REPLACE FUNCTION to_number_or_null (
aiv_number IN VARCHAR2
)
RETURN NUMBER IS
BEGIN
    return to_number(aiv_number);
EXCEPTION
    when OTHERS then -- OTHERS is an catch-all exception, 
        return NULL;
END to_number_or_null;
/

select to_number_or_null('A') as NUM from dual;
select to_number_or_null('250.98') as NUM from dual;

-- Exercise

