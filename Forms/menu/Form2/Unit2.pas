unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    BitBtn6: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    AltaUsuario: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure AltaUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Ussers;

{$R *.dfm}

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
form1.show;
form2.Hide;
end;



procedure TForm2.AltaUsuarioClick(Sender: TObject);
begin
form5.show;
end;

end.
