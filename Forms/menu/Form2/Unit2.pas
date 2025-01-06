unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, archivosVentas, registroVentas, FunyProc;

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
    BitBtn1: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure AltaUsuarioClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Ussers, ventas, Unit6, Gastos, Historial;

{$R *.dfm}

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
form1.show;
form2.Hide;
end;



procedure TForm2.BitBtn1Click(Sender: TObject);
begin
form1.close;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
form7.show;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
var
  FechaDMY:string;
  fecha_Formateada:TdateTime;//DD/MM/YYYY
  FechaArchivo:string;    
  FormatDia,FormatMes,FormatAnio:string;
  Fdia,Fmes,Fanio:integer;
  semana:Byte;
  fMesREG:integer;
  demo:integer;

  pos,i,j:integer;
  cant_Ventas_Dia, cant_Ventas_Semana, cant_Ventas_Mes:integer;

  Prod_V_Dia, Prod_V_Semana, Prod_V_Mes:integer;
  totalDia, totalSemana, totalMes:real;

  cantElem:array[1..7] of integer;
  precioElem:array[1..7] of real;
  prod_:array[1..7] of string;
  cantElemUlt, precioElemUlt, prod_Ult:integer;

begin
   Fdia:= 0;
   Fmes:= 0;
   Fanio:= 0;
   semana:= 0;
   pos:= 0;
   i:= 0;
   j:= 0;
   cant_Ventas_Dia:= 0;
   cant_Ventas_Semana:= 0;
   cant_Ventas_Mes:= 0;
   totalDia:= 0;
   totalSemana:= 0;
   totalMes:= 0;
   Prod_V_Dia:=0;
   Prod_V_Semana:= 0;
   Prod_V_Mes:= 0;
   
  funYproc.EstructVaciaInt(cantElem, cantElemUlt);
  funYproc.EstructVaciaFloat(precioElem,precioElemUlt);
  funYproc.EstructVaciaStr(prod_, prod_Ult);

  for i:= 1 to 30 do
  begin
   registroVentas.B.detalleVenta[i].clave:=0;
   registroVentas.B.detalleVenta[i].producto:= 0;
   registroVentas.B.detalleVenta[i].Rcodigo:= 0;
   registroVentas.B.detalleVenta[i].Bcodigo:= 0;
   registroVentas.B.detalleVenta[i].Tcodigo:= 0;
   registroVentas.B.detalleVenta[i].Cantidad:= 0;
   registroVentas.B.detalleVenta[i].Subtotal:= 0;
  end;
  
  //RELLENAMOS LOS STRINGGRID
  Form6.stringgrid1.cells[0,0]:= 'VENTA Nº';
  Form6.stringgrid1.cells[1,0]:= 'TOTAL';
  Form6.stringgrid1.cells[2,0]:= 'FECHA Y HORA';
  Form6.stringgrid1.cells[3,0]:= 'OPERADOR';

  //FORMATEAMOS LA FECHA EN DD/MM/YYYY
  fechaDMY:=FormatDateTime(FormatTime,Fecha_de_hoy);
  fecha_Formateada:= StrToDateTime(fechaDMY);

  //ABRIMOS EL ARCHIVO
  archivosVentas.AbrirArchivo(archivosVentas.A);



  


