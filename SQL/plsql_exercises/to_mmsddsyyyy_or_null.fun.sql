create or replace function to_mmsddsyyyy_or_null (
aiv_date in varchar2 )
return date is

begin
  return to_date(aiv_date, 'MM/DD/YYYY');
exception
  when OTHERS then
    return null;
end to_mmsddsyyyy_or_null;
/