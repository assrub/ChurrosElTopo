unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, fyp, Libreria, LibreriaAux;
const
  usuario='administrador';
  password='1234';
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
pos:integer;
begin
	//Abrimos el Archivo
	Libreria.AbrirArchivo(Libreria.A);
	//Buscamos en Archivos la posicion de User.text
    pos:= Libreria.BuscarStr(Libreria.A, User.text);
	
     //Si la posicion no es -1 (significa que lo encontro)
 	 if pos <> -1 then
	 begin
    //EL USUARIO SE HA ENCONTRADO

    
	  //Capturo la información que hay en el Archivo del usuario
    Libreria.CapturarInfo(Libreria.A,pos,R);
    if (USER.text = R.usuario) and (PASSWORD.text = R.PASSWORD) then
    messageDlg('BIENVENIDO!!!', mtConfirmation,[mbOk],0)
    form1.show;
    form2.show;
    else
    messageDlg('CONTRASEÑA INVALIDA', mtConfirmation,[mbOk],0);
	 end
   else
   messageDlg('USUARIO NO VALIDO', mtConfirmation,[mbOk],0);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
ruta:string;
begin
ruta:='Db\usuarios\';
Libreria.Activar(Libreria.A, ruta, 'dbUsuarios.dat');
end;

end.
