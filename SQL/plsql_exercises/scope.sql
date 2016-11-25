-- Test unit for package scope

declare

-- Anonymous PL/SQL block's declaration section --

v_scope          varchar2(40) := 'I''m a local variable!';


-- This is a local (or embedded) function
FUNCTION my_scope_is_local
return           varchar2 is
v_answer_0       varchar2(3)  := 'YES';
begin
	return v_answer_0;
end my_scope_is_local;


-- This is a local (or embedded) procedure
PROCEDURE my_scope_is_local is
v_answer         varchar2(3)  := 'YES';
begin
	pl(v_answer);
end my_scope_is_local;


begin
-- Anonymous PL/SQL block's executable section --
	
	pl('Can I access my local variable?');
	pl(v_scope);
	
	pl('Can I access SCOPE''s global variable?');
	pl(SCOPE.gv_scope);
	
	pl('Can I access SCOPE''s instance variable?');
	--pl(SCOPE.iv_scope);
	pl('NO!');
	
	
	pl('Can I access my local function?');
	pl(my_scope_is_local());
	
	pl('Can I access SCOPE''s global function?');
	pl(SCOPE.my_scope_is_global());
	
	pl('Can I access SCOPE''s instance function?');
	--pl(SCOPE.my_scope_is_instance());
	pl('NO!');
	
	pl('Can I access my local procedure?');
	my_scope_is_local();
	
	pl('Can I access SCOPE'' global procedure?');
	SCOPE.my_scope_is_global();
	
	pl('Can I access SCOPE'' instance procedure?');
	--SCOPE.my_scope_is_instance();
	pl('NO!');
	
end;
/