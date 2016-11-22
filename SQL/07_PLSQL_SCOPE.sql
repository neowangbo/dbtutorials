/*
Scope:
	Scope refers to when a declared item can be seen by another PL/SQL block.
	The declared item refers to any kind of declared item: a contant, cursor, function, procedure, or variable.

	
Scope rules:
	1 - Any item declared in the declaration section of a function or procedure
		is visible only within the same function or procedure.
	
	2 - Any item declared in the declaration section of a package body
		is visible only within any other item in the same package body.
		
	3 - Any item declared in a package specification
		is visible to any other stored function, stored procedure, and package for which the owner of the calling
		method has execute privileges.

*/