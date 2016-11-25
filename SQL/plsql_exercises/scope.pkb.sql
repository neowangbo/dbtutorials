create or replace package body SCOPE as


-- Instance (or package body) variable declaration
iv_scope   varchar2(80) := 'I''m an instance variable (or package body) variable';


-- Instance (or package body) function declaration
FUNCTION my_scope_is_instance
return     varchar2 is
v_answer_1 varchar2(3) := 'Yes';
begin
	pl(chr(9) || 'Can function my_scope_is_instance see variable gv_globle?');
	pl(chr(9) || gv_scope);
	return v_answer_1;
end my_scope_is_instance;


-- Global (or package spec) function declaration
FUNCTION my_scope_is_global
return     varchar2 is
v_answer_2 varchar2(3) := 'Yes';
begin
	pl(chr(9) || 'Can function my_scope_is_global see variable iv_globle?');
	pl(chr(9) || iv_scope);
	return v_answer_2;
end my_scope_is_global;
	

-- Instance (or package body) procedure declaration
PROCEDURE my_scope_is_instance is
v_answer_3 varchar2(3) := 'Yes';
begin
	pl(chr(9) || 'Can procedure my_scope_is_instance see variable gv_globle?');
	pl(chr(9) || gv_scope);
	pl(v_answer_3);
end my_scope_is_instance;
	
	
-- Global (or package spec) procedure declaration
PROCEDURE my_scope_is_global is
v_answer_4 varchar2(3) := 'Yes';
begin
	pl(chr(9) || 'Can procedure my_scope_is_global see variable iv_globle?');
	pl(chr(9) || iv_scope);
	pl(v_answer_4);
end my_scope_is_global;


end SCOPE;
/