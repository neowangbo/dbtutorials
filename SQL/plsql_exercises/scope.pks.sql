create or replace package SCOPE as


-- Global (or package spec) variable declaration
gv_scope varchar2(80) := 'I''m a globle variable (or package spec) variable';


-- Global (or package spec) function declaration
FUNCTION my_scope_is_global
return varchar2;


-- Global (or package spec) procedure declaration
PROCEDURE my_scope_is_global;


end SCOPE;
/