unit CantYRellenos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, unit1, registroVentas, archivosVentas,
  fypVentas, registroPrecios;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    //procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}
uses
ventas;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin 
form8.Panel2.show;
form8.Panel3.show;

close;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin

end;//procedure

procedure TForm8.BitBtn1Click(Sender: TObject);
var
  impProducto:string;
  i:integer; 
begin
if campoVacio(edit1.text) then // <-- Si el edit1 esta vacio no carga el codigo
  messagedlg('Error, no ha ingresado la cantidad',mtError, [mbretry],0)
else
begin
form8.Panel2.show;
form8.Panel3.show;

cont:= cont + 1;
   case producto of
        1:begin //Churros
         R.detalleVenta[cont].producto := 1; //Tipo de Producto (Churros = 1)
         R.detalleVenta[cont].clave:= cont;  //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= CodRelleno(combobox1.Text);//Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= CodBaniado(combobox2.Text);//Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= 0; //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad

         case R.detalleVenta[cont].Rcodigo of
         1:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.Churros.U_Simple;
         if r.detalleVenta[cont].Cantidad mod 12=0 then
         r.detalleventa[cont].Subtotal:=(p.Churros.D_Simple)*(r.detalleventa[cont].cantidad div 12);
         end;//1
         2,3,4,5,6:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.Churros.U_Tradicional;
         end;
         7,8,9,10,11,12:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.Churros.U_Gourmet;
         end;
         13,14,15:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.Churros.U_Salados;
         end;
         end;//case codigo

         if r.detalleVenta[cont].Bcodigo = 2 then
          r.detalleVenta[cont].Subtotal:=r.detalleVenta[cont].Subtotal + (r.detalleventa[cont].Cantidad * 10);
         {falta agregarle bañado tradicional, tambien falta agregar un tiopo de bañado en el form precios}
         end;//1


        2:begin //Cubanitos
         R.detalleVenta[cont].producto := 2; //Tipo de Producto (Cubanitos = 2)
         R.detalleVenta[cont].clave:= cont;  //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= CodRelleno(combobox1.Text);//Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= CodBaniado(combobox2.Text);//Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= 0; //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad

         case R.detalleVenta[cont].Rcodigo of
        1,2,3,4,5,6:begin {arreglar el form8 donde aparecer cubanitos simple (sacarlo)}
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.cubanitos.U_Tradicional;
         end;
        7,8,9,10,11,12:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.cubanitos.U_Gourmet;
         end;
       {  13,14,15:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.cubanitos// acomodar los bañados en el form8
        end; }
         end;//case codigo

         if r.detalleVenta[cont].Bcodigo = 2 then
          r.detalleVenta[cont].Subtotal:=r.detalleVenta[cont].Subtotal + (r.detalleventa[cont].Cantidad * 10);


        end;//2

        3:begin //Donas
         R.detalleVenta[cont].producto := 3; //Tipo de Producto (Donas = 3)
         R.detalleVenta[cont].clave:= cont; //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= CodRelleno(combobox1.Text);//Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= CodBaniado(combobox2.Text);//Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= 0; //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad

        case R.detalleVenta[cont].Rcodigo of
            1:begin {arreglar el form8 agregarle los BAÑADOS}
              r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.donas.U_simple;
              end;
            2,3,4,5,6:begin
                if (R.detalleVenta[cont].Bcodigo=3) then
                begin
                  if r.detalleVenta[cont].Cantidad mod 12 = 0 then
                     r.detalleventa[cont].Subtotal:=(p.donas.D_B_Simple)*(r.detalleventa[cont].cantidad div 12)
                  else
                     r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * (P.Donas.U_B_Simple);
                end//if
                else if (R.detalleVenta[cont].Bcodigo=4) then
                begin
                  if r.detalleVenta[cont].Cantidad mod 12 = 0 then
                     r.detalleventa[cont].Subtotal:=(p.donas.D_B_Decorado)*(r.detalleventa[cont].cantidad div 12)
                  else
                     r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * (P.Donas.U_B_Decorado);
                end//if
                end;//case
            7,8,9,10,11,12:begin
                  if (R.detalleVenta[cont].Bcodigo=5) then
                  begin
                   if r.detalleVenta[cont].Cantidad mod 12 = 0 then
                     r.detalleventa[cont].Subtotal:=(p.donas.D_B_Especial)*(r.detalleventa[cont].cantidad div 12)
                   else
                     r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * (P.Donas.U_B_Especial);
                  end//if


            end;  //case 7 a 12
        end; //case
        end; //3
        4:begin//Borloniesa
         R.detalleVenta[cont].producto := 4; //Tipo de Producto (Borloniesa = 4)
         R.detalleVenta[cont].clave:= cont; //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= CodRelleno(combobox1.Text); //Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= CodBaniado(combobox2.Text); //Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= 0; //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad

         case R.detalleVenta[cont].Rcodigo of
         1:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.berlinesas.U_Simple;
         if r.detalleVenta[cont].Cantidad mod 12=0 then
         r.detalleventa[cont].Subtotal:=(p.Berlinesas.D_Simple)*(r.detalleventa[cont].cantidad div 12);
         end;//1
        2,3,4,5,6:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.berlinesas.U_Tradicional;
         end;
        7,8,9,10,11,12:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.berlinesas.U_Gourmet;
         end;
         13,14,15:begin
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.berlinesas.U_Salados;
         end;
         end;//case codigo

         if r.detalleVenta[cont].Bcodigo = 2 then
          r.detalleVenta[cont].Subtotal:=r.detalleVenta[cont].Subtotal + (r.detalleventa[cont].Cantidad * 10);
         {falta agregarle bañado tradicional, tambien falta agregar un tiopo de bañado en el form precios}

        end;//4

        5:begin //Torta Fritas
         R.detalleVenta[cont].producto := 5; //Tipo de Producto (Torta Fritas = 5)
         R.detalleVenta[cont].clave:= cont; //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= 0; //Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= 0; //Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= 0; //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad

         if (r.detalleventa[cont].Cantidad mod 12) = 0 then
         r.detalleVenta[cont].Subtotal:=  p.tortafritas.D_Simple * (r.detalleventa[cont].Cantidad div 12)
         else
         r.detalleVenta[cont].Subtotal:= r.detalleventa[cont].Cantidad * p.tortafritas.U_Simple;


         end;//case
        6:begin //Chipa
         R.detalleVenta[cont].producto := 6; //Tipo de Producto (Chipa = 6)
         R.detalleVenta[cont].clave:= cont; //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= 0; //Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= 0; //Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= 0; //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad

         r.detalleVenta[cont].Subtotal:= (p.chipa.U_Simple / 1000) *  r.detalleventa[cont].Cantidad;

        end;//6

        7:begin //Pastelitos
         R.detalleVenta[cont].producto := 7; //Tipo de Producto (Pastelitos = 7)
         R.detalleVenta[cont].clave:= cont; //Clave TdetalleVenta
         R.detalleVenta[cont].Rcodigo:= CodRelleno2(combobox1.Text); //Codigo Relleno
         R.detalleVenta[cont].Bcodigo:= 0; //Codigo Baniado
         R.detalleVenta[cont].Tcodigo:= CodTamanio(combobox2.Text); //Codigo Tamanio
         R.detalleVenta[cont].Cantidad:= strtoint(edit1.Text); //Cantidad


         if combobox2.ItemIndex = 0 then
         begin
          if (R.detalleVenta[cont].Cantidad mod 12) = 0 then
            R.detalleVenta[cont].Subtotal:= (R.detalleVenta[cont].Cantidad div 12) * p.Pastelitos.D_chico
          else
            R.detalleVenta[cont].Subtotal:= p.Pastelitos.U_chico * R.detalleVenta[cont].Cantidad;
         end
         else
         begin
          if (R.detalleVenta[cont].Cantidad mod 12) = 0 then
            R.detalleVenta[cont].Subtotal:= (R.detalleVenta[cont].Cantidad div 12) * p.Pastelitos.D_Grande
          else
           R.detalleVenta[cont].Subtotal:= p.Pastelitos.U_Grande * R.detalleVenta[cont].Cantidad;
         end;


        end;//7
  end;//case producto


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
        ' Total: ' +  FloatToStr(r.detalleventa[i].Subtotal), form7.ListBox1);

      end
    else if R.detalleVenta[i].producto = 7 then
      begin
        form7.ListBox1.addItem(
        ' ' + inttostr(r.detalleVenta[i].clave) +
        ', ' + impProducto +
        ' de ' + InvertirRelleno2(R.detalleVenta[i].Rcodigo) +
        ', ' + InvertirTamanio(R.detalleVenta[i].Tcodigo) +
        ', Cant: ' + IntToStr(R.detalleVenta[i].Cantidad) +
        ' Total: ' +  FloatToStr(r.detalleventa[i].Subtotal), form7.ListBox1);
      end
    else
      begin
        form7.ListBox1.addItem(
        ' ' + inttostr(r.detalleVenta[i].clave) +
        ', ' + impProducto +
        ', ' + InvertirRelleno(R.detalleVenta[i].Rcodigo) +
        ', ' + InvertirBaniado(R.detalleVenta[i].Bcodigo) +
        ', Cant: ' + IntToStr(R.detalleVenta[i].Cantidad) +
        ' Total: ' +  FloatToStr(r.detalleventa[i].Subtotal), form7.ListBox1);

      end;

  end;

  //AGREGAMOS EL TOTAL AL EDIT
  TOTAL:= TOTAL + r.detalleVenta[cont].Subtotal;
  form7.Edit1.Text:= floatToStr(TOTAL);

  //AGREGAMOS EL TOTAL AL REGISTRO
  r.Total:= TOTAL;

  close; //Cierra el form8
