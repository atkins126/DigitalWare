unit ufrmProductos;

interface

uses
  Windows, forms, ExtCtrls, DBCtrls, Classes, Controls, Grids, DBGrids,
  ComCtrls, ToolWin, ImgList, DBClientActns, DBActns, ActnList, StdCtrls, Mask, SysUtils,
  dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ButtonComps, Graphics;

type
  TfrmProductos = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    ClientDataSetApply1: TClientDataSetApply;
    ClientDataSetUndo1: TClientDataSetUndo;
    DataSetRefresh1: TDataSetRefresh;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton13: TToolButton;
    ToolButton12: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListadoClientes: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    grd_factura: TcxGrid;
    cxGridDBTableView39: TcxGridDBTableView;
    cxGridDBpro_producto: TcxGridDBColumn;
    cxGridDBpro_nombre: TcxGridDBColumn;
    cxGridDBpro_valor: TcxGridDBColumn;
    cxGridLevel39: TcxGridLevel;
    Panel9: TPanel;
    Image4: TImage;
    Label72: TLabel;
    Panel10: TPanel;
    Image5: TImage;
    tb_cerrar: TImageButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientDataSetUndo1Execute(Sender: TObject);
    procedure DataSetInsert1Execute(Sender: TObject);
    procedure DataSetPost1Execute(Sender: TObject);
    procedure DataSetEdit1Execute(Sender: TObject);
    procedure DataSetDelete1Execute(Sender: TObject);
    procedure DataSetCancel1Execute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure tb_cerrarClick(Sender: TObject);
    procedure ClientDataSetApply1Execute(Sender: TObject);
    procedure cxGridDBTableView39KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    old_producto : string;
  end;

implementation

{$R *.dfm}

uses uDatamodule, ufrmFactura, CustomMsgDlg, Variants, Messages;

procedure TfrmProductos.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with Params do
     begin
     WinClassName := ' RAJB SRC';
     Style := (Style or WS_POPUP) and not WS_DLGFRAME;
     end;
end;

procedure TfrmProductos.cxGridDBTableView39KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 46 then
  begin
    key := 0;
    DataSetDelete1Execute(nil);
    abort;
  end;
end;

procedure TfrmProductos.ClientDataSetApply1Execute(Sender: TObject);
begin
  with dmCliente do
  begin
    cdsProductos.disableControls;

    try
      cdsProductos.ApplyUpdates(0);

    except
      on E:EDataBaseError do
      begin
        CtmMsgDlg('',pchar(''+E.Message+'!!'),mtWarning,['Aceptar'],0,false);//warning
        cdsProductos.enableControls;
        exit;
      end
      else
      begin
        cdsProductos.Cancel;//?
        cdsProductos.enableControls;
        exit;
      end;
    end;

    cdsProductos.refresh;
    cdsProductos.enableControls;
  end;
end;

procedure TfrmProductos.ClientDataSetUndo1Execute(Sender: TObject);
begin
 dmCliente.cdsProductos.CancelUpdates;
end;

procedure TfrmProductos.DataSetCancel1Execute(Sender: TObject);
begin
  dmCliente.cdsProductos.Cancel;
  PageControl1.ActivePage := TabSheet1;//edicion
end;

procedure TfrmProductos.DataSetDelete1Execute(Sender: TObject);
var s:string;
begin
  if(cxGridDBTableView39.Controller.SelectedRowCount<=1) then
   s:='¿Desea eliminar el registro del producto ['+dmCliente.cdsProductosnombre_producto.AsString+'] ?'
  else
  if cxGridDBTableView39.Controller.SelectedRowCount >1 then
    s:='¿Desea eliminar los registro seleccionados ?';

  if CtmMsgDlg('Eliminar registro',s,mtConfirmation,['Si','No'],0, False) = 0 then
  begin
   try
     if(dmCliente.cdsProductos.recordcount=1)or(cxGridDBTableView39.Controller.SelectedRowCount<=1) then
       dmCliente.cdsProductos.Delete//accion para borrar un solo registro
    else
      cxGridDBTableView39.Controller.DeleteSelection;//grd_factura.SelectedRows.Delete;//accion para borrar varios registros
    except
      end;
   end;

   cxGridDBTableView39.Controller.ClearSelection;//grd_factura.SelectedRows.clear;
end;

procedure TfrmProductos.DataSetEdit1Execute(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;//edicion
  DBEdit1.Enabled := False;
  old_producto := dmCliente.cdsProductosnombre_producto.asstring;
  dmCliente.cdsProductos.edit;
end;

procedure TfrmProductos.DataSetInsert1Execute(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;//edicion
  dmCliente.cdsProductos.Append;
  DBEdit1.Enabled := True;
end;

procedure TfrmProductos.DataSetPost1Execute(Sender: TObject);
var sError :string;
begin
  ToolBar1.SetFocus;
  sError := EmptyStr;

  if (dbedit1.Field.IsNull)or(trim(dbedit1.Field.Value)=EmptyStr)  then
    sError := 'el campo producto no puede ser vacio'
  else
  if (dbedit2.Field.IsNull)or(trim(dbedit2.Field.Value)=EmptyStr)then
    sError := 'el campo nombre no puede ser vacio'
  else
  if (dbedit3.Field.IsNull)or(trim(dbedit3.Field.Value)=EmptyStr)then
    sError := 'el campo valor no puede ser vacio'
  else
  if (dmCliente.cdsProductos.State in [dsinsert])and(dmCliente.FoundField(dmcliente.cdsProductos,'producto', VarArrayOf([dbedit1.Field.Value])))  then
    sError := 'ya existe un producto con el mismo codigo'
  else
  if (old_producto <> dbedit2.Field.Value)and
     dmcliente.FoundField(dmcliente.cdsProductos,'nombre_producto', VarArrayOf([dbedit2.Field.Value]))  then
    sError := 'ya existe un producto con el mismo nombre';

  if sError <> EmptyStr  then
  begin
    CtmMsgDlg('',sError,mterror,['Aceptar'],0,false);
    Abort;
  end
  else
  begin
    dmCliente.cdsProductos.post;
    PageControl1.ActivePage := TabSheet1;//edicion
  end;
end;

procedure TfrmProductos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCliente.cdsProductos.Active := false;
end;

procedure TfrmProductos.FormCreate(Sender: TObject);
begin
  dmCliente.cdsProductos.Active := true;
end;

procedure TfrmProductos.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TfrmProductos.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    dmCliente.cdsProductos.Cancel;
end;

procedure TfrmProductos.tb_cerrarClick(Sender: TObject);
var s :string;
begin
with dmCliente do
     begin
     if(cdsProductos.Modified)or(cdsProductos.ChangeCount>0)then
        begin
        s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Registro de Productos?';

        if CtmMsgDlg('',s,mtConfirmation,['Si','No'],0,false) = 0 then
           ClientDataSetApply1Execute(nil)
        else
           ClientDataSetUndo1Execute(nil);
        end
     else
        ClientDataSetUndo1Execute(nil);
     end;

  ModalResult := mrok;     
end;

end.
