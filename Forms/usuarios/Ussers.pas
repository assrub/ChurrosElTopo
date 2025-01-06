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
    BitBtn6: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
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

  numUser:integer;
implementation

uses Unit1, Unit4, Unit2, Unit9, Unit3, Unit6, ventas, CantYRellenos;

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
  USSERS.Form5.CheckBox1.checked:= false;
  USSERS.Form5.CheckBox2.checked:= false;
  USSERS.Form5.CheckBox3.checked:= false;
  USSERS.Form5.CheckBox4.checked:= false;
  USSERS.Form5.CheckBox5.checked:= false;
  USSERS.Form5.CheckBox6.checked:= false;
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


//****************************************** PROCEDURESFIN **************************////
procedure TForm5.BitBtn1Click(Sender: TObject);
begin

  if campoVacio(edit1.text) then
  begin
    
  end
  else
  begin
    Libreria.AbrirArchivo(Libreria.A);
    pos:= Libreria.BuscarStr(Libreria.A, edit1.text);

    if pos <> -1 then
    begin
      //Abro el archivo
      Libreria.CapturarInfo(Libreria.A,pos,B);
      messageDlg('SE ENCONTRO', mtConfirmation,[mbOk],0);
      habilitarEdits;
      habilitarBtns;
      edit1.Enabled:= false;
      Bitbtn1.Enabled:= false;
      Bitbtn2.Enabled:= false;
      edit1.text:= B.usuario;
      edit2.text:= B.nombreApellido;
      edit3.text:= B.dni;
      edit4.text:= B.password;
      edit5.text:= B.password;
      RichEdit1.Text:= B.descripcion;

      checkbox1.checked:= B.Acc_Alta_Usuario;
      checkbox2.checked:= B.Acc_Gastos;
      checkbox3.checked:= B.Acc_Ventas;
      checkbox4.checked:= B.Acc_Mod_Precios;
      checkbox5.checked:= B.Acc_Historial;
      checkbox6.checked:= B.Acc_Status;

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
    form5.edit1.enabled:= true;
    form5.SetFocus;
    form5.edit1.clear;
    form5.Edit2.Clear;
    form5.Edit3.Clear;
    form5.Edit4.Clear;
    form5.Edit5.Clear;
    form5.RichEdit1.Clear;

    form5.CheckBox1.Checked:= false;
    form5.CheckBox2.Checked:= false;
    form5.CheckBox3.Checked:= false;
    form5.CheckBox4.Checked:= false;
    form5.CheckBox5.Checked:= false;
    form5.CheckBox6.Checked:= false;

    form5.BitBtn1.Enabled:= true;
    form5.BitBtn2.Enabled:= false;
    form5.BitBtn3.Enabled:= false;
    form5.BitBtn4.Enabled:= false;
    form5.BitBtn5.Enabled:= true;
    form5.BitBtn6.Enabled:= true;

    close;
end;

{SI NO ENCUENTRA USUARIO LE ASIGNO UN NUM DE USUARIO }
Procedure numUsser(var numUser:integer);
var
i:integer;
begin  

 i:= UltimoElemento(Libreria.A);

 if R.clave < 1 then
   numUser:= 1
 else
   numUser:= numUser + 1;
   
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin

 if not campovacio(edit2.Text) and not campovacio(edit3.Text) and not campovacio(edit4.Text) and not campovacio(edit5.Text) then
 begin
    //Cargamos el Registro
    if (checkbox1.Checked = False) and (checkbox2.Checked = False) and (checkbox3.Checked = False) and (checkbox4.Checked = False) and (checkbox5.Checked = False) and (checkbox6.Checked = False)then
        messageDlg('Error, No hay ningun Permiso Seleccionado', mtError,[mbRetry],0)
    else
    begin
     //Acceso Alta usuario
     if checkbox1.checked = true then
       R.Acc_Alta_Usuario:= true
     else
       R.Acc_Alta_Usuario:= False;
     //Acceso Gastos
     if checkbox2.checked = true then
       R.Acc_Gastos:= true
     else
       R.Acc_Gastos:= False;
     //Aceeso Ventas
     if checkbox3.checked = true then
       R.Acc_Ventas:= true
     else
       R.Acc_Ventas:= False;
     //Acceso Modificar Precios Productos
     if (checkbox4.checked = true) and (checkbox3.checked = true) then
       R.Acc_Mod_Precios:= true
     else if checkbox4.checked = false then
       R.Acc_Mod_Precios:= False
     else
       messageDlg('PARA ESTA OPCION, TAMBIEN DEBE HABILITAR EL ACCESO A VENTAS', mtError,[mbRetry],0);
     //Acceso a Historial
     if checkbox5.checked = true then
       R.Acc_Historial:= true
     else
       R.Acc_Historial:= False;
     //Acceso a Status
     if checkbox6.checked = true then
       R.Acc_Status:= true
     else
       R.Acc_Status:= False;

     Libreria.AbrirArchivo(Libreria.A);
     R.usuario:= Edit1.text;
     R.nombreApellido:= Edit2.text;
     R.dni:= Edit3.text;
     R.password:= Edit4.text;
     R.descripcion:= RichEdit1.Text;
     R.borrado:= false;
     numUsser(numUser);
     R.clave:= numUser;
     R.Fecha:= now;
     guardar;
     Libreria.CerrarArchivo(libreria.A);
     deshabilitarEdits;
     DeshabilitarBtns;
     BitBtn1.Enabled:= true;
     Edit1.Enabled:= true;
     Clarear;
     messagedlg('El registro ha sido agregado', mtInformation, [mbOK],0);
     close;
  end;//2� IF
