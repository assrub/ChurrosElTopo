unit vectorVentas;

interface  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, registroVentas;

CONST
RangInf = 1 ;
RangSup = 30;



TYPE
      TipoRangoVector = RangInf..RangSup;
      TipoPosicion = RangInf-1..RangSup;

      TipoElemento= TdetalleVenta;

      TipoVector = array [TipoRangoVector] of TdetalleVenta;

     procedure CrearEstructuraVacia (var V:TipoVector; var ultimo:TipoPosicion);
     procedure Insertar (var V:TipoVector; var ultimo:TipoPosicion ; elem:TipoElemento);
     procedure Eliminar (var V:TipoVector; var ultimo:TipoPosicion; Pos:TipoPosicion);
     function Buscar ( V:TipoVector; ultimo:TipoPosicion; elem:TipoElemento;var Pos:tipoPosicion):boolean;
     function EstructuraLlena (V:TipoVector; ultimo:TipoPosicion):Boolean;
     function EstructuraVacia (V:TipoVector; ultimo:TipoPosicion):Boolean;
     Function PrimerElemento (V:TipoVector; ultimo:TipoPosicion):TipoPosicion;
     Function UltimoElemento (V:TipoVector; ultimo:TipoPosicion):TipoPosicion;
     Procedure CapturarInfo (V:TipoVector; ultimo:TipoPosicion;pos:tipoposicion;var elem:TipoElemento);
     Procedure Intercambio(var x,y:tipoElemento);
     Procedure Burbuja (var V: TipoVector; ultimo:TipoPosicion);
     Procedure BurbujaMejorado (var V: TipoVector; ultimo:tipoPosicion);
     function PosMayor(var V:TipoVector;ultimo:tipoPosicion):tipoPosicion;
     Procedure Seleccion (var V:tipoVector;ultimo:tipoPosicion);
     procedure Insercion(var V: tipoVector; ultimo:tipoPosicion);
     function Busqueda_Binaria(V:tipoVector; ultimo:tipoPosicion;elem:tipoElemento; var pos: tipoPosicion):boolean;


implementation


 {Crea la estructura dejandola totalmente vacia}
 procedure CrearEstructuraVacia (var V:TipoVector; var ultimo:TipoPosicion);
 var
  i:tipoPosicion; 
  ValorNulo:integer;
  Begin        
  ValorNulo:= -1;
   For i:=RangInf to RangSup do
       V[i].clave:=ValorNulo;
   Ultimo:=RangInf-1;
  End;


(********************************************************************************************)
         {Este pmodulo es utilizado cuando la informacion no se encuentra ordenada}
         {La informacion se inserta en el ultimo lugar}

 procedure Insertar   (var V:TipoVector; var ultimo:TipoPosicion ; elem:TipoElemento);
 Begin
  Ultimo:=Ultimo+1;
  V[Ultimo]:=elem;
 End;


(********************************************************************************************)  
     {Modulo que elimina informacion de la estructura cuando en la misma, la informacion no
       se encuentra ordenada}
     {Se elimina por sustitucion}

 procedure Eliminar (var V:TipoVector; var ultimo:TipoPosicion; Pos:TipoPosicion);
 Begin
  V[Pos]:= V[Ultimo];
  Ultimo:=Ultimo-1;
 End;



(********************************************************************************************)
  {Modulo que busca dada una clave si se encuentra en la estructura o no, devolviendo un
   valor logico segun se haya encontrado o no la clave enviada}
  {Si se encuentra se devuelve la posicion donde se encuentra, caso contario se
   devuelve la posicion donde deberia estar} 

 function Buscar   ( V:TipoVector; ultimo:TipoPosicion; elem:TipoElemento;var Pos:tipoPosicion):boolean;
 var
 Encontre:boolean;
 pos2:tipoposicion;
 Begin
  Encontre:= false;
  pos:= RangInf;
  while (not Encontre) and (Pos<=Ultimo) do
  begin
   if (V[pos].clave=elem.clave) then
    encontre:=true
   else
    pos:=pos+1;
  end;
  Buscar:=encontre;
 End;



(********************************************************************************************)  
  {Verifica si hay espacio en la estructura o si se encuentra llena}
 function EstructuraLlena (V:TipoVector; ultimo:TipoPosicion):Boolean;
 Begin
  EstructuraLlena:= (Ultimo=RangSup);
 End;


{********************************************************************************************}
  {Verifica si la estructura se encunetra vacia}
 function EstructuraVacia (V:TipoVector; ultimo:TipoPosicion):Boolean;
 Begin
  EstructuraVacia:= (Ultimo=RangInf-1);
 End;


