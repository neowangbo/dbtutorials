/*
Multi-dimensional
*/
declare

TYPE name_table IS TABLE OF PERSONS.personname%TYPE
INDEX BY binary_integer;

TYPE name_record IS RECORD (
dim2 name_table);

TYPE dim1 IS TABLE OF name_record
INDEX BY binary_integer;

t_dim1 dim1;

begin

	t_dim1(1).dim2(1) := 'DOE, JOHN';
	t_dim1(1).dim2(2) := 'DOE, JANE';

	t_dim1(2).dim2(1) := 'DOUGH, JAYNE';
	t_dim1(2).dim2(2) := 'DOUGH, JON';

	pl(t_dim1(1).dim2(1));
	pl(t_dim1(1).dim2(2));
	
	pl(t_dim1(2).dim2(1));
	pl(t_dim1(2).dim2(2));

end;
/