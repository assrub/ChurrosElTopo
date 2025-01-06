unit ventas;

interface

uses
  Windows, crt_D7, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, unit1, CantYRellenos,
  archivosVentas, registroVentas, fypVentas, Menus, Unit6, FunyProc;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    Panel2: TPanel;
    Image7: TImage;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    Panel5: TPanel;
    StaticText11: TStaticText;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    Panel6: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    SpeedButton2: TSpeedButton;
    Image8: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  cont:integer;
  rutDbVentas:string;
  
  TOTAL:REAL;
implementation

uses Unit2, Unit9;

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
begin
form2.Hide;
cont:=0; 
end;

procedure TForm7.Image1Click(Sender: TObject); //CHURRO
begin
producto:=1; //Global

form8.Label3.Caption:= 'BAÑADO';

form8.edit1.clear;

form8.combobox1.Clear;
form8.combobox1.Items.Add('01 - Simple');
form8.combobox1.Items.Add('02 - Dulce de Leche');
form8.combobox1.Items.Add('03 - Crema Pastelera');
form8.combobox1.Items.Add('04 - Chocolate');
form8.combobox1.Items.Add('05 - Membrillo');
form8.combobox1.Items.Add('06 - Batata');
form8.combobox1.Items.Add('07 - Nutella');
form8.combobox1.Items.Add('08 - Oreo');
form8.combobox1.Items.Add('09 - Bon o Bon');
form8.combobox1.Items.Add('10 - Marroc');
form8.combobox1.Items.Add('11 - Banana Split');
form8.combobox1.Items.Add('12 - Dulce de Almendras');
form8.combobox1.Items.Add('13 - Roquefort');
form8.combobox1.Items.Add('14 - Queso Cheddar');
form8.combobox1.Items.Add('15 - Jamon y Queso');
form8.combobox1.ItemIndex:= 0;

form8.combobox2.Clear;
form8.combobox2.Items.Add('01 - Sin');
form8.combobox2.Items.Add('02 - Tradicional');
form8.combobox2.ItemIndex:= 0;

form8.show;
form8.Edit1.SelectAll;
end;

procedure TForm7.Image2Click(Sender: TObject);//CUBANITO
begin
producto:=2;

form8.Label3.Caption:= 'BAÑADO';

form8.edit1.clear;

form8.combobox1.Clear;
form8.combobox1.Items.Add('01 - Simple');
form8.combobox1.Items.Add('02 - Dulce de Leche');
form8.combobox1.Items.Add('03 - Crema Pastelera');
form8.combobox1.Items.Add('04 - Chocolate');
form8.combobox1.Items.Add('05 - Membrillo');
form8.combobox1.Items.Add('06 - Batata');
form8.combobox1.Items.Add('07 - Nutella');
form8.combobox1.Items.Add('08 - Oreo');
form8.combobox1.Items.Add('09 - Bon o Bon');
form8.combobox1.Items.Add('10 - Marroc');
form8.combobox1.Items.Add('11 - Banana Split');
form8.combobox1.Items.Add('12 - Dulce de Almendras');
form8.combobox1.ItemIndex:= 0;

form8.combobox2.Clear;
form8.combobox2.Items.Add('01 - Sin');
form8.combobox2.Items.Add('02 - Tradicional');
form8.combobox2.ItemIndex:= 0;

form8.show;
end;

procedure TForm7.Image3Click(Sender: TObject);//DONAS
begin
producto:=3;

form8.Label3.Caption:= 'BAÑADO';

form8.edit1.clear;

form8.combobox1.Clear;
form8.combobox1.Items.Add('01 - Simple');
form8.combobox1.Items.Add('02 - Dulce de Leche');
form8.combobox1.Items.Add('03 - Crema Pastelera');
form8.combobox1.Items.Add('04 - Chocolate');
form8.combobox1.Items.Add('05 - Membrillo');
form8.combobox1.Items.Add('06 - Batata');
form8.combobox1.Items.Add('07 - Nutella');
form8.combobox1.Items.Add('08 - Oreo');
form8.combobox1.Items.Add('09 - Bon o Bon');
form8.combobox1.Items.Add('10 - Marroc');
form8.combobox1.Items.Add('11 - Banana Split');
form8.combobox1.Items.Add('12 - Dulce de Almendras');
form8.combobox1.ItemIndex:= 0;

