create or replace package PARAMETER as


FUNCTION in_out_inout(
aiv_in       in           varchar2,
aov_out            out    varchar2,
aiov_inout   in    out    varchar2)
return varchar2;


PROCEDURE in_out_inout(
aiv_in        in           varchar2,
aov_out             out    varchar2,
aiov_inout    in    out    varchar2);


end PARAMETER;
/