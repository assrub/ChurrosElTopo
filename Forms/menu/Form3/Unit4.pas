unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, Libreria, LibreriaAux;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  
implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  stringgrid1.cells[0,0]:= 'Usuario';
  stringgrid1.cells[1,0]:= 'Nombre y Apellido';
  stringgrid1.cells[2,0]:= 'DNI';
  stringgrid1.cells[3,0]:= 'Fecha Creaci�n';

end;//FORM CREATE

end.
 