form8.combobox2.Clear; 
form8.combobox2.Items.Add('01 - Sin');
form8.combobox2.ItemIndex:= 0;

form8.show;
end;

procedure TForm7.Image7Click(Sender: TObject);//BOLAS
begin
producto:=4;

form8.Label3.Caption:= 'BAÑADO';

form8.edit1.clear;

form8.combobox1.Clear;
form8.combobox1.Items.Add('01 - Simple');
form8.combobox1.Items.Add('02 - Dulce de Leche');
form8.combobox1.Items.Add('03 - Crema Pastelera');
form8.combobox1.Items.Add('04 - Chocolate');
form8.combobox1.Items.Add('05 - Membrillo');
form8.combobox1.Items.Add('06 - Batata');
form8.combobox1.Items.Add('07 - Nutella');
form8.combobox1.Items.Add('08 - Oreo');
form8.combobox1.Items.Add('09 - Bon o Bon');
form8.combobox1.Items.Add('10 - Marroc');
form8.combobox1.Items.Add('11 - Banana Split');
form8.combobox1.Items.Add('12 - Dulce de Almendras');
form8.combobox1.Items.Add('13 - Roquefort');
form8.combobox1.Items.Add('14 - Queso Cheddar');
form8.combobox1.Items.Add('15 - Jamon y Queso');
form8.combobox1.ItemIndex:= 0;

form8.combobox2.Clear;
form8.combobox2.Items.Add('01 - Sin');
form8.combobox2.Items.Add('02 - Tradicional');
form8.combobox2.ItemIndex:= 0;

form8.show;
end;

procedure TForm7.Image4Click(Sender: TObject);//TORTA FRITAS
begin
producto:=5;

form8.Panel2.Hide;
form8.Panel3.Hide;

form8.edit1.clear;

form8.show;
end;

procedure TForm7.Image5Click(Sender: TObject);//CHIPA
begin
producto:=6;

form8.Panel2.Hide;
form8.Panel3.Hide;

form8.edit1.clear;

form8.show;
end;

procedure TForm7.Image6Click(Sender: TObject);//PASTELITOS
begin
producto:=7;

form8.Label3.Caption:= 'TAMAÑO';

form8.edit1.clear;

form8.combobox1.Clear;
form8.combobox1.Items.Add('01 - Membrillo');
form8.combobox1.Items.Add('02 - Batata');
form8.combobox1.ItemIndex:= 0;


form8.combobox2.Clear;
form8.combobox2.Items.Add('01 - Chico');
form8.combobox2.Items.Add('02 - Grande');
form8.combobox2.ItemIndex:= 0;

form8.show;
end;

procedure TForm7.Image8Click(Sender: TObject);
begin
//producto:=8;
//form8.show;
End;



procedure Guardar();
begin
  //Guardamos
  seek(archivosVentas.A, filesize(archivosVentas.A));
  write(archivosVentas.A, R);


end;

procedure TForm7.BitBtn1Click(Sender: TObject);
var
i:integer;
begin

  if cont <> 0  then //<--No selecciono elemento
    BEGIN

      //FORMATEAMOS LA FECHA DD/MM/YYYY
      fechaDMY:=FormatDateTime(FormatTime,Fecha_de_hoy);
      fecha_Formateada:= StrToDateTime(FechaDMY);

      NroVenta:= NroVenta + 1;
      r.clave:= NroVenta; //Clave va a ser el número de venta (no se repite)
      r.fechaSola:= fecha_Formateada; //Fecha sin Hora
      r.time:= Fecha_de_hoy;          //Fecha Con hora y Segundos
      r.operador:= operador;          //Nombre del operador

      archivosVentas.AbrirArchivo(archivosVentas.A);
      Guardar();
      guardarTxt(a,'Db\ventas\db.txt');
      archivosVentas.CerrarArchivo(archivosVentas.A);

      showmessage('LA COMPRA SE HA CARGADO CON EXITO!');
      close;

      //RESETEAMOS TODO
      formatear;
      cont:= 0;
      TOTAL:= 0;
      
      listbox1.Clear;
      edit1.Clear;

    END//IF
  ELSE
      messagedlg('Error, no se ha cargado ningun elemento', mterror, [mbretry],0);
