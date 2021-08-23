program GenSerieF;

uses
  Forms,
  ufrmpincipal in 'ufrmpincipal.pas' {frmpincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmpincipal, frmpincipal);
  Application.Run;
end.
