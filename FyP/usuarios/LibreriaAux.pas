unit LibreriaAux;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  tipoRegUsuario=record
                usuario: string[20];
                nombreApellido: string[32];
                dni: string[20];
                password: string[20];
                descripcion: string[255];
                perfil: integer;
                borrado: boolean;
                clave:integer;
                end;
var
   R: tipoRegUsuario;

   
implementation

end.
