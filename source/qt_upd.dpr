program qt_upd;

uses
  Forms,
  updatus in 'updatus.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
