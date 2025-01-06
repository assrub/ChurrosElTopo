unit FunyProc;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;


Procedure intercmbioINT(var x,y:integer);
Procedure intercmbioSTR(var x,y:string);
Procedure intercmbioFLOAT(var x,y:real);

Procedure BurbMej (var a:array of integer; var b:array of string; var c:array of real; ultimo:integer);
 
Function FindDayOfWeek(Day, Month, Year: Integer):integer;

procedure EstructVaciaInt(var v:array of integer; ultimo:integer);
procedure EstructVaciaStr(var v:array of string; ultimo:integer);
procedure EstructVaciaFloat(var v:array of real; ultimo:integer);

procedure InsertCantInt(var v:array of integer; producto:integer; Cant:integer; var ultimo:integer);
procedure InsertPrecFloat(var v:array of real; producto:integer; Cant:real; var ultimo:integer);


implementation

Procedure intercmbioINT(var x,y:integer);
var
  aux:integer;
begin
        aux:=x;
        x:=y;
        y:=aux;
end;


Procedure intercmbioSTR(var x,y:string);
var
  aux:string;
begin
        aux:=x;
        x:=y;
        y:=aux;

end;

Procedure intercmbioFLOAT(var x,y:real);
var
  aux:real;
begin
        aux:=x;
        x:=y;
        y:=aux;

end;

{Ordenamiento por BurbujaMejorado}
 Procedure BurbMej (var a:array of integer;var b:array of string; var c:array of real; ultimo:integer);
var
  j:integer;
  NoIntercambio:boolean;

begin
  Repeat
    NoIntercambio:= true;
    for j:=0 to ultimo - 2 do
      if a[j] < a[Succ(j)]
      then
        begin
           intercmbioINT(a[j],a[Succ(j)]);
           intercmbioSTR(b[j],b[Succ(j)]);
           intercmbioFLOAT(c[j],c[Succ(j)]);
         NoIntercambio:=false;
         end;
   until NoIntercambio = true;

end;

 
Function FindDayOfWeek(Day, Month, Year: Integer) : integer;
var
  century, yr, dw: Integer;
begin
  if Month < 3 then
  begin
    Inc(Month, 10);
    Dec(Year);
  end
  else
     Dec(Month, 2);
  century := Year div 100;
  yr := year mod 100;
  dw := (((26 * month - 2) div 10) + day + yr + (yr div 4) +
    (century div 4) - (2 * century)) mod 7;
  if dw < 0 then FindDayOfWeek := dw + 7
  else FindDayOfWeek := dw;
end;

procedure EstructVaciaInt(var v:array of integer; ultimo:integer);
var
i:integer;
begin
  for i:=0 to 7 do
   v[i]:= 0;

  ultimo:= 0;
end;

procedure EstructVaciaStr(var v:array of string; ultimo:integer);
var
i:integer;
begin
  for i:= 0 to 7 do
   v[i]:= '';

  ultimo:= 0;
end;


procedure EstructVaciaFloat(var v:array of real; ultimo:integer);
var
i:integer;
begin
  for i:= 0 to 7 do
   v[i]:= 0;

  ultimo:= 0;
end;


procedure InsertCantInt(var v:array of integer; producto:integer; Cant:integer; var ultimo:integer);
var
i:integer;
begin
   case producto of
       1:begin  //CHURROS
         v[1]:= v[1] + Cant;
         ultimo:= 1;
       end;//1
       2:begin  //CUBANITOS
         v[2]:= v[2] + Cant;
         ultimo:= 2;
       end;//2
       3:begin  //DONAS
         v[3]:= v[3] + Cant;
         ultimo:= 3;
       end;//3
       4:begin //BERLINESAS
         v[4]:= v[4] + Cant; 
         ultimo:= 5;
       end;//4
       5:begin //TPRTAFRITAS
         v[5]:= v[5] + Cant;
         ultimo:= 5;
       end;//5
       6:begin  //CHIPA
         v[6]:= v[6] + Cant;
         ultimo:= 6;
       end;//6
       7:begin //PASTELITOS
         v[7]:= v[7] + Cant;
         ultimo:= 7;
       end;//7
   end;//CASE
end;



procedure InsertPrecFloat(var v:array of real; producto:integer; Cant:real; var ultimo:integer);
var
i:integer;
begin
   case producto of
       1:begin  //CHURROS
         v[1]:= v[1] + Cant;
         ultimo:= 1;
       end;//1
       2:begin  //CUBANITOS
         v[2]:= v[2] + Cant;
         ultimo:= 2;
       end;//2
       3:begin  //DONAS
         v[3]:= v[3] + Cant;
         ultimo:= 3;
       end;//3
       4:begin //BERLINESAS
         v[4]:= v[4] + Cant; 
         ultimo:= 5;
       end;//4
       5:begin //TPRTAFRITAS
         v[5]:= v[5] + Cant;
         ultimo:= 5;
       end;//5
       6:begin  //CHIPA
         v[6]:= v[6] + Cant;
         ultimo:= 6;
       end;//6
       7:begin //PASTELITOS
         v[7]:= v[7] + Cant;
         ultimo:= 7;
       end;//7
   end;//CASE
end;





end.
