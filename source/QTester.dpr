program QTester;

{%ToDo 'QTester.todo'}

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  SC6 in 'SC6.pas',
  Unit4 in 'Unit4.pas' {load};

{$R *.res}

begin
  Application.Initialize;
  load:=Tload.Create(application);
  load.Show;
  Application.Title := 'QTester';
  load.pb1.Position:=load.pb1.Position+10;
  load.pb1.Position:=load.pb1.Position+10;
  Application.CreateForm(TForm1, Form1);
  load.pb1.Position:=load.pb1.Position+10;
  Application.CreateForm(TForm3, Form3);
  load.pb1.Position:=load.pb1.Position+10;
  load.free;
  Application.Run;
  end.

