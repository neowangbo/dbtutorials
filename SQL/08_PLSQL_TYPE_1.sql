/*
Type
PL/SQL supports three kinds of arrays, or they are known in PL/SQL jargon, collections.
Three kinds of arrays: (https://docs.oracle.com/cd/B28359_01/appdev.111/b28370/collections.htm#LNPLS00501)
	- Associative array (or index-by table)
	- Nested table
	- Variable-size array (varray)

----------------------------------------------------------------------------------------------------------------------
Associative array
	Syntax:
		
		TYPE <plsql_table_type_name> IS TABLE OF <data_type>
		INDEX BY BINARY_INTEGER;
		
		<variable_name>   <plsql_table_type_name>;
		
	
	Built-in Functions and Procedures
		
		count()
			Returns the number of elements
		
		delete(ain_index in binary_integer)
			Deletes the specified element
		
		delete()
			Deletes all elements
		
		exists(ain_index in binary_integer)
			Returns TRUE if the element exists; otherwise, FALSE
		
		first()
			Returns the index of the first element
		
		last()
			Returns the index of the last element
			
		prior(ain_index in binary_integer)
			Returns the index of the first element before the specified element
			
		next(ain_index in binary_integer)
			Returns the index of the first element after the specified element

*/

declare

-- Declare a list
-- index, element (PERSONS.personname)
TYPE name_table IS TABLE OF PERSONS.personname%TYPE
INDEX BY BINARY_INTEGER;

t_name name_table;

n_name BINARY_INTEGER;

begin
	t_name(1) := 'DOE, JOHN';
	t_name(10) := 'DOE, JANE';
	
	pl(t_name(1));
	pl(t_name(10));
	
	pl('There are ' || t_name.count() || ' elements.');
	
	n_name := t_name.first();
	pl('The first element is ' || n_name || '.');
	
	n_name := t_name.next(n_name);
	pl('The next element is ' || n_name || '.');
	
	n_name := t_name.last();
	pl('The last element is ' || n_name || '.');
	
	n_name := t_name.prior(n_name);
	pl('The pior element is ' || n_name || '.');
	
	if t_name.exists(1) then
		pl('Element 1 exists.');
	end if;
	
	pl('I''m deleting element 10');
	t_name.delete(10);
	
	pl('There are ' || t_name.count() || ' elements.');
	if not t_name.exists(10) then
		pl('Element 10 no longer exists.');
	end if;
	
	pl('There are ' || t_name.count() || ' elements.');
	pl('I''m deleting all elements');
	t_name.delete();
	pl('There are ' || t_name.count() || ' elements.');

end;
/