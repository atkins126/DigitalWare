unit uFrmPrincipal;

interface

uses
  Windows, forms, Controls, StdCtrls, ExtCtrls, Classes,uFrmClientes,
  ufrmFactura, ufrmProductos, SysUtils;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    frmFactura: TfrmFactura;
    frmProductos: TfrmProductos;
    FrmClientes: TFrmClientes;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses uDatamodule, DB, CustomMsgDlg, dialogs;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0 :try
        frmProductos := TfrmProductos.Create(Self);
        frmProductos.ShowModal;
        finally
         FreeAndNil(frmProductos);
        end;

  1 : try
        FrmClientes := TFrmClientes.Create(Self);
        FrmClientes.ShowModal;
        finally
         FreeAndNil(FrmClientes);
        end;

   2: try
        frmFactura := TfrmFactura.Create(Self);
        frmFactura.ShowModal;
        finally
         FreeAndNil(frmFactura);
        end;

  end;
end;

end.
