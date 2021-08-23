unit uFrmClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, DB, DBClient, MConnect, Grids, DBGrids, ExtCtrls, DBCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, ImgList,
  ComCtrls, ToolWin, DBClientActns, DBActns, ActnList, StdCtrls, Mask,
  ButtonComps;

type
  TFrmClientes = class(TForm)
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
    Panel1: TPanel;
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
    ImageList1: TImageList;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    DataSetRefresh1: TDataSetRefresh;
    ToolButton13: TToolButton;
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
    procedure DataSetDelete1Execute(Sender: TObject);
    procedure DataSetEdit1Execute(Sender: TObject);
    procedure DataSetPost1Execute(Sender: TObject);
    procedure DataSetCancel1Execute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClientDataSetApply1Execute(Sender: TObject);
    procedure tb_cerrarClick(Sender: TObject);
    procedure cxGridDBTableView39KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    old_nombre : string;
  end;

implementation

{$R *.dfm}

uses uDatamodule, CustomMsgDlg;

procedure TFrmClientes.CreateParams(var Params: TCreateParams);
begin
inherited CreateParams(Params);
with Params do
     begin
     WinClassName := ' RAJB SRC';
     Style := (Style or WS_POPUP) and not WS_DLGFRAME;
     end;
end;

procedure TFrmClientes.cxGridDBTableView39KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 46 then
  begin
    key := 0;
    DataSetDelete1Execute(nil);
    abort;
  end;
end;

procedure TFrmClientes.ClientDataSetApply1Execute(Sender: TObject);
begin
  with dmCliente do
  begin
    cdsClientes.disableControls;

    try
      cdsClientes.ApplyUpdates(0);

    except
      on E:EDataBaseError do
      begin
        CtmMsgDlg('',pchar(''+E.Message+'!!'),mtWarning,['Aceptar'],0,false);//warning
        cdsClientes.enableControls;
        exit;
      end
      else
      begin
        cdsClientes.Cancel;//?
        cdsClientes.enableControls;
        exit;
      end;
    end;

    cdsClientes.refresh;
    cdsClientes.enableControls;
  end;
end;

procedure TFrmClientes.ClientDataSetUndo1Execute(Sender: TObject);
begin
  dmCliente.cdsClientes.CancelUpdates;
end;

procedure TFrmClientes.DataSetCancel1Execute(Sender: TObject);
begin
  dmCliente.cdsClientes.Cancel;
  PageControl1.ActivePage := TabSheet1;//edicion
end;

procedure TFrmClientes.DataSetDelete1Execute(Sender: TObject);
var s:string;
begin
  if(cxGridDBTableView39.Controller.SelectedRowCount<=1) then
   s:='¿Desea eliminar el registro del cliente ['+dmCliente.cdsClientesnombre_cliente.AsString+'] ?'
  else
  if cxGridDBTableView39.Controller.SelectedRowCount >1 then
    s:='¿Desea eliminar los registro seleccionados ?';

  if CtmMsgDlg('Eliminar registro',s,mtConfirmation,['Si','No'],0, False) = 0 then
  begin
   try
     if(dmCliente.cdsClientes.recordcount=1)or(cxGridDBTableView39.Controller.SelectedRowCount<=1) then
       dmCliente.cdsClientes.Delete//accion para borrar un solo registro
    else
      cxGridDBTableView39.Controller.DeleteSelection;//grd_factura.SelectedRows.Delete;//accion para borrar varios registros
    except
      end;
   end;

   cxGridDBTableView39.Controller.ClearSelection;//grd_factura.SelectedRows.clear;
end;

procedure TFrmClientes.DataSetEdit1Execute(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;//edicion
  DBEdit1.Enabled := False;
  old_nombre := dmCliente.cdsClientesnombre_cliente.asstring;
  dmCliente.cdsClientes.edit;
end;

procedure TFrmClientes.DataSetInsert1Execute(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;//edicion
  dmCliente.cdsClientes.Append;
  DBEdit1.Enabled := True;
end;

procedure TFrmClientes.DataSetPost1Execute(Sender: TObject);
var sError :string;
begin
  ToolBar1.SetFocus;
  sError := EmptyStr;

  if (dbedit1.Field.IsNull)or(trim(dbedit1.Field.Value)=EmptyStr)  then
    sError := 'el campo cliente no puede ser vacio'
  else
  if (dbedit2.Field.IsNull)or(trim(dbedit2.Field.Value)=EmptyStr)then
    sError := 'el campo nombre no puede ser vacio'
  else
  if (dmCliente.cdsClientes.State in [dsinsert])and(dmCliente.FoundField(dmcliente.cdsClientes,'cliente', VarArrayOf([dbedit1.Field.Value])))  then
    sError := 'ya existe un cliente con el mismo codigo'
  else
  if (old_nombre <> dbedit2.Field.Value)and
     (dmcliente.FoundField(dmcliente.cdsClientes,'nombre_cliente', VarArrayOf([dbedit2.Field.Value])))  then
    sError := 'ya existe un cliente con el mismo nombre';

  if sError <> EmptyStr  then
  begin
    CtmMsgDlg('',sError,mterror,['Aceptar'],0,false);
    Abort;
  end
  else
  begin
    dmCliente.cdsClientes.post;
    PageControl1.ActivePage := TabSheet1;//edicion
  end;
end;

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmCliente.cdsClientes.Active := false;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  dmCliente.cdsClientes.Active := true;
end;

procedure TFrmClientes.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(WM_SYSCOMMAND, $F012, 0);
end;

procedure TFrmClientes.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
    dmCliente.cdsClientes.Cancel;
end;

procedure TFrmClientes.tb_cerrarClick(Sender: TObject);
var s :string;
begin
with dmCliente do
     begin
     if(cdsClientes.Modified)or(cdsClientes.ChangeCount>0)then
        begin
        s:='¿Desea guardar los cambios efectuados'+chr(13)+'en Registro de Clientes?';

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
