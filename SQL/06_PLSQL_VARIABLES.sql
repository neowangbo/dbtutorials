/*

Variables
1 ----------------------------------------------------------------------
Variable Naming 
and date types
    c_     CURSOR
    d_     DATE
    n_     NUMBER
    r_     ROW
    t_     TABLE
    v_     VARCHAR2
2 ----------------------------------------------------------------------
Variable Declarations

Syntax:
    <variable_name>  <data_type>

    declare
        n_id         number;
        v_name       varchar2(100);
        d_birth_date date;
        v_gender     varchar2(30);
    begin
        ...
    end;

3 ----------------------------------------------------------------------
Variable Anchors
An anchor refers to the use of the keyword %TYPE to "anchor" a PL/SQL data type 
definition in a PL/SQL variable to the corresponding SQL data type definition of
a column in a table.

Syntax:
    <variable_name>  <table_name>.<column_name>%TYPE := <value>;
    
Example:
    declare
    
        n_id         AUTHORS.id%TYPE          := 400;
        v_name       AUTHORS.name%TYPE        := 'STEVEN FEUERSTEIN';
        d_birth_date AUTHTORS.birth_date%TYPE := to_date('19800101','YYYYMMDD');
        v_gender     AUTHORS.gender%TYPE      := NULL;
    
    begin
        ...
    end;
    
4 ----------------------------------------------------------------------
NULL Value
Key work NULL means "it is not possible to know what the value is".

	This is no
		= NULL
		or
		<> NULL.
	
	This is ONLY
		IS NULL
		or
		IS NOT NULL.


*/