end
else
begin
  if campovacio(edit2.text) or  campovacio(edit3.text) or campovacio(edit4.text) or campovacio(edit5.text) then
     messageDlg('Error, Ha dejado uno o m�s campos vacios', mtError,[mbRetry],0);
end;
end;//PROCEDURE

procedure TForm5.FormCreate(Sender: TObject);
begin
 DeshabilitarEdits;
 DeshabilitarBtns;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
 form2.close;
 form3.close;
 form4.close;
 form5.close;
 form6.close;
 form7.close;
 form8.close;
 form9.close;

 libreria.AbrirArchivo(libreria.A);
 pos:= Libreria.BuscarStr(Libreria.A, edit1.text);
 libreria.CapturarInfo(Libreria.A, pos, b); 

 B.usuario:= Edit1.text;
 B.nombreApellido:= Edit2.text;
 B.dni:= Edit3.text;
 B.password:= Edit4.text;
 B.descripcion:= RichEdit1.Text;
 B.borrado:= false;
 B.clave:= numUser;

 if checkbox1.checked = true then
    B.Acc_Alta_Usuario:= true
 else
    B.Acc_Alta_Usuario:= False;

    //Acceso Gastos
 if checkbox2.checked = true then
    B.Acc_Gastos:= true
 else
    B.Acc_Gastos:= False;

 //Aceeso Ventas
 if checkbox3.checked = true then
    B.Acc_Ventas:= true
 else
    B.Acc_Ventas:= False;

 //Acceso Modificar Precios Productos
 if (checkbox4.checked = true) and (checkbox3.checked = true) then
     B.Acc_Mod_Precios:= true
 else if checkbox4.checked = false then
     B.Acc_Mod_Precios:= False
 else
     messageDlg('PARA ESTA OPCION, TAMBIEN DEBE HABILITAR EL ACCESO A VENTAS', mtError,[mbRetry],0);

 //Acceso a Historial
 if checkbox5.checked = true then
    B.Acc_Historial:= true
 else
    B.Acc_Historial:= False;

 //Acceso a Status
 if checkbox6.checked = true then
    B.Acc_Status:= true
 else
    B.Acc_Status:= False;

 deshabilitarEdits;
 DeshabilitarBtns;
 BitBtn1.Enabled:= true;
 Edit1.Enabled:= true;
 Modificar(libreria.A,pos,B);
 Clarear;
 messagedlg('Se ha guardado', mtInformation, [mbOK],0);
 Libreria.CerrarArchivo(libreria.A);
 form1.show;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin  
 libreria.AbrirArchivo(libreria.A);
 pos:= Libreria.BuscarStr(Libreria.A, edit1.text);
 Libreria.CapturarInfo(Libreria.a,pos,B); 
 B.usuario:= Edit1.text;
 B.nombreApellido:= Edit2.text;
 B.dni:= Edit3.text;
 B.password:= Edit4.text;
 B.descripcion:= RichEdit1.Text;
 B.borrado:= true;
 deshabilitarEdits;
 DeshabilitarBtns;
 BitBtn1.Enabled:= true;
 Edit1.Enabled:= true;
 Modificar(libreria.A,pos,B);
 Clarear;
 messagedlg('Se ha borrado', mtInformation, [mbOK],0);
 Libreria.CerrarArchivo(libreria.A);

end;

procedure TForm5.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in [#8,'0'..'9',DecimalSeparator,'.','-']) then key:=#0;
end;

procedure TForm5.BitBtn6Click(Sender: TObject);
var
i,j:integer;
pos:integer;
begin
  Libreria.AbrirArchivo(Libreria.A);

  pos:= Libreria.BuscarInt(Libreria.A, 1);

  i:= 0;
  j:= 0;
  if pos <> -1 then
  begin
    while not EOF(Libreria.A) do
    begin      
        Libreria.CapturarInfo(Libreria.A,i,B);
        if B.borrado = false then
        begin  
          form4.stringgrid1.RowCount:= j + 2;
          form4.stringgrid1.cells[0,j + 1]:= B.usuario;
          form4.stringgrid1.cells[1,j + 1]:= B.nombreApellido;
          form4.stringgrid1.cells[2,j + 1]:= B.dni;
          form4.stringgrid1.cells[3,j + 1]:= DateTimeToStr(B.Fecha);
          j:= j + 1;
        end;//if borrado
     i:= i + 1;
    end;//while
  end;//if pos

Libreria.CerrarArchivo(libreria.A);
form4.show;
end;//procedure

end.

