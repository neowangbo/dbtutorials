/*

*/
declare

-- Declare a list
-- index, element (PERSONS.personname, PERSONS.personbirthday) <- table
TYPE name_table IS TABLE OF PERSONS%ROWTYPE
INDEX BY BINARY_INTEGER;

t_name name_table;

n_name BINARY_INTEGER;

begin
	t_name(1).personname      := 'DOE, JOHN';
	t_name(1).personbirthday  := to_date('1994-08-23','YYYY-MM-DD');
	
	t_name(10).personname := 'DOE, JANE';
	t_name(10).personbirthday  := to_date('1996-02-09','YYYY-MM-DD');
	
	pl('--- ' || t_name(1).personname || ', ' || t_name(1).personbirthday);
	pl('--- ' || t_name(10).personname || ', ' || t_name(10).personbirthday);
	
	pl('There are ' || t_name.count() || ' elements.');-- count()
	
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