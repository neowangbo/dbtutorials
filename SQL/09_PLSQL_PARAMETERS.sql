/*
Parameters

Parameter Naming
	1-Parameter naming prefix
		ai  Argument IN
		ao  Argument OUT
		aio Argument IN OUT
		
	2-Examples
		IN              OUT             IN OUT           DATA TYPE
		ain_id          aon_id          aion_id          number
		aiv_name        aov_name        aiov_name        varchar2
		aid_birthday    aod_birthday    aiod_birthday    date
		aiv_gender      aov_gender      aiov_gender      varchar2
	

Parameter Scope
	Parameter keywords IN and OUT determine the accessibility, or scope, of the parameters
	 - IN     : makes your parameters' data available to the called cursor, function, or procedure.
	 - OUT    : allows the called function or procedure to set the parameter's value within the called PL/SQL block
	 - IN OUT : The combination of IN and OUT allows both levels of accessibility

	
Example:
parameter.pks.sql
parameter.pkb.sql
parameter.sql -- unit test

*/