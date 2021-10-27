unit Libreria;

interface 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, fyp, LibreriaAux;

Type
   tipoArchivo= file of tipoRegUsuario;

var
  A:tipoArchivo;
  ruta:string;
  ARCHIVO:string;
  
procedure Activar (var A:tipoArchivo; ruta:string; archivo:string);
procedure AbrirArchivo(var A:tipoArchivo);
procedure CerrarArchivo(var A:tipoArchivo);
function Posicion(Clave:integer; var A:tipoArchivo):integer; //Devuelve en que posición del archivo este X Registro.
procedure CapturarInfo(Var A:tipoArchivo; pos:integer; var R:tipoRegUsuario); //Capturamos por variable los datos de la posición dada.
procedure Instertar(Var A:tipoArchivo; pos:integer; R:tipoRegUsuario); //Inserta los datos en la posicion del archivo dada.
procedure Eliminar(var A:tipoArchivo; pos:integer); //ELIMINA O BORRA LOS DATOS DEL ARHCHIVO
Function ArchivoVacio (var A:tipoArchivo):boolean;
Function PrimerElemento(var A:tipoArchivo):integer;
Function UltimoElemento(var A:tipoArchivo):integer;
procedure EliminarArchivo(var A:tipoArchivo);
procedure Modificar (var A:tipoArchivo; pos:integer; R:tipoRegUsuario);
Function BuscarInt(var A:tipoArchivo; clave:integer):integer;
Function BuscarStr(var A:tipoArchivo; user:string):integer;

implementation
procedure Activar (var A:tipoarchivo; ruta:string; archivo:string);
BEGIN

  ASSIGN(A,RUTA+ARCHIVO);
  {$I-}
   RESET(A);
  {$I+}
  IF IORESULT <> 0
  THEN
      BEGIN
          REset(A); //Creo el archivo
          CLOSE(A);   //Lo cierro
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
  R:tipoRegUsuario;
  Hallado,mayor:boolean;
BEGIN
  Hallado:= False;
  seek(A, 0); //Posicionamos en el Archivo
  mayor:= false;
  while not (eof(A)) and not (hallado) and not (mayor) do
  begin
    read(A,R);
    if R.clave > Clave then
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

procedure CapturarInfo(Var A:tipoArchivo; pos:integer; var R:tipoRegUsuario);
BEGIN
    seek(A,pos);
    read(A,R);
END;

procedure Instertar(Var A:tipoArchivo; pos:integer; R:tipoRegUsuario);
VAR
  RAUX:tipoRegUsuario;
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


procedure Eliminar(var A:tipoArchivo; pos:integer);
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


procedure Modificar (var A:tipoArchivo; pos:integer; R:tipoRegUsuario);
BEGIN
     SEEK(A,POS);
     WRITE(A,R);
END;


Function BuscarInt(var A:tipoArchivo; clave:integer):integer;
VAR
   R:tipoRegUsuario;
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

Function BuscarStr(var A:tipoArchivo; user:string):integer;
VAR
   R:tipoRegUsuario;
   ENCONTRE:BOOLEAN;
BEGIN
     ENCONTRE:= FALSE;
     SEEK(A,0);
     WHILE NOT EOF(A) AND NOT ENCONTRE DO
     BEGIN
          READ(A,R);
          IF (UPPERCASE(user) = UPPERCASE(R.usuario)) AND not (R.borrado) THEN
             ENCONTRE:= TRUE;
     END;
     IF ENCONTRE THEN
       BuscarStr:= FILEPOS(A) -1
     ELSE
       BuscarStr:= -1;
END;
end.








