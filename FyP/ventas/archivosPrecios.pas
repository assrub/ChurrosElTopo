unit archivosPrecios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, registroPrecios;


Type
   tipoArchivo= file of Tprecio;


var
  A:tipoArchivo;
  ruta:string;
  ARCHIVO:string;
  
procedure Activar (var A:tipoArchivo; ruta:string; archivo:string);
procedure AbrirArchivo(var A:tipoArchivo);
procedure CerrarArchivo(var A:tipoArchivo);
function Posicion(Clave:integer; var A:tipoArchivo):integer; //Devuelve en que posici�n del archivo este X Registro.
procedure CapturarInfo(Var A:tipoArchivo; pos:integer; var R:Tprecio); //Capturamos por variable los datos de la posici�n dada.
procedure Instertar(Var A:tipoArchivo; pos:integer; R:Tprecio); //Inserta los datos en la posicion del archivo dada.
procedure Eliminar2(var A:tipoArchivo; pos:integer); //ELIMINA O BORRA LOS DATOS DEL ARHCHIVO
Function ArchivoVacio (var A:tipoArchivo):boolean;
Function PrimerElemento(var A:tipoArchivo):integer;
Function UltimoElemento(var A:tipoArchivo):integer;
procedure EliminarArchivo(var A:tipoArchivo);
procedure Modificar (var A:tipoArchivo; pos:integer; R:Tprecio);
Function BuscarInt(var A:tipoArchivo; clave:integer):integer;

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
      {
          RESET(A); //Creo el archivo
          CLOSE(A);   //Lo cierro
          RESET(A);   //Lo vuelvo abrir
      }
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
  R:Tprecio;
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

procedure CapturarInfo(Var A:tipoArchivo; pos:integer; var R:Tprecio);
BEGIN
    seek(A,pos);
    read(A,R);
END;

procedure Instertar(Var A:tipoArchivo; pos:integer; R:Tprecio);
VAR
  RAUX:Tprecio;
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
          READ(A,P);

          IF NOT P.BORRADO THEN
          POS:= FILEPOS(A)-1;
          SEEK(A,POS);
          WRITE(A,P);
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


procedure Modificar (var A:tipoArchivo; pos:integer; R:Tprecio);
BEGIN
     SEEK(A,POS);
     WRITE(A,R);
END;


Function BuscarInt(var A:tipoArchivo; clave:integer):integer;
VAR
   P:Tprecio;
   ENCONTRE:BOOLEAN;
BEGIN
     ENCONTRE:= FALSE;
     SEEK(A,0);
     WHILE NOT EOF(A) AND NOT ENCONTRE DO
     BEGIN
          READ(A,P);
          IF P.clave  = CLAVE THEN
             ENCONTRE:= TRUE;
     END;
     IF ENCONTRE THEN
       BuscarInt:= FILEPOS(A) -1
     ELSE
       BuscarInt:= -1;
END;


end.








