program AppCliente;

uses
  Forms,
  uFrmClientes in 'uFrmClientes.pas' {FrmClientes},
  ufrmFactura in 'ufrmFactura.pas' {frmFactura},
  uDatamodule in 'uDatamodule.pas' {dmCliente: TDataModule},
  ufrmProductos in 'ufrmProductos.pas' {frmProductos},
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  ufrmRegFactura in 'ufrmRegFactura.pas' {FrmRegFactura},
  CustomMsgDlg in 'CustomMsgDlg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
