unit ufrmpincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  Tfrmpincipal = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpincipal: Tfrmpincipal;

implementation

{$R *.dfm}

procedure Tfrmpincipal.Button1Click(Sender: TObject);
var i,anterior,nuevo : integer;

procedure generar_serie(var anterior,nuevo:integer);
var tmp :integer;
begin
 if i>0 then
 begin
   tmp := anterior;
   anterior := nuevo;
   nuevo := tmp + nuevo;
 end
 else
   exit;

 memo1.lines. add (inttostr(nuevo));
 i := i-1;
 generar_serie(anterior, nuevo);
end;

begin
  memo1.lines.Clear;
  i:= SpinEdit1.Value;
  anterior := 1;
  nuevo := 0;

  {$REGION 'habilitar solo si el numero inicial puede ser 0'}
  //if i = 0  then
  //  memo1.lines.add(inttostr(nuevo))
  //else
  {$ENDREGION}
  generar_serie(anterior,nuevo);

end;

end.
