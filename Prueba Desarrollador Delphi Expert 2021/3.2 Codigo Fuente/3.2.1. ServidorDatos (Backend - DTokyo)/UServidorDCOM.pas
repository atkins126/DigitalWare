unit UServidorDCOM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ServidorDatos_TLB, StdVcl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.SysUtils;

type
  TServidorDCOM = class(TRemoteDataModule, IServidorDCOM)
    FDConnection1: TFDConnection;
    FDTransaction1: TFDTransaction;
    qryProductos: TFDQuery;
    qryProductosproducto: TIntegerField;
    qryProductosnombre_producto: TStringField;
    qryProductosvalor: TFloatField;
    qryDetalle_Factura: TFDQuery;
    qryFacturas: TFDQuery;
    qryClientes: TFDQuery;
    qryClientescliente: TIntegerField;
    qryClientesnombre_cliente: TStringField;
    qryClientesdireccion: TStringField;
    dtpProductos: TDataSetProvider;
    dtpDetalle_Factura: TDataSetProvider;
    dtpFacturas: TDataSetProvider;
    dtpClientes: TDataSetProvider;
    qryFacturasnumero: TIntegerField;
    qryFacturasfecha: TDateField;
    qryFacturascliente: TIntegerField;
    qryFacturastotal: TFloatField;
    qryDetalle_Facturanumero: TIntegerField;
    qryDetalle_Facturaproducto: TIntegerField;
    qryDetalle_Facturacantidad: TIntegerField;
    qryDetalle_Facturavalor: TFloatField;
    qryConsulta: TFDQuery;
    dtpConsulta: TDataSetProvider;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure Activar; safecall;
    procedure Desactivar; safecall;
  public
    { Public declarations }
  end;

implementation

uses
  Vcl.Forms, CustomMsgDlg, Vcl.Dialogs;

{$R *.DFM}

procedure TServidorDCOM.FDConnection1BeforeConnect(Sender: TObject);
var rutaDB:string;
begin
  rutaDB:=ExtractFilePath(Application.ExeName)+'FDConnection1.Params';
  if not FileExists(rutaDB) then
  begin
    CtmMsgDlg('','No se puede abrir el archivo de configuración o no se encuentra!!',mtError,['Aceptar'],0,false);
    exit;
  end;

  FDConnection1.Params.LoadFromFile(rutaDB);
end;

class procedure TServidorDCOM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TServidorDCOM.Activar;
begin
 if FDConnection1.Connected = false then
  FDConnection1.Connected := True;
end;

procedure TServidorDCOM.Desactivar;
begin
 if FDConnection1.Connected = true then
  FDConnection1.Connected := False;
end;

initialization
  TComponentFactory.Create(ComServer, TServidorDCOM,
    Class_ServidorDCOM, ciMultiInstance, tmApartment);
end.
