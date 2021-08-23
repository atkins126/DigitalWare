unit ufrmFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB,DBCtrls, StdCtrls,
  Grids, DBGrids, ExtCtrls, ComCtrls, ToolWin, ImgList, DBClientActns, DBActns,
  ActnList, Mask, DBDateTimePicker, Spin, ufrmRegFactura, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ButtonComps;

type
  TfrmFactura = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ImageList1: TImageList;
    ActionList2: TActionList;
    DataSetFirst2: TDataSetFirst;
    DataSetPrior2: TDataSetPrior;
    DataSetNext2: TDataSetNext;
    DataSetLast2: TDataSetLast;
    DataSetRefresh2: TDataSetRefresh;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolBar2: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    grd_factura1: TDBGrid;
    grd_detalle1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    newfactura: TButton;
    budu: TEdit;
    DataSetRefresh1: TDataSetRefresh;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    DataSetDelete1: TDataSetDelete;
    DataSetDelete2: TDataSetDelete;
    ToolButton8: TToolButton;
    ClientDataSetApply1: TClientDataSetApply;
    ClientDataSetUndo1: TClientDataSetUndo;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ClientDataSetApply2: TClientDataSetApply;
    ClientDataSetUndo2: TClientDataSetUndo;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton18: TToolButton;
    grd_factura: TcxGrid;
    cxGridDBTableView39: TcxGridDBTableView;
    cxGridDBfac_cliente: TcxGridDBColumn;
    cxGridDBfac_numero: TcxGridDBColumn;
    cxGridDBfac_fecha: TcxGridDBColumn;
    cxGridLevel39: TcxGridLevel;
    cxGridDBfac_total: TcxGridDBColumn;
    grd_detalle: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBDet_Factura: TcxGridDBColumn;
    cxGridDBFac_Producto: TcxGridDBColumn;
    cxGridDBFac_Cantidad: TcxGridDBColumn;
    cxGridDBFac_Valor: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBFac_Subtotal: TcxGridDBColumn;
    Panel9: TPanel;
    Image4: TImage;
    Label72: TLabel;
    Panel10: TPanel;
    Image5: TImage;
    tb_cerrar: TImageButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure DataSetDelete1Execute(Sender: TObject);
    procedure DataSetCancel1Execute(Sender: TObject);
    procedure DataSetDelete2Execute(Sender: TObject);
    procedure DataSetCancel2Execute(Sender: TObject);
    procedure ClientDataSetUndo1Execute(Sender: TObject);
    procedure ClientDataSetUndo2Execute(Sender: TObject);
    procedure ClientDataSetApply2Execute(Sender: TObject);
    procedure newfacturaClick(Sender: TObject);
    procedure grd_factura1DblClick(Sender: TObject);
    procedure ClientDataSetApply1Execute(Sender: TObject);
    procedure cxGridDBTableView39KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tb_cerrarClick(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    old_producto : string;
    FrmRegFactura: TFrmRegFactura;
  end;

implementation

{$R *.dfm}

uses uDatamodule, CustomMsgDlg;

procedure TfrmFactura.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with Params do
     begin
     WinClassName := ' RAJB SRC';
     Style := (Style or WS_POPUP) and not WS_DLGFRAME;
     end;
end;

procedure TfrmFactura.newfacturaClick(Sender: TObject);
var s : string;
begin
newfactura.Tag:=1;

if frmregFactura=nil then
   Application.CreateForm(TfrmregFactura, frmregFactura);

frmregFactura.tag:=1;
budu.SetFocus;
with dmCliente do
     begin
     if not cdsClientes.active then cdsClientes.open;
     if not cdsProductos.active then cdsProductos.open;
     if not cdsDetalle_Factura.active then cdsDetalle_Factura.open;

     if not cdsFacturas.active then
        cdsFacturas.open// si el dataset de Cliente esta cerrado -> abrirlo
     else
     if(cdsFacturas.state<>dsedit)and(cdsFacturas.state<>dsinsert)and(cdsFacturas.changecount=0)then
        cdsClientes.refresh// si el dataset de Cliente esta en modo de busqueda y no se le han realizado cambios -> refrescar datos
     else
        begin
        if(cdsFacturas.state=dsinsert)or(cdsFacturas.state=dsedit)then// si el dataset de Cliente esta en modo de insercion
           try
           cdsFacturas.post
           except
               on E:EDataBaseError do//En caso de error en el dataset por falta de algun dato
                  begin
                  CtmMsgDlg('',pchar(''+E.Message+'!!'),mtwarning,['Aceptar'],0,false);//warning
                  exit;
                  end;
           end
        else
           begin
           if(cdsFacturas.Modified)or(cdsFacturas.ChangeCount>0)then
              begin
              s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Registro de Facturación?';

              if CtmMsgDlg('',s,mtConfirmation,['Si','No'],0,false) = 0 then
                 begin
                 try
                   cdsFacturas.ApplyUpdates(0);
                   except
                       on E:EDataBaseError do
                          begin
                          CtmMsgDlg('',pchar(''+E.Message+'!!'),mtwarning,['Aceptar'],0,false);//warning
                          exit;
                          end
                       else
                          begin
                          cdsFacturas.Cancel;
                          exit;
                          end;
                   end;

                 cdsFacturas.enableControls;
                 end
              else
                 cdsFacturas.cancelupdates;
              end;
           end;
        end;

     try
       cdsFacturas.append;//Activar recordset a modo de Insercion

       except
           on E:EDataBaseError do//En caso de error en el dataset por falta de algun dato
              begin//requerido, mostrar el error correspondiente.
              CtmMsgDlg('',pchar(''+E.Message+'!!'),mtwarning,['Aceptar'],0,false);//warning
              budu.SetFocus;
              exit;//salir->no ejecutar nada mas
              end;
       end;
     end;

frmregFactura.ShowModal;
end;

procedure TfrmFactura.ClientDataSetApply1Execute(Sender: TObject);
begin
  with dmCliente do
  begin
    cdsFacturas.disableControls;

    try
      cdsFacturas.ApplyUpdates(0);

    except
      on E:EDataBaseError do
      begin
        CtmMsgDlg('',pchar(''+E.Message+'!!'),mtWarning,['Aceptar'],0,false);//warning
        cdsFacturas.enableControls;
        exit;
      end
      else
      begin
        cdsFacturas.Cancel;//?
        cdsFacturas.enableControls;
        exit;
      end;
    end;

    cdsDetalle_Factura.refresh;
    cdsFacturas.enableControls;
  end;
end;

procedure TfrmFactura.ClientDataSetApply2Execute(Sender: TObject);
begin
  with dmCliente do
  begin
    cdsDetalle_Factura.disableControls;

    try
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
          cdsDetalle_Factura.Cancel;//?
          cdsDetalle_Factura.enableControls;
          exit;
        end;
       end;

    cdsDetalle_Factura.refresh;
    cdsDetalle_Factura.enableControls;
  end;
end;

procedure TfrmFactura.ClientDataSetUndo1Execute(Sender: TObject);
begin
 if dmCliente.cdsDetalle_Factura.ChangeCount > 0  then
   dmCliente.cdsDetalle_Factura.CancelUpdates;

 dmCliente.cdsFacturas.CancelUpdates;
end;

procedure TfrmFactura.ClientDataSetUndo2Execute(Sender: TObject);
begin
  dmCliente.cdsDetalle_Factura.CancelUpdates;
end;

procedure TfrmFactura.cxGridDBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if key = 46 then
  begin
    key := 0;
    DataSetDelete2Execute(nil);
    abort;
  end;
end;

procedure TfrmFactura.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 46 then
  begin
    key := 0;
    DataSetDelete2Execute(nil);
    abort;
  end;
end;

procedure TfrmFactura.cxGridDBTableView39KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 46 then
  begin
    key := 0;
    DataSetDelete1Execute(nil);
    abort;
  end;
end;

procedure TfrmFactura.DataSetCancel1Execute(Sender: TObject);
begin
  dmCliente.cdsFacturas.Cancel;
  PageControl1.ActivePage := TabSheet1;//edicion
end;

procedure TfrmFactura.DataSetCancel2Execute(Sender: TObject);
begin
  dmCliente.cdsDetalle_Factura.Cancel;
  PageControl2.ActivePage := TabSheet3;//edicion
end;

procedure TfrmFactura.DataSetDelete1Execute(Sender: TObject);
var s:string;
begin
  if(cxGridDBTableView39.Controller.SelectedRowCount<=1) then
   s:='¿Desea eliminar el registro de la factura ['+dmCliente.cdsFacturasnumero.AsString+'] ?'
  else
  if cxGridDBTableView39.Controller.SelectedRowCount >1 then
    s:='¿Desea eliminar los registro seleccionados ?';

  if CtmMsgDlg('Eliminar registro',s,mtConfirmation,['Si','No'],0, False) = 0 then
  begin
   try
     if(dmCliente.cdsFacturas.recordcount=1)or(cxGridDBTableView39.Controller.SelectedRowCount<=1) then
       dmCliente.cdsFacturas.Delete//accion para borrar un solo registro
    else
      cxGridDBTableView39.Controller.DeleteSelection;//grd_factura.SelectedRows.Delete;//accion para borrar varios registros
    except
      end;
   end;

   cxGridDBTableView39.Controller.ClearSelection;//grd_factura.SelectedRows.clear;
end;

procedure TfrmFactura.DataSetDelete2Execute(Sender: TObject);
var s:string;
begin
  if(cxGridDBTableView1.Controller.SelectedRowCount<=1) then
   s:='¿Desea eliminar el registro detalle la factura ['+dmCliente.cdsDetalle_Facturaproducto.AsString+'] ?'
  else
  if cxGridDBTableView1.Controller.SelectedRowCount >1 then
    s:='¿Desea eliminar los registro seleccionados ?';

  if CtmMsgDlg('Eliminar registro',s,mtConfirmation,['Si','No'],0, False) = 0 then
  begin
   try
     if(dmCliente.cdsDetalle_Factura.recordcount=1)or(cxGridDBTableView1.Controller.SelectedRowCount<=1) then
       dmCliente.cdsDetalle_Factura.Delete//accion para borrar un solo registro
    else
      cxGridDBTableView1.Controller.DeleteSelection;//grd_detalle.SelectedRows.Delete;//accion para borrar varios registros
    except
      end;
   end;

   cxGridDBTableView1.Controller.ClearSelection; //grd_detalle.SelectedRows.clear;
end;

procedure TfrmFactura.grd_factura1DblClick(Sender: TObject);
var idf,s:string;
begin
with dmCliente,FrmRegFactura do
   if(cdsFacturas.active)then
     begin
     if not cdsProductos.active then cdsProductos.open;

     if(cdsFacturas.Modified)or(cdsFacturas.ChangeCount>0)then
        begin
        CtmMsgDlg('','Debe aplicar los cambios pendientes para poder ejecutar la accion solicitada!!',mtWarning,['Aceptar'],0,false);
        s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Registro de Facturación?';

        if CtmMsgDlg('',s,mtError,['Si','No'],0,false) = 0 then
           ClientDataSetApply1Execute(nil)
        else
           ClientDataSetUndo1Execute(nil);
        end
     else
        ClientDataSetUndo1Execute(nil);

     if(cdsFacturas.recordcount>0)then
        begin
        if FrmRegFactura=nil then
           Application.CreateForm(TFrmRegFactura, FrmRegFactura);

        newfactura.Tag:=1;
        FrmRegFactura.tag:=1;

        FrmRegFactura.rxcliente.enabled:=false;
        idf := cdsFacturasnumero.AsString;
        cdsDetalle_Factura.close;
        cdsDetalle_Factura.open;
        cdsFacturas.Edit;
        cdsFacturas.post;
        FrmRegFactura.DBFecha.enabled := False;
        FrmRegFactura.NoFactura.enabled := False;
        FrmRegFactura.ShowModal;
        FrmRegFactura.DBFecha.enabled := True;
        FrmRegFactura.NoFactura.enabled := True;
        end;
     end;
end;

procedure TfrmFactura.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCliente.cdsDetalle_Factura.Active := False;
  dmCliente.cdsFacturas.Active := False;
  dmCliente.cdsProductos.Active := False;
  dmCliente.cdsClientes.Active := False;
end;

procedure TfrmFactura.FormCreate(Sender: TObject);
begin
  dmCliente.cdsClientes.Active := true;
  dmCliente.cdsProductos.Active := true;
  dmCliente.cdsFacturas.Active := true;
  dmCliente.cdsDetalle_Factura.Active := true;

  DBLookupComboBox1.KeyValue := dmCliente.cdsClientescliente.Value;
  grd_factura.ShowHint := true;
end;

procedure TfrmFactura.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    dmCliente.cdsFacturas.Cancel;
end;

procedure TfrmFactura.PageControl2Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet3 then
    dmCliente.cdsDetalle_Factura.Cancel;
end;

procedure TfrmFactura.tb_cerrarClick(Sender: TObject);
var s :string;
begin
with dmCliente do
     begin
     if(cdsDetalle_Factura.Modified)or(cdsDetalle_Factura.ChangeCount>0)then
        begin
        s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Listado detalle de Facturas?';

        if CtmMsgDlg('',s,mtConfirmation,['Si','No'],0,false) = 0 then
           ClientDataSetApply2Execute(nil)
        else
           ClientDataSetUndo2Execute(nil);
        end
     else
       ClientDataSetUndo2Execute(nil);

     if(cdsFacturas.Modified)or(cdsFacturas.ChangeCount>0)then
        begin
        s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Listado de Facturas?';

        if CtmMsgDlg('',s,mtConfirmation,['Si','No'],0,false) = 0 then
           ClientDataSetApply1Execute(nil)
        else
           ClientDataSetUndo1Execute(nil);
        end
     else
       ClientDataSetUndo1Execute(nil);
     end;

  ModalResult :=mrOk;
end;

end.
