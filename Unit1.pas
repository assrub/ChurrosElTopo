unit Unit1;

interface

uses
  Windows, crt_D7, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, fyp, Libreria, LibreriaAux,
  archivosVentas, archivosPrecios, registroventas;

const
FormatTime= 'dd/mm/yyyy';
FormatDia= 'dd';
FormatMes= 'mm';
FormatAnio= 'yyyy';

type  
  Tcantidad = array[1..8] of integer;
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    USER: TEdit;
    PASSWORD: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
  end;

var
  Form1: TForm1;
  producto:integer;
  cantidad:Tcantidad;
  NroVenta:integer; 
  operador:string;   
  Fecha_de_hoy:TDateTime;
  
  FechaDMY:string;
  fecha_Formateada:TdateTime;//DD/MM/YYYY

implementation

uses Unit2, Unit3, Unit9;

{$R *.dfm}


procedure TForm1.BitBtn1Click(Sender: TObject);
var
pos:integer;
begin
	 Libreria.AbrirArchivo(Libreria.A);

   //Buscamos en Archivos la posicion de User.text
   pos:= Libreria.BuscarStr(Libreria.A, User.text);

 	 if (pos <> -1) then
	   begin
      //Capturo la información que hay en el Archivo del usuario
      Libreria.CapturarInfo(Libreria.A,pos,libreriaAux.B);
      if (USER.text = libreriaAux.B.usuario) and (PASSWORD.text = libreriaAux.B.PASSWORD) then
        begin
             operador :=User.text;
             form2.Label1.caption:= operador;

            //BOTON ALTA DE USUARIO
            if libreriaAux.B.Acc_Alta_Usuario = true then
              begin
               form2.AltaUsuario.enabled:= true;
               form2.AltaUsuario.visible:= true;
              end
            else
              begin 
               form2.AltaUsuario.enabled:= false;
               form2.AltaUsuario.visible:= false;
              end;

            //BOTON DE GASTOS
            if libreriaAux.B.Acc_Gastos = true then
              begin
               form2.SpeedButton1.enabled:= true;
               form2.SpeedButton1.visible:= true;
              end
            else
              begin
               form2.SpeedButton1.enabled:= false;
               form2.SpeedButton1.visible:= false;
              end;

            //BOTON VENTAS
            if libreriaAux.B.Acc_Ventas = true then
              begin
               form2.SpeedButton2.enabled:= true;
               form2.SpeedButton2.visible:= true;
              end
            else
              begin
               form2.SpeedButton2.enabled:= false;
               form2.SpeedButton2.visible:= false;
              end;

            //BOTON HISTORIAL
            if libreriaAux.B.Acc_Historial = true then
              begin
               form2.SpeedButton3.enabled:= true;
               form2.SpeedButton3.visible:= true;
              end
            else
              begin
               form2.SpeedButton3.enabled:= false;
               form2.SpeedButton3.visible:= false;
              end;

           //BOTON STATUS          
            if libreriaAux.B.Acc_Status = true then
              begin
               form2.SpeedButton4.enabled:= true;
               form2.SpeedButton4.visible:= true;
              end
            else
              begin
               form2.SpeedButton4.enabled:= false;
               form2.SpeedButton4.visible:= false;
              end;

           //PRECIOS PRODUCTO
             if libreriaAux.B.Acc_Mod_Precios = true then
              begin
               form9.SpeedButton1.enabled:= true;
               form9.SpeedButton1.visible:= true;
              end
            else
              begin
               form9.SpeedButton1.enabled:= false;
               form9.SpeedButton1.visible:= false;
              end;

            form1.hide;
            form2.show;
        end//2do if
      else//2do if
          messageDlg('CONTRASEÑA INVALIDA', mtConfirmation,[mbOk],0);

	   end // primer if
     else if  (Uppercase(user.text) = 'ADMIN') and (Uppercase(password.text) = 'ADMIN')  THEN
         begin //USER ADMIN (caso de q se borre la db USER)
            form1.hide;
            form2.show;
         end
     else
        messageDlg('USUARIO NO VALIDO', mtConfirmation,[mbOk],0);

user.Clear;
password.Clear;
end;//Procedure Btn1

procedure TForm1.FormCreate(Sender: TObject);
var
ruta,ruta2:string;
pos:integer;
i:integer;
begin;

//Este archivo es de Registro de Usuarios
ruta:='db\usuarios\';
Libreria.Activar(Libreria.A, ruta, 'dbUsuarios.dat');


ruta2:='Db\ventas\';
//Este archivo es de Ventas (en el dìa/mes/anio)
archivosVentas.Activar(archivosVentas.A, ruta2, 'dbVentas.dat');

//Este archivo es de los precios de los productos
archivosPrecios.Activar(archivosPrecios.A, ruta2, 'dbPrecios.dat');


 
//Obtenemos el valor de Clave Venta
//Abro el archivo
archivosVentas.AbrirArchivo(archivosVentas.A);
pos:= archivosVentas.BuscarInt(archivosVentas.A, 1);

if pos <> -1 then
begin

  I:= archivosVentas.ultimoElemento(archivosVentas.A);
  ArchivosVentas.CapturarInfo(archivosVentas.A,I,B);
  NroVenta:=r.clave;
  
end
else
begin
NroVenta:= 0;
end;
//BORRAR LOS DATOS CAPTURADOS
ArchivosVentas.CerrarArchivo(archivosVentas.A);
  
end;

 
Function ArchExist(arch:string):boolean;
begin
ArchExist:= false;
if FileExists(arch) then
ArchExist:= true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

if not ArchExist('db\usuarios\dbUsuarios.dat') then
close;

if not ArchExist('db\ventas\dbVentas.dat') then
close;

if not ArchExist('db\ventas\dbPrecios.dat') then
close;

end;

end.
