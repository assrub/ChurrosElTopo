unit archivosVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, registroVentas;


Type
   tipoArchivo= file of Tventas;


var
  A:tipoArchivo;     
  ruta:string;
  ARCHIVO:string;
  
procedure Activar (var A:tipoArchivo; ruta:string; archivo:string);
procedure AbrirArchivo(var A:tipoArchivo);
procedure CerrarArchivo(var A:tipoArchivo);
function Posicion(Clave:integer; var A:tipoArchivo):integer; //Devuelve en que posición del archivo este X Registro.
procedure CapturarInfo(Var A:tipoArchivo; pos:integer; var R:Tventas); //Capturamos por variable los datos de la posición dada.
procedure Instertar(Var A:tipoArchivo; pos:integer; R:Tventas); //Inserta los datos en la posicion del archivo dada.
procedure Eliminar2(var A:tipoArchivo; pos:integer); //ELIMINA O BORRA LOS DATOS DEL ARHCHIVO
Function ArchivoVacio (var A:tipoArchivo):boolean;
Function PrimerElemento(var A:tipoArchivo):integer;
Function UltimoElemento(var A:tipoArchivo):integer;
procedure EliminarArchivo(var A:tipoArchivo);
procedure Modificar (var A:tipoArchivo; pos:integer; R:Tventas);
Function BuscarInt(var A:tipoArchivo; clave:integer):integer; 
Function BuscarFech(var A:tipoArchivo; clave:TdateTime):integer; 
procedure Formatear();
procedure guardarTxt(var A:tipoArchivo; ruta:string);

implementation
procedure Activar (var A:tipoarchivo; ruta:string; archivo:string);
BEGIN

  ASSIGN(A,RUTA+ARCHIVO);
  {$I-}//desabilita los errores del programa 
   RESET(A); //lo que hace es abrir el archivo, y lo prepara para poder modificar
  {$I+}//habilita los errores del programa
  IF IORESULT <> 0
  THEN
      BEGIN
          REWRITE(A); //Creo el archivo
          CLOSEFILE(A);   //Lo cierro
          RESET(A);   //Lo vuelvo abrir
      END;

END;


procedure AbrirArchivo(var A:tipoArchivo);
BEGIN
  RESET(A);
END;


procedure CerrarArchivo(var A:tipoArchivo);
BEGIN
  CLOSE(A);
END;



function Posicion(Clave:integer; var A:tipoarchivo):integer;
  VAR
  R:Tventas;
  Hallado,mayor:boolean;
BEGIN
  Hallado:= False;
  seek(A, 0); //Posicionamos en el Archivo
  mayor:= false;
  while not (eof(A)) and not (hallado) and not (mayor) do
  begin
    read(A,R);
    if R.clave > clave then
       mayor:= true
    else
       if R.clave = clave then
          Hallado:= true;
  end;
  if hallado then
     begin
     Posicion:= filepos(A) -1;
     end
  else
     if mayor then
      begin
        Posicion:= filepos(A) -1;
      end
      else
      begin
        if filesize(A) = 0 then
          Posicion:= 0
        else
          Posicion:= filepos(A);
      end;
END;

procedure CapturarInfo(Var A:tipoArchivo; pos:integer; var R:Tventas);
BEGIN
    seek(A,pos);
    read(A,B);
END;

procedure Instertar(Var A:tipoArchivo; pos:integer; R:Tventas);
VAR
  RAUX:Tventas;
  I:integer;
BEGIN
    IF FILESIZE(A) = 0
    THEN
        WRITE(A,R)
    ELSE
    BEGIN
      I:= FILESIZE(A) -1; //ULTIMO ELEMENTO;
      WHILE I > POS DO  //CORRIMIENTO
      BEGIN
        SEEK(A,I);
        READ(A,RAUX);
        SEEK(A,I+1);
        WRITE(A,RAUX);
        I:= I -1;
      END;
      SEEK(A,POS); //AGREGO EL NUEVO
      WRITE(A,R);
    END;
END;


procedure Eliminar2(var A:tipoArchivo; pos:integer);
BEGIN
     IF POS <> -1 THEN
     BEGIN
          SEEK(A,POS);
          READ(A,R);

          IF NOT R.BORRADO THEN
          POS:= FILEPOS(A)-1;
          SEEK(A,POS);
          WRITE(A,R);
     END;
END;


