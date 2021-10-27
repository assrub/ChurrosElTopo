unit fyp;
{
***********************************************
*                 INTERFACE                   *
***********************************************
}
interface

function campoVacio(a:string):boolean;




{
***********************************************
*               IMPLEMENTACIÓN                *
***********************************************
}
implementation

function campoVacio(a:string):boolean;
var
  i:integer;
  vacios,noVacios:integer;
begin
  campoVacio:= false;
  vacios:= 0;
  noVacios:= 0;
  for i := 1 to length(PChar(a))-1 do
  begin
    if (a[i] = '') or (a[i] = ' ') then
      vacios:= vacios + 1
    else
      noVacios:= noVacios + 1;
  end;
    if (vacios > 0) or (a = '') or (a = ' ')then
    if noVacios > 4 then
    else
      campoVacio:= true;
end;




{
***********************************************
*                    END                      *
***********************************************
}
end.
