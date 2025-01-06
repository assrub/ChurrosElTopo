program GastosProject;

uses
  Forms,
  Gastos in 'Gastos.pas' {FrmGastos},
  LibGastos in '..\..\FyP\gastos\LibGastos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmGastos, FrmGastos);
  Application.Run;
end.