{********************************************************************************************}
{Funcion que devuelve la posicion del primer elemento del vector }
 Function PrimerElemento  (V:TipoVector; ultimo:TipoPosicion):TipoPosicion;
 begin
  if ultimo=RangInf-1 then
   PrimerElemento:= RangInf-1
  else
   PrimerElemento:= RangInf;
 end;


{********************************************************************************************}
{Funcion que devuelve la posicion del ultimo elemento del vector}
 Function UltimoElemento (V:TipoVector; ultimo:TipoPosicion):TipoPosicion;
 begin
  UltimoElemento:= Ultimo;
 end;


{********************************************************************************************}
{Procedimiento que devuelve el elemento que esta en la posicion pos}
  procedure CapturarInfo  (V:TipoVector; ultimo:TipoPosicion;pos:tipoposicion;var elem:TipoElemento);
  begin
   elem:=V[Pos];
  end;

{********************************************************************************************}
{Procedimiento de Intercambio de variables}
 Procedure Intercambio(var x,y:tipoElemento);
 var
   aux:tipoElemento;
 begin
        aux:=x;
        x:=y;
        y:=aux;

 end;

{********************************************************************************************}
{Ordenamiento por Burbuja}
 Procedure Burbuja (var V: TipoVector; ultimo:TipoPosicion);
var
  i,j:TipoPosicion;
  Aux:TipoElemento;
begin
  for i:= RangInf to ultimo-1 do
    for j:=RangInf to ultimo-i do
      if V[j].clave > V[Succ(j)].clave
      then
        begin
         Intercambio(V[j],V[Succ(j)]);
        end;
end;
{********************************************************************************************}
{Ordenamiento por BurbujaMejorado}
 Procedure BurbujaMejorado (var V: TipoVector; ultimo:tipoPosicion);
var
  i,j:tipoPosicion;
  NoIntercambio:boolean;

begin
  i:= RangInf;
  Repeat
    NoIntercambio:= true;
    for j:=RangInf to ultimo-i do
      if V[j].clave > V[Succ(j)].clave
      then
        begin
         Intercambio(V[j],V[Succ(j)]);
         NoIntercambio:=false
         end;
   until NoIntercambio = true;
end;
{********************************************************************************************}
{Funcion que devuelve la posicion del mayor elemento de un vector}
function PosMayor(var V:TipoVector;ultimo:tipoPosicion):tipoPosicion;
var
 Indice_Max,Indice:tipoPosicion;
begin
  Indice_Max:=RangInf;
  for indice:=Succ(RangInf) to ultimo do
   if V[indice].clave > V[Indice_Max].clave
   then
      Indice_Max:=Indice;
   PosMayor:=Indice_Max;
end;

{********************************************************************************************}
{Ordenamiento por Seleccion}
Procedure Seleccion (var V:tipoVector;ultimo:tipoPosicion);
var
 aux, j, mayor:integer;
begin
 for j:=ultimo downto Succ(rangInf) do
  begin
   mayor:=PosMayor(V,j);
   Intercambio( V[mayor], V[j]);
  end;
 end;
{********************************************************************************************}
{Ordenamiento por Insercion}
procedure Insercion(var V: tipoVector; ultimo:tipoPosicion);
var
i, j : tipoPosicion;
actual:tipoElemento;
begin
    for i:=Succ(RangInf) to ultimo do
    begin
        actual := V[i];
        j := i - 1;
        {Desplazamiento de los elementos de la matriz }
        while (j > 0) and (V[j].clave > actual.clave) do
        begin
            V[j + 1] :=  V[j];
            j := j - 1;
        end;
        {insertar el elemento en su lugar }
        V[j + 1] := actual;
    end;
end ;
{********************************************************************************************}
{--------------------Busqueda binaria------------
 Busca un elem en el vector ordenado V y devuelve la posicion en pos}

 function Busqueda_Binaria(V:tipoVector; ultimo:tipoPosicion;elem:tipoElemento; var pos: tipoPosicion):boolean;
var
 primero,ult,central:tipoPosicion;
 encontrado:boolean;
begin
  primero:=RangInf;
  ult:=ultimo;
  encontrado:=false;
  while (primero <=ult) and not encontrado do
  begin
    central:=(primero + ult) div 2;
    if elem.clave = V[central].clave
    then
      encontrado:=true
    else
      if elem.clave > V[central].clave
      then
          primero:= central + 1
      else
          ult:=central -1;
  end;
 if not encontrado
 then pos:=0
 else pos:=central;
 Busqueda_Binaria:=encontrado;
end;
end.
