unit Ussers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, fyp, Libreria, LibreriaAux;

type
  TForm5= class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RichEdit1: TRichEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //REGISTRO



var
  Form5: TForm5;
  ruta:string;
  pos:integer;
  aux:integer;

implementation

uses Unit1;

{$R *.dfm}

//****************************************** PROCEDURES **************************////

procedure Guardar();
begin
  //Guardamos
  seek(Libreria.A, filesize(Libreria.A));
  write(Libreria.A, R);
end;

procedure Clarear();
begin
  //Clareamos los los edits
  Ussers.Form5.Edit1.Clear;
  Ussers.Form5.Edit2.Clear;
  Ussers.Form5.Edit3.Clear;
  Ussers.Form5.Edit4.Clear;
  Ussers.Form5.Edit5.Clear;
  Ussers.Form5.RichEdit1.Clear;
  Ussers.Form5.RadioButton1.Checked := false;
  Ussers.Form5.RadioButton2.Checked:= false;
end;

procedure DeshabilitarBtns();
begin
  Ussers.Form5.BitBtn2.Enabled:= false;
  Ussers.Form5.BitBtn3.Enabled:= false;
  Ussers.Form5.BitBtn4.Enabled:= false;
end;
procedure habilitarBtns();
begin
  Ussers.Form5.BitBtn2.Enabled:= true;
  Ussers.Form5.BitBtn3.Enabled:= true;
  Ussers.Form5.BitBtn4.Enabled:= true;
end;
procedure deshabilitarEdits();
begin
  Ussers.Form5.edit2.Enabled:= false;
  Ussers.Form5.edit3.Enabled:= false;
  Ussers.Form5.edit4.Enabled:= false;
  Ussers.Form5.edit5.Enabled:= false;
  Ussers.Form5.RichEdit1.Enabled:= false;
end;
procedure habilitarEdits();
begin
  Ussers.Form5.edit2.Enabled:= true;
  Ussers.Form5.edit3.Enabled:= true;
  Ussers.Form5.edit4.Enabled:= true;
  Ussers.Form5.edit5.Enabled:= true;
  Ussers.Form5.RichEdit1.Enabled:= true;
end;

procedure ErrorCampoVacio();
begin
  messageDlg('Este campo no puede estar vacio ', mtError,[mbRetry],0);
end;

//****************************************** PROCEDURESFIN **************************////
procedure TForm5.BitBtn1Click(Sender: TObject);
begin

  if campoVacio(edit1.text) then
  begin
     edit1.SetFocus;
     ErrorCampoVacio;
     Libreria.CerrarArchivo(libreria.A);
  end
  else
  begin
    Libreria.AbrirArchivo(Libreria.A);
    pos:= Libreria.BuscarStr(Libreria.A, edit1.text);

    if pos <> -1 then
    begin
      //Abro el archivo
      Libreria.CapturarInfo(Libreria.A,pos,R);
      messageDlg('SE ENCONTRO', mtConfirmation,[mbOk],0);
      habilitarEdits;
      habilitarBtns;
      edit1.Enabled:= false;
      Bitbtn1.Enabled:= false;
      Bitbtn2.Enabled:= false;
      edit1.text:= R.usuario;
      edit2.text:= R.nombreApellido;
      edit3.text:= R.dni;
      edit4.text:= R.password;
      edit5.text:= R.password;
      RichEdit1.Text:= R.descripcion;
      if R.perfil = 1 then
         RadioButton1.Checked:= true
      else
         RadioButton2.Checked:= true;

      //cierrlo el archivo
      Libreria.CerrarArchivo(libreria.A);
    end
    else
    begin
      messageDlg('NO SE ENCONTRO', mtConfirmation,[mbOk],0);
      habilitarEdits;
      habilitarBtns;
      edit1.Enabled:= false;
      bitBtn1.Enabled:= false;
      bitBtn3.Enabled:= false;
      bitBtn4.Enabled:= false;
      edit2.setfocus;
    end;
  end;


end;//Procedure TForm1.BitBtn1Click