Function ArchivoVacio (var A:tipoArchivo):BOOLEAN;
BEGIN
     ArchivoVacio:= FILESIZE(A) = 0 ;
END;


Function PrimerElemento(var A:tipoArchivo):integer;
BEGIN
     PrimerElemento:= 0;
END;


Function UltimoElemento(var A:tipoArchivo):integer;
BEGIN
     UltimoElemento:= FILESIZE(A)-1;
END;



procedure EliminarArchivo(var A:tipoArchivo);
BEGIN
     CLOSE(A);
     REWRITE(A);
     CLOSE(A);
     RESET(A);
END;


procedure Modificar (var A:tipoArchivo; pos:integer; R:Tventas);
BEGIN
     SEEK(A,POS);
     WRITE(A,R);
END;


Function BuscarInt(var A:tipoArchivo; clave:integer):integer;
VAR
   R:Tventas;
   ENCONTRE:BOOLEAN;
BEGIN
     ENCONTRE:= FALSE;
     SEEK(A,0);
     WHILE NOT EOF(A) AND NOT ENCONTRE DO
     BEGIN
          READ(A,R);
          IF R.clave  = CLAVE THEN
             ENCONTRE:= TRUE;
     END;
     IF ENCONTRE THEN
       BuscarInt:= FILEPOS(A) -1
     ELSE
       BuscarInt:= -1;
END;


Function BuscarFech(var A:tipoArchivo; clave:TdateTime):integer;
VAR
   R:Tventas;
   ENCONTRE:BOOLEAN;
   
BEGIN
     ENCONTRE:= FALSE;
     SEEK(A,0);
     WHILE NOT EOF(A) AND NOT ENCONTRE DO
     BEGIN
          READ(A,R);
          IF R.fechaSola = CLAVE THEN
             ENCONTRE:= TRUE;
     END;
     IF ENCONTRE THEN
       BuscarFech:= FILEPOS(A) -1
     ELSE
       BuscarFech:= -1;
END;

procedure Formatear();
var
i:integer;
begin
 B.fechaSola:= 0;
 B.time:= 0;
 B.clave:= 0;

 for i:= 1 to 30 do
 begin
 B.detalleVenta[i].clave:= 0;
 B.detalleVenta[i].producto:= 0;
 B.detalleVenta[i].Rcodigo:= 0;
 B.detalleVenta[i].Bcodigo:= 0;
 B.detalleVenta[i].Tcodigo:= 0;
 B.detalleVenta[i].Cantidad:= 0;
 B.detalleVenta[i].Subtotal:= 0;
 end;

 B.Total:= 0;
 B.borrado:= false;
 B.operador:= '';
end;






procedure guardarTxt(var A:tipoArchivo; ruta:string);
var
  i,j:integer;
  db:textFile;
  s:string;
  C_Clave, P_Producto,R_Codigo,B_Codigo,T_Codigo,C_Cantidad:array[1..30] of integer;
  S_Subtotal:array[1..30] of real;
