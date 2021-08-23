unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtNombre: TEdit;
    edtHoras: TSpinEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses CustomMsgDlg;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var fValor  :Double;
begin
  if trim(edtNombre.Text) = EmptyStr then
     CtmMsgDlg('','Por favor digite el nombre del empleado.',mtWarning,['Aceptar'],0,false)
  else
  if edtHoras.Value <= 0 then
     CtmMsgDlg('','Por favor digite el número de horas trabajadas.',mtWarning,['Aceptar'],0,false)
  else
  begin
    if edtHoras.Value>35 then
      fValor := ((edtHoras.Value-35)*19000) + 525000
    else
      fValor := edtHoras.Value*15000;

    CtmMsgDlg('Calculo de Salario','Al Empleado ['+edtNombre.text+'] se le debe pagar la suma de ['+FormatFloat('###,###,##0', fValor)+'] pesos.',mtinformation,['Aceptar'],0,false);
  end;
end;

end.
