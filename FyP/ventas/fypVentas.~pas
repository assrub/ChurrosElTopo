unit fypVentas;

interface  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,registroVentas;


Function CodRelleno(codigo:string):integer; //Para Guardar en Archivos
function InvertirRelleno(codigo:integer):string; //Para Mostrar desde Archivo

Function CodRelleno2(codigo:string):integer; //Pastelito - Para Guardar en Archivos
Function InvertirRelleno2(codigo:integer):string; //Pastelito -Para Mostrar desde Archivo

Function CodBaniado(codigo:string):integer; //Para Guardar en Archivos
Function InvertirBaniado(codigo:integer):string; //Para Mostrar desde Archivo

Function CodTamanio(codigo:string):integer;  //Para Guardar en Archivos
Function InvertirTamanio(codigo:integer):string; //Para Mostrar desde Archivo

function InvertirProducto(codigo:integer):string; //Para Mostrar desde Archivo

Procedure Eliminar(var V:Tventas; var ultimo:integer; pos:integer);


Procedure ReconstruirClaves(var V:Tventas; var ultimo:integer);

Procedure BurbujaMejorado(var V:Tventas; u:integer);


function campoVacio(a:string):boolean; //Si ingresan espacios vacios o no ingresan nada.




implementation
Function CodRelleno(codigo:string):integer; //ComboBox1 (de lo que seleccionas te devuelve 0 a 12)
var
aux:integer;
begin
 if uppercase(codigo) = '01 - SIMPLE' then
    aux:= 1
 else if uppercase(codigo) = '02 - DULCE DE LECHE' then
    aux:= 2
 else if uppercase(codigo) = '03 - CREMA PASTELERA' then
    aux:= 3
 else if uppercase(codigo) = '04 - CHOCOLATE' then
    aux:= 4
 else if uppercase(codigo) = '05 - MEMBRILLO' then
    aux:= 5
 else if uppercase(codigo) = '06 - BATATA' then
    aux:= 6
 else if uppercase(codigo) = '07 - NUTELLA' then
    aux:= 7
 else if uppercase(codigo) = '08 - OREO' then
    aux:= 8
 else if uppercase(codigo) = '09 - BON O BON' then
    aux:= 9
 else if uppercase(codigo) = '10 - MARROC' then
    aux:= 10
 else if uppercase(codigo) = '11 - BANANA SPLIT' then
    aux:= 11
 else if uppercase(codigo) = '12 - DULCE DE ALMENDRAS' then
    aux:= 12   
 else if uppercase(codigo) = '13 - ROQUEFORT' then
    aux:= 13
 else if uppercase(codigo) = '14 - QUESO CHEDDAR' then
    aux:= 14
 else if uppercase(codigo) = '15 - JAMON Y QUESO' then
    aux:= 15
 else
    aux:= 0;

CodRelleno:= aux;
end;




function InvertirRelleno(codigo:integer):string;
var
aux:string;
begin
  case codigo of
  1:begin
    aux:='Simple';
  end;//1
  2:begin
    aux:='Dulce de Leche';
  end;//2
  3:begin
    aux:='Crema Pastelera';
  end;//3
  4:begin
    aux:='Chocolate';
  end;//4
  5:begin
    aux:='Membrillo';
  end;//5
  6:begin
    aux:='Batata';
  end;//6
  7:begin
    aux:='Nutella';
  end;//7
  8:begin
    aux:='Oreo';
  end;//8
  9:begin
    aux:='Bon o Bon';
  end;//9
  10:begin
    aux:='Marroc';
  end;//10
  11:begin
    aux:='Banana Split';
  end;//11
  12:begin
    aux:='Dulce de Almendras';
  end;//12 
  13:begin
    aux:='Roquefort';
  end;//13
  14:begin
    aux:='Queso Cheddar';
  end;//14
  15:Begin
    aux:='Jamon y Queso';
  end;//15
  else
    aux:='Error';
  end;//case

InvertirRelleno:= aux;
end;




Function CodRelleno2(codigo:string):integer;
var
aux:integer;
begin
  if uppercase(codigo) = '01 - MEMBRILLO' then
     aux:= 1
  else if uppercase(codigo) = '02 - BATATA' then
     aux:= 2
  else
     aux:= 0;
CodRelleno2:= aux;
end;