end;//IF ERRORES
end; //end BitBtn1Click

procedure TForm8.ComboBox2Enter(Sender: TObject);
begin
  if (combobox1.ItemIndex  = 0) and (producto = 3) then
    begin
      form8.combobox2.Clear;
      form8.combobox2.Items.Add('01 - Sin'); 
      form8.combobox2.ItemIndex:= 0;
    end
    else if (combobox1.ItemIndex > 0) and (combobox1.ItemIndex < 6) and (producto = 3) then
    begin
      form8.combobox2.Clear;
      form8.combobox2.Items.Add('01 - Sin');
      form8.combobox2.Items.Add('02 - Bañada');
      form8.combobox2.Items.Add('03 - Bañada y Dec.');
      form8.combobox2.ItemIndex:= 0;
    end
  else if (combobox1.ItemIndex >= 6) and (producto = 3) then
    begin
      form8.combobox2.Clear;
      form8.combobox2.Items.Add('01 - Sin');
      form8.combobox2.Items.Add('02 - Bañada');
      form8.combobox2.Items.Add('03 - Bañada y Dec.');
      form8.combobox2.Items.Add('04 - Bañada Dec. Gour.');
      form8.combobox2.ItemIndex:= 0;
   end;// 2º if
end;

procedure TForm8.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8, #9]) then Key:=#0;
end;

end.
