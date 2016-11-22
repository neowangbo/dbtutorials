create or replace package body SCOPE as


-- Instance (or package body) variable declaration
iv_scope varchar2(80) := 'I''m an instance variable (or package body) variable';


-- Global (or package spec) function declaration
FUNCTION my_scope_is_global
return varchar2;


-- Global (or package spec) procedure declaration
PROCEDURE my_scope_is_global;


end SCOPE;
/