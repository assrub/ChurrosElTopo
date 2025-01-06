unit registroVentas;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type

   TdetalleVenta=record
                clave:integer; //Para Buscar,eliminar o cambiar
                producto:integer; //Tipo de Producto vendido
                Rcodigo:integer; //Relleno
                Bcodigo:integer; //Baniado
                Tcodigo:integer; //Tamanio
                Cantidad:integer; //Cantidad
                Subtotal:real; //cantidad * valor
                end;

  Tventas=record
                clave:integer; //Número de venta
                fechaSola:TDateTime; //Fecha FORMATEADA
                time:TDateTime; //Fecha y Horario
                detalleVenta:array [1..30] of TdetalleVenta;
                Total:real; //Monto total de la venta
                borrado: boolean;
                operador:string[20];
                end;


var
   R:Tventas;
   B:Tventas;
implementation





end.