Function InvertirRelleno2(codigo:integer):string;
var
aux:string;
begin
     case codigo of
     0:begin
       aux:= 'Error InvertirRelleno2';
     end;//1
     1:begin
       aux:= 'Membrillo';
     end;//1
     2:begin
       aux:= 'Batata';
     end;//1
     end;//case
InvertirRelleno2:= aux;
end;




Function CodBaniado(codigo:string):integer;
var
aux:integer;
begin
   if (uppercase(codigo) = '01 - SIN') then
      aux:= 1
   else if (uppercase(codigo) = '02 - TRADICIONAL')then
      aux:= 2
   else if (uppercase(codigo) = '02 - BAñADA')  then
      aux:= 3
   else if (uppercase(codigo) = '03 - BAñADA Y DEC.')  then
      aux:= 4
   else if (uppercase(codigo) = '04 - BAñADA DEC. GOUR.')  then
      aux:= 5
   else
      aux:= 0;
CodBaniado:=aux;

end;


Function InvertirBaniado(codigo:integer):string;
var
aux:string;
begin
     case codigo of
     0:begin
      aux:= 'Error Bañado';
     end;//0
     1:begin
      aux:= 'Sin';
     end;//1
     2:begin
      aux:= 'Tradicional';
     end;//2 
     3:begin
      aux:= 'Bañada';
     end;//3  
     4:begin
      aux:= 'Bañada y Dec.';
     end;//4
     5:begin
      aux:= 'Bañada Dec. Gour.';
     end;//5
     end;//case

InvertirBaniado:= aux;
end;



Function CodTamanio(codigo:string):integer;
var
aux:integer;
begin
   if codigo = '01 - Chico' then
      aux:= 1
   else if codigo = '02 - Grande' then
      aux:= 2
   else
      aux:= 0;
      
CodTamanio:=aux;;
end;




Function InvertirTamanio(codigo:integer):string;
var
aux:string;
begin
     case codigo of
     0:begin 
      aux:= 'Error Tamaño';
     end;//0
     1:begin
      aux:= 'Chico';
     end;//1
     2:begin 
      aux:= 'Grande';
     end;//2
     end;//case
InvertirTamanio:= aux;
end;

function InvertirProducto(codigo:integer):string;
var
aux:string;
begin
  case codigo of
  1:begin
    aux:='Churros';
  end;//1
  2:begin
    aux:='Cubanitos';
  end;//2
  3:begin 
    aux:='Donas';
  end;//3
  4:begin 
    aux:='Berlinesas';
  end;//4
  5:begin 
    aux:='Torta Frita';
  end;//5
  6:begin
    aux:='Chipa';
  end;//6
  7:begin
    aux:='Pastelito';
  end;//7
  else
    aux:='Error';
  end;//case

InvertirProducto:= aux;
end;


Procedure Eliminar(var V:Tventas; var ultimo:integer; pos:integer);
begin
    v.detalleVenta[pos]:=v.detalleVenta[ultimo];
    ultimo:=ultimo-1;
end;



Procedure ReconstruirClaves(var V:Tventas; var ultimo:integer);
var
i:integer;
begin
    for i:= 1 to ultimo do
    begin
      v.detalleVenta[i].clave:= i;
    end;
end;


 Procedure Intercambio(var x,y:integer);
 var
   aux:integer;
 begin
        aux:=x;
        x:=y;
        y:=aux;

 end;


Procedure BurbujaMejorado(var V:Tventas; u:integer);
var
  j:integer;
  NoIntercambio:boolean;

begin
  Repeat
    NoIntercambio:= true;

    for j:=1 to u - 1 do
      if v.detalleVenta[j].clave > v.detalleVenta[Succ(j)].clave
      then
        begin
         Intercambio(v.detalleVenta[j].clave, v.detalleVenta[Succ(j)].clave);
         Intercambio(v.detalleVenta[j].producto, v.detalleVenta[Succ(j)].producto);
         Intercambio(v.detalleVenta[j].Rcodigo, v.detalleVenta[Succ(j)].Rcodigo);
         Intercambio(v.detalleVenta[j].Bcodigo, v.detalleVenta[Succ(j)].Bcodigo);
         Intercambio(v.detalleVenta[j].Tcodigo, v.detalleVenta[Succ(j)].Tcodigo);
         Intercambio(v.detalleVenta[j].Cantidad, v.detalleVenta[Succ(j)].Cantidad);

            NoIntercambio:=false
         end;
   until NoIntercambio = true;
end;


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

end.
