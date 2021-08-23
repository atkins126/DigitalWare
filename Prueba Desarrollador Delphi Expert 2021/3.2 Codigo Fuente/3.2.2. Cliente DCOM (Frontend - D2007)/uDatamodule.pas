unit uDatamodule;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect,Dialogs, inifiles, StrUtils ;

type
  TdmCliente = class(TDataModule)
    cdsClientes: TClientDataSet;
    Conexion: TDCOMConnection;
    dtssClientes: TDataSource;
    cdsProductos: TClientDataSet;
    dtsProductos: TDataSource;
    dtsDetalle_Factura: TDataSource;
    dtsFacturas: TDataSource;
    cdsDetalle_Factura: TClientDataSet;
    cdsFacturas: TClientDataSet;
    cdsProductosproducto: TIntegerField;
    cdsProductosnombre_producto: TStringField;
    cdsProductosvalor: TFloatField;
    cdsFacturasnumero: TIntegerField;
    cdsFacturascliente: TIntegerField;
    cdsFacturasfecha: TDateField;
    cdsFacturastotal: TFloatField;
    cdsDetalle_Facturanumero: TIntegerField;
    cdsDetalle_Facturaproducto: TIntegerField;
    cdsDetalle_Facturacantidad: TIntegerField;
    cdsDetalle_Facturavalor: TFloatField;
    cdsDetalle_Facturaitem: TStringField;
    cdsFacturasCARTOT: TAggregateField;
    cdsDetalle_FacturaSUMTOT: TAggregateField;
    cdsDetalle_FacturaSUBT: TFloatField;
    cdsConsulta: TClientDataSet;
    cdsClientescliente: TIntegerField;
    cdsClientesnombre_cliente: TStringField;
    cdsClientesdireccion: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsClientesDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ConexionBeforeConnect(Sender: TObject);
    procedure cdsDetalle_FacturaCalcFields(DataSet: TDataSet);
    procedure cdsProductosDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsFacturasNewRecord(DataSet: TDataSet);
    procedure cdsFacturasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsDetalle_FacturaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsDetalle_FacturaproductoChange(Sender: TField);
    procedure cdsFacturasnumeroChange(Sender: TField);
    procedure cdsDetalle_FacturaAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TratarExcepciones(DataSet:TDataSet;e:Exception;tabla:string);
    function FoundField(ADataSet:TClientDataSet;AField:String;AValue:Variant):Boolean;
  end;

var
  dmCliente: TdmCliente;
  function QuitaEn(Cadena, Esto: String): String;

implementation

uses CustomMsgDlg, Forms, Variants, uFrmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function QuitaEn(Cadena, Esto: String): String;
var
  aPos: Integer;
begin
  aPos := Pos(Esto, Cadena);
  Result:= '';
  while (aPos > 0) do
  begin
    Result := Result + Copy(Cadena, 1, aPos-1);
    Delete(Cadena, 1, aPos + Length(Esto)-1);
    aPos := Pos(Esto, Cadena);
  end;
  Result := Result+Cadena;
end;

function TdmCliente.FoundField(ADataSet:TClientDataSet;AField:String;AValue:Variant):Boolean;
var
  cdsClone: TClientDataSet;
begin
  Result := false;
  if not(ADataSet.active)or(ADataSet.recordcount=0) then
    exit;

  cdsClone := TClientDataSet.Create(NIL);
  try
    cdsClone.CloneCursor(ADataSet,True);
    Result := cdsClone.Locate(AField,AValue,[]);
  finally
    cdsClone.Free;
  end;
end;

//------------------------------ PROCEDIMIENTO ---------------------------------
//NOMBRE: TratarExcepciones.
//DESCRIPCIÓN: Despliega el correspondiente mensaje en español de la excepción
//             producida en el servidor de datos por un ERROR.
//PARAMETROS: sender - sender.   e - Exception disparada por la BD.
//------------------------------------------------------------------------------
procedure TdmCliente.TratarExcepciones(DataSet:TDataSet;e:Exception;tabla:string);
var err:string;
Begin
if AnsiContainsText(E.Message,'must have a value') then begin
   err:= 'El campo ['+trim(quitaen(quitaen(E.Message,'Field'),'must have a value'))+'] no puede ser vacio.';
   CtmMsgDlg('',err,mterror, ['Aceptar'],0,false);
   Abort;
end;
if AnsiContainsText(E.Message,'Key violation') then begin
   CtmMsgDlg('','Intentando duplicar un registro que ya existe en la tabla '+tabla,mtWarning, ['Aceptar'],0,false);
   Abort;
end;
if AnsiContainsText(E.Message,'Record not found or changed by another user') then begin
   err:='Registro eliminado o modificado por otro usuario en linea.';
   CtmMsgDlg('',err,mterror, ['Aceptar'],0,false);
   Abort;
end;
if AnsiContainsText(E.Message,'violation of PRIMARY or UNIQUE KEY') then begin
   err:='Intentando añadir un registro existente en la tabla '+tabla+'.';
   CtmMsgDlg('',err,mterror, ['Aceptar'],0,false);
   Abort;
end;
if AnsiContainsText(E.Message,'violation of FOREIGN KEY') then begin
   err:='Violación de integridad de datos en la tabla '+tabla;
   err:=err+' al ingresar/editar registros debido a relación con otras tablas.';
   CtmMsgDlg('',err,mterror, ['Aceptar'],0,false);
   Abort;
end;
if AnsiContainsText(E.Message,'Linkfields to detail must be unique') then begin
   err:='Intentando añadir un registro existente en la tabla '+tabla+'.';
   CtmMsgDlg('',err,mterror, ['Aceptar'],0,false);
   Abort;
