program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Forms\menu\Form2\Unit2.pas' {Form2},
  Unit3 in 'Forms\menu\Form3\Unit3.pas' {Form3},
  Unit4 in 'Forms\menu\Form3\Unit4.pas' {Form4},
  Ussers in 'forms\usuarios\Ussers.pas' {Form5},
    Unit1 in 'Forms\Ventas\ Unit1.pas'  {Form6}
  fyp in 'FyP\usuarios\fyp.pas',
  LibreriaAux in 'FyP\usuarios\LibreriaAux.pas',
  Libreria in 'FyP\usuarios\Libreria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
