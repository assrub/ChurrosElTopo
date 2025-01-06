program proyectohistorial;

uses
  Forms,
  Historial in 'Historial.pas' {FormHistorial},
  LibGastos in '..\..\FyP\gastos\LibGastos.pas',
  registroVentas in '..\..\FyP\ventas\registroVentas.pas',
  archivosVentas in '..\..\FyP\ventas\archivosVentas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormHistorial, FormHistorial);
  Application.Run;
end.