begin
   
   assignFile(db,ruta);
   rewrite(db);

  //SI LA FECHA DE HOY SE ENCUENTRA CAPTURAMOS LA INFO
  I:= 0;
  while I <= UltimoElemento(A) do
  begin
          //CAPTURO LA INFORMACIÓN DEL VECTOR I Y LO VUELCO EN R
          CapturarInfo(A,I,B);
         
           for j:= 1 to 30 do
           begin
            C_Clave[j]:=    B.detalleVenta[j].clave;
            P_Producto[j]:= B.detalleVenta[j].producto;
            R_Codigo[j]:=   B.detalleVenta[j].Rcodigo;
            B_Codigo[j]:=   B.detalleVenta[j].Bcodigo;
            T_Codigo[j]:=   B.detalleVenta[j].Tcodigo;
            C_Cantidad[j]:= B.detalleVenta[j].Cantidad;
            S_Subtotal[j]:= B.detalleVenta[j].Subtotal;
           end;

           s:= s +
                 'Fecha Sola: '     + DateTimeToStr(r.fechaSola) + #13 + #10 +
                 'Fecha Completa: ' + DateTimeToStr(r.time) + #13 + #10 +
                 'Clave: '          + IntToStr(r.clave) + #13 + #10 +

           'INICIO BUCLE' + #13 + #10 +
                 'Clave: ' + IntToStr(C_Clave[1]) + ' | ' + IntToStr(C_Clave[2]) + ' | ' + IntToStr(C_Clave[3]) + ' | ' + IntToStr(C_Clave[4]) + ' | ' + IntToStr(C_Clave[5]) + ' | ' + IntToStr(C_Clave[6]) + ' | ' + IntToStr(C_Clave[7]) + ' | ' + IntToStr(C_Clave[8]) + ' | ' + IntToStr(C_Clave[9]) + ' | ' + IntToStr(C_Clave[10]) + ' | ' + IntToStr(C_Clave[11]) + ' | ' +
                             IntToStr(C_Clave[12]) + ' | ' + IntToStr(C_Clave[13]) + ' | ' + IntToStr(C_Clave[14]) + ' | ' + IntToStr(C_Clave[15]) + ' | ' + IntToStr(C_Clave[16]) + ' | ' + IntToStr(C_Clave[17]) + ' | ' + IntToStr(C_Clave[18]) + ' | ' + IntToStr(C_Clave[19]) + ' | ' + IntToStr(C_Clave[20]) + ' | ' + IntToStr(C_Clave[21]) + ' | ' + IntToStr(C_Clave[22]) + ' | ' +
                             IntToStr(C_Clave[23]) + ' | ' + IntToStr(C_Clave[24]) + ' | ' + IntToStr(C_Clave[25]) + ' | ' + IntToStr(C_Clave[26]) + ' | ' + IntToStr(C_Clave[27]) + ' | ' + IntToStr(C_Clave[28]) + ' | ' + IntToStr(C_Clave[29]) + ' | ' + IntToStr(C_Clave[30]) + #13 + #10 +

                 'Producto: ' + IntToStr(P_Producto[1]) + ' | ' + IntToStr(P_Producto[2]) + ' | ' + IntToStr(P_Producto[3]) + ' | ' + IntToStr(P_Producto[4]) + ' | ' + IntToStr(P_Producto[5]) + ' | ' + IntToStr(P_Producto[6]) + ' | ' + IntToStr(P_Producto[7]) + ' | ' + IntToStr(P_Producto[8]) + ' | ' + IntToStr(P_Producto[9]) + ' | ' + IntToStr(P_Producto[10]) + ' | ' + IntToStr(P_Producto[11]) + ' | ' +
                                IntToStr(P_Producto[12]) + ' | ' + IntToStr(P_Producto[13]) + ' | ' + IntToStr(P_Producto[14]) + ' | ' + IntToStr(P_Producto[15]) + ' | ' + IntToStr(P_Producto[16]) + ' | ' + IntToStr(P_Producto[17]) + ' | ' + IntToStr(P_Producto[18]) + ' | ' + IntToStr(P_Producto[19]) + ' | ' + IntToStr(P_Producto[20]) + ' | ' + IntToStr(P_Producto[21]) + ' | ' + IntToStr(P_Producto[22]) + ' | ' +
                                IntToStr(P_Producto[23]) + ' | ' + IntToStr(P_Producto[24]) + ' | ' + IntToStr(P_Producto[25]) + ' | ' + IntToStr(P_Producto[26]) + ' | ' + IntToStr(P_Producto[27]) + ' | ' + IntToStr(P_Producto[28]) + ' | ' + IntToStr(P_Producto[29]) + ' | ' + IntToStr(P_Producto[30]) + #13 + #10 +

                 'Rcodigo: ' + IntToStr(R_Codigo[1]) + ' | ' + IntToStr(R_Codigo[2]) + ' | ' + IntToStr(R_Codigo[3]) + ' | ' + IntToStr(R_Codigo[4]) + ' | ' + IntToStr(R_Codigo[5]) + ' | ' + IntToStr(R_Codigo[6]) + ' | ' + IntToStr(R_Codigo[7]) + ' | ' + IntToStr(R_Codigo[8]) + ' | ' + IntToStr(R_Codigo[9]) + ' | ' + IntToStr(R_Codigo[10]) + ' | ' +
                               IntToStr(R_Codigo[11]) + ' | ' + IntToStr(R_Codigo[12]) + ' | ' + IntToStr(R_Codigo[13]) + ' | ' + IntToStr(R_Codigo[14]) + ' | ' + IntToStr(R_Codigo[15]) + ' | ' + IntToStr(R_Codigo[16]) + ' | ' + IntToStr(R_Codigo[17]) + ' | ' + IntToStr(R_Codigo[18]) + ' | ' + IntToStr(R_Codigo[19]) + ' | ' + IntToStr(R_Codigo[20]) + ' | ' +
                               IntToStr(R_Codigo[21]) + ' | ' + IntToStr(R_Codigo[22]) + ' | ' + IntToStr(R_Codigo[23]) + ' | ' + IntToStr(R_Codigo[24]) + ' | ' + IntToStr(R_Codigo[25]) + ' | ' + IntToStr(R_Codigo[26]) + ' | ' + IntToStr(R_Codigo[27]) + ' | ' + IntToStr(R_Codigo[28]) + ' | ' + IntToStr(R_Codigo[29]) + ' | ' + IntToStr(R_Codigo[30]) + #13 + #10 +

                 'Bcodigo: ' + IntToStr(B_Codigo[1]) + ' | ' + IntToStr(B_Codigo[2]) + ' | ' + IntToStr(B_Codigo[3]) + ' | ' + IntToStr(B_Codigo[4]) + ' | ' + IntToStr(B_Codigo[5]) + ' | ' + IntToStr(B_Codigo[6]) + ' | ' + IntToStr(B_Codigo[7]) + ' | ' + IntToStr(B_Codigo[8]) + ' | ' + IntToStr(B_Codigo[9]) + ' | ' + IntToStr(B_Codigo[10]) + ' | ' + 
                               IntToStr(B_Codigo[11]) + ' | ' + IntToStr(B_Codigo[12]) + ' | ' + IntToStr(B_Codigo[13]) + ' | ' + IntToStr(B_Codigo[14]) + ' | ' + IntToStr(B_Codigo[15]) + ' | ' + IntToStr(B_Codigo[16]) + ' | ' + IntToStr(B_Codigo[17]) + ' | ' + IntToStr(B_Codigo[18]) + ' | ' + IntToStr(B_Codigo[19]) + ' | ' + IntToStr(B_Codigo[20]) + ' | ' +
                               IntToStr(B_Codigo[21]) + ' | ' + IntToStr(B_Codigo[22]) + ' | ' + IntToStr(B_Codigo[23]) + ' | ' + IntToStr(B_Codigo[24]) + ' | ' + IntToStr(B_Codigo[25]) + ' | ' + IntToStr(B_Codigo[26]) + ' | ' + IntToStr(B_Codigo[27]) + ' | ' + IntToStr(B_Codigo[28]) + ' | ' + IntToStr(B_Codigo[29]) + ' | ' + IntToStr(B_Codigo[30]) + #13 + #10 +

                 'Tcodigo: ' + IntToStr(T_Codigo[1]) + ' | ' + IntToStr(T_Codigo[2]) + ' | ' + IntToStr(T_Codigo[3]) + ' | ' + IntToStr(T_Codigo[4]) + ' | ' + IntToStr(T_Codigo[5]) + ' | ' + IntToStr(T_Codigo[6]) + ' | ' + IntToStr(T_Codigo[7]) + ' | ' + IntToStr(T_Codigo[8]) + ' | ' + IntToStr(T_Codigo[9]) + ' | ' + IntToStr(T_Codigo[10]) + ' | ' + 
                               IntToStr(T_Codigo[11]) + ' | ' + IntToStr(T_Codigo[12]) + ' | ' + IntToStr(T_Codigo[13]) + ' | ' + IntToStr(T_Codigo[14]) + ' | ' + IntToStr(T_Codigo[15]) + ' | ' + IntToStr(T_Codigo[16]) + ' | ' + IntToStr(T_Codigo[17]) + ' | ' + IntToStr(T_Codigo[18]) + ' | ' + IntToStr(T_Codigo[19]) + ' | ' + IntToStr(T_Codigo[20]) + ' | ' +
                               IntToStr(T_Codigo[21]) + ' | ' + IntToStr(T_Codigo[22]) + ' | ' + IntToStr(T_Codigo[23]) + ' | ' + IntToStr(T_Codigo[24]) + ' | ' + IntToStr(T_Codigo[25]) + ' | ' + IntToStr(T_Codigo[26]) + ' | ' + IntToStr(T_Codigo[27]) + ' | ' + IntToStr(T_Codigo[28]) + ' | ' + IntToStr(T_Codigo[29]) + ' | ' + IntToStr(T_Codigo[30]) + #13 + #10 +

                 'Cantidad: ' + IntToStr(C_Cantidad[1]) + ' | ' + IntToStr(C_Cantidad[2]) + ' | ' + IntToStr(C_Cantidad[3]) + ' | ' + IntToStr(C_Cantidad[4]) + ' | ' + IntToStr(C_Cantidad[5]) + ' | ' + IntToStr(C_Cantidad[6]) + ' | ' + IntToStr(C_Cantidad[7]) + ' | ' + IntToStr(C_Cantidad[8]) + ' | ' + IntToStr(C_Cantidad[9]) + ' | ' + IntToStr(C_Cantidad[10]) + ' | ' + 
                                IntToStr(C_Cantidad[11]) + ' | ' + IntToStr(C_Cantidad[12]) + ' | ' + IntToStr(C_Cantidad[13]) + ' | ' + IntToStr(C_Cantidad[14]) + ' | ' + IntToStr(C_Cantidad[15]) + ' | ' + IntToStr(C_Cantidad[16]) + ' | ' + IntToStr(C_Cantidad[17]) + ' | ' + IntToStr(C_Cantidad[18]) + ' | ' + IntToStr(C_Cantidad[19]) + ' | ' + IntToStr(C_Cantidad[20]) + ' | ' +
                                IntToStr(C_Cantidad[21]) + ' | ' + IntToStr(C_Cantidad[22]) + ' | ' + IntToStr(C_Cantidad[23]) + ' | ' + IntToStr(C_Cantidad[24]) + ' | ' + IntToStr(C_Cantidad[25]) + ' | ' + IntToStr(C_Cantidad[26]) + ' | ' + IntToStr(C_Cantidad[27]) + ' | ' + IntToStr(C_Cantidad[28]) + ' | ' + IntToStr(C_Cantidad[29]) + ' | ' + IntToStr(C_Cantidad[30]) + #13 + #10 +

                 'Subtotal: ' + FloatToStr(S_Subtotal[1]) + ' | ' + FloatToStr(S_Subtotal[2]) + ' | ' + FloatToStr(S_Subtotal[3]) + ' | ' + FloatToStr(S_Subtotal[4]) + ' | ' + FloatToStr(S_Subtotal[5]) + ' | ' + FloatToStr(S_Subtotal[6]) + ' | ' + FloatToStr(S_Subtotal[7]) + ' | ' + FloatToStr(S_Subtotal[8]) + ' | ' + FloatToStr(S_Subtotal[9]) + ' | ' + FloatToStr(S_Subtotal[10]) + ' | ' + 
                                FloatToStr(S_Subtotal[11]) + ' | ' + FloatToStr(S_Subtotal[12]) + ' | ' + FloatToStr(S_Subtotal[13]) + ' | ' + FloatToStr(S_Subtotal[14]) + ' | ' + FloatToStr(S_Subtotal[15]) + ' | ' + FloatToStr(S_Subtotal[16]) + ' | ' + FloatToStr(S_Subtotal[17]) + ' | ' + FloatToStr(S_Subtotal[18]) + ' | ' + FloatToStr(S_Subtotal[19]) + ' | ' + FloatToStr(S_Subtotal[20]) + ' | ' +
                                FloatToStr(S_Subtotal[21]) + ' | ' + FloatToStr(S_Subtotal[22]) + ' | ' + FloatToStr(S_Subtotal[23]) + ' | ' + FloatToStr(S_Subtotal[24]) + ' | ' + FloatToStr(S_Subtotal[25]) + ' | ' + FloatToStr(S_Subtotal[26]) + ' | ' + FloatToStr(S_Subtotal[27]) + ' | ' + FloatToStr(S_Subtotal[28]) + ' | ' + FloatToStr(S_Subtotal[29]) + ' | ' + FloatToStr(S_Subtotal[30]) + #13 + #10 +
                'FIN BUCLE' + #13 + #10 +
                'Total: ' + FloatToStr(B.Total) + #13 + #10 +
                'Borrado: ' + BoolToStr(B.borrado) + #13 + #10 +
                'Operador: ' + B.operador + #13 + #10 +
                'Compra: ' + intToStr(i)+ #13 + #10 +
                '' + #13 + #10 +
                '----------------------------------------------------------------------------------------------------'
                + #13 + #10;

       i:= i + 1;
  end;
  
  writeln(DB, s);
  close(db);
end;


end.