end;//PROCEDURE

procedure TForm7.BitBtn2Click(Sender: TObject);
var
  elemSeleccionado:integer;
  i:integer;
  impProducto:string;
begin

  if ListBox1.ItemIndex <> -1 then //<--No selecciono elemento
  begin
     if messagedlg('Desea eliminar el elemento?', mtinformation, [mbNo, mbYes],0) = mrYes then
     begin

        //Obtiene el valor del elemento seleccionado
        elemSeleccionado:= ListBox1.ItemIndex;

        //Le sumamos 1 (porque los listbox empiezan en 0)
        elemSeleccionado:= elemSeleccionado + 1;

        //Restamos del total el valor del elemento eliminado
        TOTAL:= TOTAL - R.detalleVenta[elemSeleccionado].Subtotal;
        form7.Edit1.Text:= floatToStr(TOTAL);


        //Eliminamos el vector
        Eliminar(R,cont,elemSeleccionado);

        //Ordenamos el Vector y TODOS SUS ELEMENTOS
        BurbujaMejorado(R,cont);

        //Reconstruimos las claves del vector
        ReconstruirClaves(R,cont);


        //---------------------------------- RECARGAMOS EL EDIT 1 ------------------------------

        form7.ListBox1.clear;
        for i:= 1 to cont do
        begin
             //Invertimos el R.Producto - es una Funcion -> libreria fypVentas
             impProducto:= InvertirProducto(R.detalleVenta[i].producto);
             if (R.detalleVenta[i].producto = 5) or (R.detalleVenta[i].producto = 6) then //<-- Pastelito
             begin
               form7.ListBox1.addItem(
               ' ' + inttostr(r.detalleVenta[i].clave) +
               ', ' + impProducto +
               ', Cant: ' + IntToStr(R.detalleVenta[i].Cantidad) +
               ' Total: ' +  FloatToStr(R.detalleVenta[i].Subtotal), form7.ListBox1);
             end
             else if R.detalleVenta[i].producto = 7 then
             begin
               form7.ListBox1.addItem(
               ' ' + inttostr(r.detalleVenta[i].clave) +
               ', ' + impProducto +
               ' de ' + InvertirRelleno2(R.detalleVenta[i].Rcodigo) +
               ', ' + InvertirTamanio(R.detalleVenta[i].Tcodigo) +
               ', Cant: ' + IntToStr(R.detalleVenta[i].Cantidad) +
               ' Total: ' +  FloatToStr(R.detalleVenta[i].Subtotal), form7.ListBox1);
             end
             else //Del 1º IF
             begin
               form7.ListBox1.addItem(
               ' ' + inttostr(r.detalleVenta[i].clave) +
               ', ' + impProducto +
               ', ' + InvertirRelleno(R.detalleVenta[i].Rcodigo) +
               ', ' + InvertirBaniado(R.detalleVenta[i].Bcodigo) +
               ', Cant: ' + IntToStr(R.detalleVenta[i].Cantidad) +
               ' Total: ' +  FloatToStr(R.detalleVenta[i].Subtotal), form7.ListBox1);
             end; //<--- 3ºIF
        end; //FOR
     end;  //2º IF
  end //<---- 1º IF
  else
    messagedlg('Error, no se ha cargado ningun elemento', mterror, [mbretry],0);
end; //TForm7.BitBtn2Click

procedure TForm7.Timer1Timer(Sender: TObject);
begin
 Fecha_de_hoy:=now();
 label1.Caption := DateTimeToStr(Fecha_de_hoy);
end;

procedure TForm7.BitBtn3Click(Sender: TObject);
begin
FORM9.Show;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
FORM9.Show;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
form7.close;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  r.Total:= r.Total + r.detalleVenta[cont].Subtotal;//total
end;

end.

