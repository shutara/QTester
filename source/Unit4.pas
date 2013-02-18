unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,Main, ExtCtrls, sSkinManager;

type
  Tload = class(TForm)
    pb1: TProgressBar;
    tmr1: TTimer;
    function load:Boolean;
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  load: Tload;
  I:integer;
implementation

uses Unit2, Unit3;

{$R *.dfm}


{ Tload }

function Tload.load:boolean;
begin
  Main.Form1.Hide;
if Main.Form1.idftp2.Connected=True then
begin
  pb1.Position:=100;
  result:=True;
end
else
begin
  result:=False;
end;
end;

procedure Tload.tmr1Timer(Sender: TObject);
begin
if load=False then
begin
tmr1.enabled:=false;
showmessage('Не має зєднання з мережею!');
Application.terminate;
end
else
begin
  Main.Form1.Show;
 tmr1.Enabled:=False;
end;
end;

end.
