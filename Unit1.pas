unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;
const
  usuario='administrador';
  password='admin123';
type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    USER: TEdit;
    PASSWORD: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

if trim(user.text)=''
  then
    begin
      application.messagebox(pchar('¡Falta ingresar el usuario!'), 'ATENCION', mb_ok);
      user.setfocus;
    end;

if trim(password.text)=''
  then
    begin
      application.messagebox(pchar('¡Falta ingresar la contraseña!'), 'ATENCION', mb_ok);
      password.setfocus;
    end;
form2.show;
form1.Hide;
end;

end.