//---------------------------------------  OBTENEMOS LA INFO DEL DÍA


  //BUSCAMOS DESDE LA PRIMER CLAVE DEL ARCHIVO
  pos:= archivosVentas.BuscarFech(archivosVentas.A, fecha_Formateada);

  if pos <> -1 then
  begin
    archivosVentas.CapturarInfo(archivosVentas.A,pos,registroVentas.B);

    I:= 0;
    while (b.fechaSola = fecha_Formateada) and (pos <= archivosVentas.UltimoElemento(archivosVentas.A)) do
    begin
            
    
         //CAPTURAMOS LA INFO EN EL REGISTRO
         archivosVentas.CapturarInfo(archivosVentas.A,pos,B);

         //COLOCAMOS LAS FILAS DEL STRINGGRID
         Form6.stringgrid1.RowCount := i + 2;
         
         //CARGAMOS LAS CELDAS
         Form6.stringgrid1.cells[0,i + 1]:= IntToStr(i + 1);
         Form6.stringgrid1.cells[1,i + 1]:= FloatToStr(registroventas.B.Total);
         Form6.stringgrid1.cells[2,i + 1]:= DateTimeToStr(registroventas.B.time);
         Form6.stringgrid1.cells[3,i + 1]:= registroventas.B.operador;

         //CHURROS VENDIDOS
         for j:= 1 to 30 do
         begin
           case B.detalleVenta[j].producto of
             1:begin  //CHURROS
             
                cantElem[1]:= cantElem[1] + B.detalleVenta[j].Cantidad;
                precioElem[1]:= precioElem[1] + B.detalleventa[j].Subtotal;
              end;//1
              2:begin  //CUBANITOS
                 cantElem[2]:= cantElem[2] + B.detalleVenta[j].Cantidad;
                 precioElem[2]:= precioElem[2] + B.detalleventa[j].Subtotal;
              end;//2
              3:begin  //DONAS
                 cantElem[3]:= cantElem[3] + B.detalleVenta[j].Cantidad;
                 precioElem[3]:= precioElem[3] + B.detalleventa[j].Subtotal;
              end;//3
              4:begin //BERLINESAS
                 cantElem[4]:= cantElem[4] + B.detalleVenta[j].Cantidad;
                 precioElem[4]:= precioElem[4] + B.detalleventa[j].Subtotal;
              end;//4
              5:begin //TPRTAFRITAS
                 cantElem[5]:= cantElem[5] + B.detalleVenta[j].Cantidad;
                 precioElem[5]:= precioElem[5] + B.detalleventa[j].Subtotal;
              end;//5
              6:begin  //CHIPA
                 cantElem[6]:= cantElem[6] + B.detalleVenta[j].Cantidad;
                 precioElem[6]:= precioElem[6] + B.detalleventa[j].Subtotal;
              end;//6
              7:begin //PASTELITOS
                 cantElem[7]:= cantElem[7] + B.detalleVenta[j].Cantidad;
                 precioElem[7]:= precioElem[7] + B.detalleventa[j].Subtotal;
              end;//7
           end;//CASE
         end;//FOR J


    i:= i + 1;
    pos:= pos + 1;
    cant_Ventas_Dia:= i;
    end;//END WHILE 
  end; //IF POS




//------------  RANK DIA

prod_[1]:='CHURROS';
prod_[2]:='CUBANITOS';
prod_[3]:='DONAS';
prod_[4]:='BERLINESAS';
prod_[5]:='TORTAFRITAS';
prod_[6]:='CHIPA';
prod_[7]:='PASTELITOS';

//ORDENAMOS FunyProc
BurbMej(cantElem,prod_,precioElem,7);

// CARGAMOS LAS CANTIDADES
Form6.label6.Caption:=prod_[1];
Form6.edit3.Text:= IntToStr(cantElem[1]);
Form6.edit4.Text:= FloatToStr(precioElem[1]);

Form6.label8.Caption:=prod_[2];
Form6.edit5.Text:= IntToStr(cantElem[2]);
Form6.edit6.Text:= FloatToStr(precioElem[2]);

Form6.label10.Caption:=prod_[3];
Form6.edit7.Text:= IntToStr(cantElem[3]);
Form6.edit8.Text:= FloatToStr(precioElem[3]);

Form6.label12.Caption:=prod_[4];
Form6.edit9.Text:= IntToStr(cantElem[4]);
Form6.edit10.Text:= FloatToStr(precioElem[4]);

Form6.label14.Caption:=prod_[5];
Form6.edit11.Text:= IntToStr(cantElem[5]);
Form6.edit12.Text:= FloatToStr(precioElem[5]);

Form6.label16.Caption:=prod_[6];
Form6.edit13.Text:= IntToStr(cantElem[6]);
Form6.edit14.Text:= FloatToStr(precioElem[6]);

Form6.label18.Caption:=prod_[7];
Form6.edit15.Text:= IntToStr(cantElem[7]);
Form6.edit16.Text:= FloatToStr(precioElem[7]);


//CARGAMOS EL TOTAL
Prod_V_Dia:= cantElem[1] + cantElem[2] + cantElem[3] + cantElem[4] + cantElem[5] + cantElem[6] + cantElem[7];
totalDia:= precioElem[1] + precioElem[2] + precioElem[3] + precioElem[4] + precioElem[5] + precioElem[6] + precioElem[7];

//CANTIDAD DE VENTAS
Form6.edit45.Text:= intToStr(Prod_V_Dia);
Form6.edit46.Text:= FloatToStr(totaldia);

//Form6.Edit1.text:= IntToStr(cant_Ventas_Dia);  
Form6.Edit1.text:= IntToStr(Prod_V_Dia);

