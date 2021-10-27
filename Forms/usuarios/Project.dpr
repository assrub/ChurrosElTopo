program Project;

uses
  Forms,
  Ussers in 'Ussers.pas' {Form1},
  fyp in '..\..\FyP\usuarios\fyp.pas',
  LibreriaAux in '..\..\FyP\usuarios\LibreriaAux.pas',
  Libreria in '..\..\FyP\usuarios\Libreria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
