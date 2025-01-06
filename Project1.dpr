program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Forms\menu\Form2\Unit2.pas' {Form2},
  Unit3 in 'Forms\menu\Form3\Unit3.pas' {Form3},
  Unit4 in 'Forms\menu\Form3\Unit4.pas' {Form4},
  Ussers in 'forms\usuarios\Ussers.pas' {Form5},
  fyp in 'FyP\usuarios\fyp.pas',
  LibreriaAux in 'FyP\usuarios\LibreriaAux.pas',
  Libreria in 'FyP\usuarios\Libreria.pas',
  Unit6 in 'Forms\Status\Unit6.pas' {Form6},
  ventas in 'Forms\ventas\ventas.pas' {Form7},
  CantYRellenos in 'Forms\ventas\subForms\Form Cantidades y Rellenos\CantYRellenos.pas' {Form8},
  archivosVentas in 'FyP\ventas\archivosVentas.pas',
  fypVentas in 'FyP\ventas\fypVentas.pas',
  registroVentas in 'FyP\ventas\registroVentas.pas',
  Unit9 in 'Forms\ventas\subForms\Form Precios\Unit9.pas' {Form9},
  registroPrecios in 'FyP\ventas\registroPrecios.pas',
  archivosPrecios in 'FyP\ventas\archivosPrecios.pas',
  FunyProc in 'FyP\status\FunyProc.pas',
  crt_D7 in 'FyP\crt\crt_D7.pas',
  Historial in 'Forms\historial\Historial.pas' {FormHistorial},
  Gastos in 'Forms\gastos\Gastos.pas' {FrmGastos},
  LibGastos in 'FyP\gastos\LibGastos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TFormHistorial, FormHistorial);
  Application.CreateForm(TFrmGastos, FrmGastos);
  Application.Run;
end.