end;
CtmMsgDlg('',e.Message,mterror, ['Aceptar'],0,false);
Abort;
end;
//------------------------------------------------------------------------------

procedure TdmCliente.cdsClientesDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
try
  IF (StrPos(PChar(E.Message),PChar('FOREIGN')) <> nil) THEN
    exception.create('No puede eliminar este registro por tener otro asociado a él!!')
  else
  IF (StrPos(PChar(E.Message),PChar('Cannot delete master record with details.')) <> nil) THEN
    exception.create('No puede eliminar este registro por tener otro(s) asociado(s) a él!!');
  except
    on e:exception do
    begin
      CtmMsgDlg('',E.Message,mterror, ['Aceptar'],0,false);
      exit;
    end;
  end;
end;

procedure TdmCliente.cdsDetalle_FacturaAfterDelete(DataSet: TDataSet);
begin
  cdsFacturas.edit;
  cdsFacturastotal.Value := cdsDetalle_FacturaSUMTOT.Value;
  cdsFacturas.post;  
end;

procedure TdmCliente.cdsDetalle_FacturaCalcFields(DataSet: TDataSet);
begin
IF cdsDetalle_Facturaproducto.asstring <> EmptyStr then
  cdsDetalle_FacturaSUBT.AsFloat := cdsDetalle_Facturavalor.asfloat * cdsDetalle_Facturacantidad.AsFloat;

if(cdsFacturas.state in [dsinsert, dsedit])and (cdsDetalle_FacturaSUMTOT.value<>Null)then
   cdsFacturastotal.Value := cdsDetalle_FacturaSUMTOT.Value;
end;

procedure TdmCliente.cdsDetalle_FacturaPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TratarExcepciones(cdsDetalle_Factura,e,'Detalle Factura');
end;

procedure TdmCliente.cdsDetalle_FacturaproductoChange(Sender: TField);
begin
IF cdsDetalle_Facturaproducto.AsString <> EmptyStr then
   begin
   cdsDetalle_Facturavalor.AsFloat := cdsProductosvalor.asfloat;
   if cdsDetalle_Facturacantidad.asstring <> EmptyStr then
      cdsDetalle_Factura.Post;
   end;
end;

procedure TdmCliente.cdsFacturasNewRecord(DataSet: TDataSet);
begin
  cdsFacturascliente.Value := cdsClientescliente.Value;
  cdsFacturasfecha.Value := Date;
  cdsFacturastotal.Value := 0.0;
end;

procedure TdmCliente.cdsFacturasnumeroChange(Sender: TField);
begin
  sender.tag := 0;
  if (dmCliente.cdsFacturas.State in [dsinsert])and not(Sender.IsNull) then
  begin
    if (dmCliente.FoundField(dmcliente.cdsFacturas,'numero', VarArrayOf([Sender.Value]))) then
      sender.tag := 1
    else
    begin
      cdsConsulta.close;
      cdsConsulta.CommandText := 'select * from public.cabeza_factura where numero = '+Sender.asstring;
      cdsConsulta.Active := true;

      if not cdsConsulta.IsEmpty then
        sender.tag := 1
    end;

    if sender.tag = 1 then
    begin
      CtmMsgDlg('','ya existe una factura con el mismo numero',mtError,['Aceptar'],0,false);
      Sender.Clear;
      cdsFacturasnumero.AsString := EmptyStr;
    end;
  end;

end;

procedure TdmCliente.cdsFacturasPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  TratarExcepciones(cdsFacturas,e,'Facturas');
end;

procedure TdmCliente.cdsProductosDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
try
  IF (StrPos(PChar(E.Message),PChar('FOREIGN')) <> nil) THEN
    exception.create('No puede eliminar este registro por tener otro asociado a él!!')
  else
  IF (StrPos(PChar(E.Message),PChar('Cannot delete master record with details.')) <> nil) THEN
    exception.create('No puede eliminar este registro por tener otro(s) asociado(s) a él!!');
  except
    on e:exception do
    begin
      CtmMsgDlg('',E.Message,mterror, ['Aceptar'],0,false);
      exit;
    end;
  end;
end;

procedure TdmCliente.ConexionBeforeConnect(Sender: TObject);
var MyIniFile: TIniFile;
    rutaDB:string;
begin
  rutaDB:=ExtractFilePath(Application.ExeName)+'Params.ini';
  MyIniFile := TIniFile.Create(rutaDB);

  try
    self.Conexion.Close;
    Conexion.ComputerName := MyIniFile.ReadString('PARAMS','ComputerName',EmptyStr);
    Conexion.ServerGUID := MyIniFile.ReadString('PARAMS','ServerGUID',EmptyStr);
    Conexion.ServerName := MyIniFile.ReadString('PARAMS','ServerName',EmptyStr);
    except
      on e:exception do
      begin
        CtmMsgDlg('','No se puede abrir el archivo de configuración o no se encuentra!!',mtError,['Aceptar'],0,false);
        MyIniFile.Free;
        exit;
      end;
    end;
end;

procedure TdmCliente.DataModuleCreate(Sender: TObject);
begin
 try
   Conexion.Connected := true;
   except
    on e:exception do
    begin
      CtmMsgDlg('',e.Message,mtError,['Aceptar'],0,false);
      Application.terminate;
    end;
 end;

end;

procedure TdmCliente.DataModuleDestroy(Sender: TObject);
begin
  Conexion.Connected := False;
end;

end.
