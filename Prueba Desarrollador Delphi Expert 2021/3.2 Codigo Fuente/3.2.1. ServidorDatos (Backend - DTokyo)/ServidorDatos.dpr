program ServidorDatos;

uses
  Vcl.Forms,
  frm_principal in 'frm_principal.pas' {f_Principal},
  ServidorDatos_TLB in 'ServidorDatos_TLB.pas',
  UServidorDCOM in 'UServidorDCOM.pas' {ServidorDCOM: TRemoteDataModule} {ServidorDCOM: CoClass},
  CustomMsgDlg in '..\2. AppClientes\CustomMsgDlg.pas';

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.ShowMainForm := False;
  Application.Title := 'ServidorDatos';
  Application.CreateForm(Tf_Principal, f_Principal);
  Application.Run;
end.
