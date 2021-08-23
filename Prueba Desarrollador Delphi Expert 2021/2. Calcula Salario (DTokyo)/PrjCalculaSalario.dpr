program PrjCalculaSalario;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  CustomMsgDlg in '..\3.2 Codigo Fuente\2. Cliente DCOM (Frontend - D2007)\CustomMsgDlg.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