//FORMATEAMOS LOS VECTORES
funYproc.EstructVaciaInt(cantElem, cantElemUlt);
funYproc.EstructVaciaFloat(precioElem,precioElemUlt);
funYproc.EstructVaciaStr(prod_, prod_Ult);

//---------------------------------------  FIN DÍA











//---------------------------------------  OBTENEMOS LA INFO DE LA SEMANA
   
  //FORMATEO LA FECHA DE HOY EN :
  FormatDia:='dd';
  FormatMes:='mm';
  FormatAnio:='yyyy';

  fdia:=StrToInt(FormatDateTime(FormatDia, Fecha_de_hoy)); //'DD'
  fMes:=StrToInt(FormatDateTime(FormatMes, Fecha_de_hoy)); //'MM'
  fAnio:=StrToInt(FormatDateTime(FormatAnio, Fecha_de_hoy)); //'YYYY'

  //OBTENEMOS EL DÍA DE LA SEMANA (CREDITOS: http://www.errordesintaxis.es/verfuente.php?fuente=93)
  semana:=FindDayOfWeek(fdia,fmes,fanio);

  //BUSCAMOS LA FECHA
  demo:=1;

  repeat
    // vamos a recorrer los 7 dias de la semana
    pos:= archivosVentas.BuscarFech(archivosVentas.A, fecha_Formateada - semana);

    // no hay registros en este dia?
    if pos = -1 then
    begin
        // a seguir buscando
        demo:=demo+1;
        semana:=semana-1;
        end
    else
      demo:=7;
  until demo = 7;

  if pos <> -1 then
  begin
    archivosVentas.CapturarInfo(archivosVentas.A,pos,registroVentas.B);

    I:= 0;
    while (semana <= 7) and (pos <= archivosVentas.UltimoElemento(archivosVentas.A)) do
    begin

         //CAPTURAMOS LA INFO EN EL REGISTRO
         archivosVentas.CapturarInfo(archivosVentas.A,pos,B);

         //CHURROS VENDIDOS
         for j:= 1 to 30 do
         begin
           case B.detalleVenta[j].producto of
             1:begin  //CHURROS
                cantElem[1]:= cantElem[1] + B.detalleVenta[j].Cantidad;
                precioElem[1]:= precioElem[1] + B.detalleventa[j].Subtotal;
              end;//1
              2:begin  //CUBANITOS
                 cantElem[2]:= cantElem[2] + B.detalleVenta[j].Cantidad;
                 precioElem[2]:= precioElem[2] + B.detalleventa[j].Subtotal;
              end;//2
              3:begin  //DONAS
                 cantElem[3]:= cantElem[3] + B.detalleVenta[j].Cantidad;
                 precioElem[3]:= precioElem[3] + B.detalleventa[j].Subtotal;
              end;//3
              4:begin //BERLINESAS
                 cantElem[4]:= cantElem[4] + B.detalleVenta[j].Cantidad;
                 precioElem[4]:= precioElem[4] + B.detalleventa[j].Subtotal;
              end;//4
              5:begin //TPRTAFRITAS
                 cantElem[5]:= cantElem[5] + B.detalleVenta[j].Cantidad;
                 precioElem[5]:= precioElem[5] + B.detalleventa[j].Subtotal;
              end;//5
              6:begin  //CHIPA
                 cantElem[6]:= cantElem[6] + B.detalleVenta[j].Cantidad;
                 precioElem[6]:= precioElem[6] + B.detalleventa[j].Subtotal;
              end;//6
              7:begin //PASTELITOS
                 cantElem[7]:= cantElem[7] + B.detalleVenta[j].Cantidad;
                 precioElem[7]:= precioElem[7] + B.detalleventa[j].Subtotal;
              end;//7
           end;//CASE
         end;//FOR J


    i:= i + 1;
    pos:= pos + 1;  
    cant_Ventas_Semana:= i;
    end;//END WHILE
  end; //IF POS




//------------  RANK SEMANA

prod_[1]:='CHURROS';
prod_[2]:='CUBANITOS';
prod_[3]:='DONAS';
prod_[4]:='BERLINESAS';
prod_[5]:='TORTAFRITAS';
prod_[6]:='CHIPA';
prod_[7]:='PASTELITOS';

//ORDENAMOS FunyProc
BurbMej(cantElem,prod_,precioElem,7);