procedure TForm5.BitBtn5Click(Sender: TObject);
begin
Close;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
 {
  Antes de ejecutar este codigo crear parametros de errores
  - Usuario Menor a 8 Digitos
  - Nombre y Apellido Menor a 32 Digitos
  - DNI tiene que ser un Entero
  - Clave Menor a 8 Digitos
  - Descripcion Menor a 256 palabras

  }

  //Cargamos el Registro
 if RadioButton1.Checked then
 begin
  Libreria.AbrirArchivo(Libreria.A);
  R.usuario:= Edit1.text;
  R.nombreApellido:= Edit2.text;
  R.dni:= Edit3.text;
  R.password:= Edit4.text;
  R.descripcion:= RichEdit1.Text;
  R.perfil:= 1;
  R.borrado:= false;
  deshabilitarEdits;
  DeshabilitarBtns;
  BitBtn1.Enabled:= true;
  Edit1.Enabled:= true;
  guardar;
  Clarear;
  messagedlg('El registro ha sido agregado', mtInformation, [mbOK],0);
  Libreria.CerrarArchivo(libreria.A);

 end
 else if RadioButton2.Checked then
 begin
  Libreria.AbrirArchivo(Libreria.A);
  R.usuario:= Edit1.text;
  R.nombreApellido:= Edit2.text;
  R.dni:= Edit3.text;
  R.password:= Edit4.text;
  R.descripcion:= RichEdit1.Text;
  R.perfil:= 2;
  R.borrado:= false;
  deshabilitarEdits;
  DeshabilitarBtns;
  BitBtn1.Enabled:= true; 
  Edit1.Enabled:= true;
  guardar;
  Clarear;
  messagedlg('El registro ha sido agregado', mtInformation, [mbOK],0);
  Libreria.CerrarArchivo(libreria.A);

 end
 else
   messageDlg('Error, No hay ningun Perfil Seleccionado', mtError,[mbRetry],0);
end;


procedure TForm5.FormCreate(Sender: TObject);
begin
deshabilitarEdits;
DeshabilitarBtns;

ruta:='Db\usuarios\';
Libreria.Activar(Libreria.A, ruta, 'dbUsuarios.dat');
end;


procedure TForm5.Edit2Exit(Sender: TObject);
begin
  if campoVacio(edit2.text) then
  begin
    ErrorCampoVacio;
    edit2.setfocus;
  end;
end;

procedure TForm5.Edit3Exit(Sender: TObject);
begin
  if campoVacio(edit3.text)then
  begin
    ErrorCampoVacio;
    edit3.setfocus;
  end;
end;

procedure TForm5.Edit4Exit(Sender: TObject);
begin
  if campoVacio(edit4.text)then
  begin
    ErrorCampoVacio;
    edit4.setfocus;
  end;
end;

procedure TForm5.Edit5Exit(Sender: TObject);
begin
  if campoVacio(edit5.text)then
  begin
    ErrorCampoVacio;
    edit5.setfocus;
  end;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
 libreria.AbrirArchivo(libreria.A);
 pos:= Libreria.BuscarStr(Libreria.A, edit1.text);
 R.usuario:= Edit1.text;
 R.nombreApellido:= Edit2.text;
 R.dni:= Edit3.text;
 R.password:= Edit4.text;
 R.descripcion:= RichEdit1.Text;
 R.perfil:= 1;
 R.borrado:= false;
 deshabilitarEdits;
 DeshabilitarBtns;
 BitBtn1.Enabled:= true;
 Edit1.Enabled:= true;
 Modificar(libreria.A,pos,R);
 Clarear;
 messagedlg('Se ha guardado', mtInformation, [mbOK],0);
 Libreria.CerrarArchivo(libreria.A);
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin  
 libreria.AbrirArchivo(libreria.A);
 pos:= Libreria.BuscarStr(Libreria.A, edit1.text);
 R.usuario:= Edit1.text;
 R.nombreApellido:= Edit2.text;
 R.dni:= Edit3.text;
 R.password:= Edit4.text;
 R.descripcion:= RichEdit1.Text;
 R.perfil:= 1;
 R.borrado:= true;
 deshabilitarEdits;
 DeshabilitarBtns;
 BitBtn1.Enabled:= true;
 Edit1.Enabled:= true;
 Modificar(libreria.A,pos,R);
 Clarear;
 messagedlg('Se ha borrado', mtInformation, [mbOK],0);
 Libreria.CerrarArchivo(libreria.A);

end;

procedure TForm5.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#8,'0'..'9',DecimalSeparator,'.','-']) then key:=#0;
end;

end.
     
