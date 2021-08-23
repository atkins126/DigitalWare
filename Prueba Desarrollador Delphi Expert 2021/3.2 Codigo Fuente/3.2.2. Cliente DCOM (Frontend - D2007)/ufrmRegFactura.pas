unit ufrmRegFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ButtonComps, ExtCtrls, ComCtrls, ToolWin, Buttons, DBDateTimePicker,
  Grids, DCGrids, DCDBGrids, StdCtrls, Mask, DBCtrls, TFlatSpeedButtonUnit,
  ImgList,uFrmClientes;

type
  TFrmRegFactura = class(TForm)
    BUDU: TEdit;
    ImgOpcionesNormal: TImageList;
    ImageList1: TImageList;
    Panel86: TPanel;
    Panel88: TPanel;
    Panel156: TPanel;
    Label2: TLabel;
    Panel163: TPanel;
    Label96: TLabel;
    Label62: TLabel;
    Label104: TLabel;
    Label66: TLabel;
    RxCliente: TDBEdit;
    Panel165: TPanel;
    StaticText1: TStaticText;
    grd_detalle: TDCDBGrid;
    cedula_c: TDBEdit;
    Panel4: TPanel;
    Shape4: TShape;
    Label4: TLabel;
    Panel5: TPanel;
    Shape8: TShape;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    Shape6: TShape;
    Shape5: TShape;
    NoFactura: TDBEdit;
    Panel1: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    Panel2: TPanel;
    DBFecha: TDBDateTimePicker;
    Panel95: TPanel;
    ToolBar2: TToolBar;
    bt_aplicar: TToolButton;
    bt_deshacer: TToolButton;
    bt_eliminar: TToolButton;
    ToolButton2: TToolButton;
    Panel9: TPanel;
    Image4: TImage;
    Label72: TLabel;
    Panel10: TPanel;
    Image5: TImage;
    tb_cerrar: TImageButton;
    Bevel1: TBevel;
    procedure FormClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tb_cerrarClick(Sender: TObject);
    procedure bt_aplicarClick(Sender: TObject);
    procedure bt_deshacerClick(Sender: TObject);
    procedure bt_eliminarClick(Sender: TObject);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grd_detalleEnter(Sender: TObject);
    procedure grd_detalleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
    FrmClientes: TFrmClientes;
  end;

implementation

uses uDatamodule, uFrmPrincipal, CustomMsgDlg, DB, ufrmFactura;

{$R *.dfm}

procedure TFrmRegFactura.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with Params do
     begin
     WinClassName := ' RAJB SRC';
     Style := (Style or WS_POPUP) and not WS_DLGFRAME;
     end;
end;

procedure TFrmRegFactura.bt_aplicarClick(Sender: TObject);
begin
budu.setfocus;
with dmCliente do
     begin
     cdsDetalle_Factura.DisableControls;
     cdsDetalle_Factura.Last;

     try
       cdsFacturas.edit;
       cdsFacturascliente.AsString:=cdsClientescliente.AsString;
       cdsFacturasTOTAL.AsFloat:=cdsDetalle_FacturaSUMTOT.value;
       cdsFacturas.ApplyUpdates(0);
       cdsDetalle_Factura.ApplyUpdates(0);
     except
        on E:EDataBaseError do
           begin
           CtmMsgDlg('',pchar(''+E.Message+'!!'),mtWarning,['Aceptar'],0,false);//warning
           cdsDetalle_Factura.enableControls;
           exit;
           end
        else
           begin
           cdsDetalle_Factura.enableControls;
           cdsDetalle_Factura.cancelupdates;
           cdsFacturas.Cancel;
           exit;
           end;
        end;

     cdsDetalle_Factura.enableControls;
     end;

if self.tag=1 then
   close;
end;

procedure TFrmRegFactura.bt_deshacerClick(Sender: TObject);
begin
with dmCliente do
     begin
     cdsDetalle_Factura.enableControls;
     cdsFacturas.CancelUpdates;
     end;

if self.tag=1 then
   close;
end;

procedure TFrmRegFactura.bt_eliminarClick(Sender: TObject);
var s : string;
begin
if(grd_detalle.SelectedRows.Count<=1) then
   s:='¿Desea eliminar el registro seleccionado ?'
else
if grd_detalle.SelectedRows.Count >1 then
   s:='¿Desea eliminar los registro seleccionados ?';

if CtmMsgDlg('',s,mtconfirmation, ['Si','No'],0,false) = 0 then
  with dmCliente do
       begin
       try
         if(cdsDetalle_Factura.recordcount=1)or(grd_detalle.SelectedRows.Count<=1) then
            cdsDetalle_Factura.Delete//accion para borrar un solo registro
         else
            grd_detalle.SelectedRows.Delete;//accion para borrar varios registros
         except
         end;
       end;

grd_detalle.SelectedRows.clear;
end;

procedure TFrmRegFactura.FormClick(Sender: TObject);
begin
with dmCliente do
     begin
     cdsProductos.close;
     cdsProductos.Filter:='';
     cdsClientes.Close;
     cdsClientes.refresh;
     end;

TFrmfactura(owner).newfactura.Tag:=0;
self.tag:=0;

dbfecha.Enabled:=true;
nofactura.Enabled:=true;
rxcliente.enabled:=true;
end;

procedure TFrmRegFactura.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then                          { if it's an enter key }
   begin
   Key := #0;                                 { eat enter key }
   Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
   end;
end;

procedure TFrmRegFactura.grd_detalleEnter(Sender: TObject);
begin
if self<>nil then
   self.bt_eliminar.Enabled:=(dmCliente.cdsDetalle_Factura.active)and(dmCliente.cdsDetalle_Factura.RecordCount>0);
end;

procedure TFrmRegFactura.grd_detalleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//permitir eliminar registro con la tecla supr
with dmCliente do
  if(cdsDetalle_Factura.active)and(cdsDetalle_Factura.RecordCount>0)then//verifica que la accion se puede ejecutar
   if Key = VK_DELETE then//si presionamos la tecla delete//supr
    if not bt_eliminar.Enabled then
       beep
    else
       bt_eliminar.OnClick(nil);//ejecutar accion eliminar
end;

procedure TFrmRegFactura.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TFrmRegFactura.tb_cerrarClick(Sender: TObject);
var s :string;
begin
with dmCliente do
     begin
     if(cdsFacturas.Modified)or(cdsFacturas.ChangeCount>0)then
        begin
        s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Registro de Ventas?';

        if CtmMsgDlg('',s,mtConfirmation,['Si','No'],0,false) = 0 then
           bt_aplicar.onClick(nil)
        else
           bt_deshacer.OnClick(nil);
        end
     else
        bt_deshacer.OnClick(nil);
     end;

toolbar2.Height:=40;
end;

end.