// CARGAMOS LAS CANTIDADES
Form6.label21.Caption:=prod_[1];
Form6.edit17.Text:= IntToStr(cantElem[1]);
Form6.edit18.Text:= FloatToStr(precioElem[1]);

Form6.label23.Caption:=prod_[2];
Form6.edit19.Text:= IntToStr(cantElem[2]);
Form6.edit20.Text:= FloatToStr(precioElem[2]);

Form6.label24.Caption:=prod_[3];
Form6.edit21.Text:= IntToStr(cantElem[3]);
Form6.edit22.Text:= FloatToStr(precioElem[3]);

Form6.label25.Caption:=prod_[4];
Form6.edit23.Text:= IntToStr(cantElem[4]);
Form6.edit24.Text:= FloatToStr(precioElem[4]);

Form6.label26.Caption:=prod_[5];
Form6.edit25.Text:= IntToStr(cantElem[5]);
Form6.edit26.Text:= FloatToStr(precioElem[5]);

Form6.label27.Caption:=prod_[6];
Form6.edit27.Text:= IntToStr(cantElem[6]);
Form6.edit28.Text:= FloatToStr(precioElem[6]);

Form6.label28.Caption:=prod_[7];
Form6.edit29.Text:= IntToStr(cantElem[7]);
Form6.edit30.Text:= FloatToStr(precioElem[7]);


//CARGAMOS EL TOTAL
Prod_V_Semana:= cantElem[1] + cantElem[2] + cantElem[3] + cantElem[4] + cantElem[5] + cantElem[6] + cantElem[7];
totalSemana:= precioElem[1] + precioElem[2] + precioElem[3] + precioElem[4] + precioElem[5] + precioElem[6] + precioElem[7];

//Form6.Edit2.text:= IntToStr(cant_Ventas_Semana);
Form6.Edit2.text:= IntToStr(Prod_V_Semana);

//CANTIDAD DE VENTAS
Form6.edit47.Text:= intToStr(Prod_V_Semana);
Form6.edit48.Text:= FloatToStr(totalSemana);

//FORMATEAMOS LOS VECTORES
funYproc.EstructVaciaInt(cantElem, cantElemUlt);
funYproc.EstructVaciaFloat(precioElem,precioElemUlt);
funYproc.EstructVaciaStr(prod_, prod_Ult);



//-------------------------------------- FIN SEMANA











//---------------------------------------  OBTENEMOS LA INFO DEL MES EN CURSO

  //BUSCAMOS LA FECHA
  pos:= archivosVentas.BuscarINT(archivosVentas.A, 1);

  if pos <> -1 then
  begin

    //FORMATEAMOS ESTE MES MM
    fMes:=StrToInt(FormatDateTime(FormatMes, Fecha_de_hoy)); //'MM'

    i:= 0;   //OBTENEMOS LOS MESES DEL ARCHIVO, LO FORMATEAMOS Y EL 1º QUE COINCIDA CON FMes OBTENEMOS SU POSICIÓN.
    while i <= archivosVentas.UltimoElemento(archivosVentas.A) do
     begin
       archivosVentas.CapturarInfo(archivosVentas.A,pos,B);
        fMesREG:= strToInt(FormatDateTime(FormatMes, B.fechaSola));
       if fMes = fMesREG then
       begin
           pos:= i; 
           i:= archivosVentas.UltimoElemento(archivosVentas.A);
       end;
       i:= i + 1;
     end;

    //YA OBTENIDO LA PRIMER POSICION DEL MES ENTRAMOS A BUSCAR 1 X 1
    I:= 0;
    while (fMesREG = fMes) and (pos <= archivosVentas.UltimoElemento(archivosVentas.A)) do
    begin

         //CAPTURAMOS LA INFO EN EL REGISTRO
         archivosVentas.CapturarInfo(archivosVentas.A,pos,B);

         //CHURROS VENDIDOS
         for j:= 1 to 30 do
         begin
           case B.detalleVenta[j].producto of
             1:begin  //CHURROS
                cantElem[1]:= cantElem[1] + B.detalleVenta[j].Cantidad;
                precioElem[1]:= precioElem[1] + B.detalleventa[j].Subtotal;
              end;//1
              2:begin  //CUBANITOS
                 cantElem[2]:= cantElem[2] + B.detalleVenta[j].Cantidad;
                 precioElem[2]:= precioElem[2] + B.detalleventa[j].Subtotal;
              end;//2
              3:begin  //DONAS
                 cantElem[3]:= cantElem[3] + B.detalleVenta[j].Cantidad;
                 precioElem[3]:= precioElem[3] + B.detalleventa[j].Subtotal;
              end;//3
              4:begin //BERLINESAS
                 cantElem[4]:= cantElem[4] + B.detalleVenta[j].Cantidad;
                 precioElem[4]:= precioElem[4] + B.detalleventa[j].Subtotal;
              end;//4
              5:begin //TPRTAFRITAS
                 cantElem[5]:= cantElem[5] + B.detalleVenta[j].Cantidad;
                 precioElem[5]:= precioElem[5] + B.detalleventa[j].Subtotal;
              end;//5
              6:begin  //CHIPA
                 cantElem[6]:= cantElem[6] + B.detalleVenta[j].Cantidad;
                 precioElem[6]:= precioElem[6] + B.detalleventa[j].Subtotal;
              end;//6
              7:begin //PASTELITOS
                 cantElem[7]:= cantElem[7] + B.detalleVenta[j].Cantidad;
                 precioElem[7]:= precioElem[7] + B.detalleventa[j].Subtotal;
              end;//7
           end;//CASE
         end;//FOR J


    i:= i + 1;
    pos:= pos + 1;
    cant_Ventas_Mes:= i;
    end;//END WHILE 
  end; //IF POS




//------------  RANK SEMANA

prod_[1]:='CHURROS';
prod_[2]:='CUBANITOS';
prod_[3]:='DONAS';
prod_[4]:='BERLINESAS';
prod_[5]:='TORTAFRITAS';
prod_[6]:='CHIPA';
prod_[7]:='PASTELITOS';

//ORDENAMOS FunyProc
BurbMej(cantElem,prod_,precioElem,7);

// CARGAMOS LAS CANTIDADES
Form6.label36.Caption:=prod_[1];
Form6.edit31.Text:= IntToStr(cantElem[1]);
Form6.edit32.Text:= FloatToStr(precioElem[1]);

Form6.label38.Caption:=prod_[2];
Form6.edit33.Text:= IntToStr(cantElem[2]);
Form6.edit34.Text:= FloatToStr(precioElem[2]);

Form6.label39.Caption:=prod_[3];
Form6.edit35.Text:= IntToStr(cantElem[3]);
Form6.edit36.Text:= FloatToStr(precioElem[3]);

Form6.label40.Caption:=prod_[4];
Form6.edit37.Text:= IntToStr(cantElem[4]);
Form6.edit38.Text:= FloatToStr(precioElem[4]);

Form6.label41.Caption:=prod_[5];
Form6.edit39.Text:= IntToStr(cantElem[5]);
Form6.edit40.Text:= FloatToStr(precioElem[5]);

Form6.label42.Caption:=prod_[6];
Form6.edit41.Text:= IntToStr(cantElem[6]);
Form6.edit42.Text:= FloatToStr(precioElem[6]);

Form6.label43.Caption:=prod_[7];
Form6.edit43.Text:= IntToStr(cantElem[7]);
Form6.edit44.Text:= FloatToStr(precioElem[7]);


//CARGAMOS EL TOTAL  
Prod_V_Mes:= cantElem[1] + cantElem[2] + cantElem[3] + cantElem[4] + cantElem[5] + cantElem[6] + cantElem[7];
totalMes:= precioElem[1] + precioElem[2] + precioElem[3] + precioElem[4] + precioElem[5] + precioElem[6] + precioElem[7];

//CANTIDAD DE VENTAS
Form6.edit49.Text:= intToStr(Prod_V_Mes);
Form6.edit50.Text:= FloatToStr(totalMes);
                                             
Form6.Edit51.text:= IntToStr(Prod_V_Mes);
//Form6.Edit51.text:= IntToStr(cant_Ventas_Mes);


//FORMATEAMOS LOS VECTORES
funYproc.EstructVaciaInt(cantElem, cantElemUlt);
funYproc.EstructVaciaFloat(precioElem,precioElemUlt);
funYproc.EstructVaciaStr(prod_, prod_Ult);




//-----------------------------------------------------------------------------------


//CERRAMOS EL ARCHIVO
archivosVentas.CerrarArchivo(archivosVentas.A);
form6.show;

end;//FIN PROCEDURE






procedure TForm2.AltaUsuarioClick(Sender: TObject);
begin  
form5.edit1.enabled:= true;
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

form5.Show;
form5.SetFocus;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
frmGastos.show;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
formHistorial.show;
end;

end.//FIN FORM


