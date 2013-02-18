unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, Series, TeeFunci,
  StdCtrls, IniFiles;

type
  TForm3 = class(TForm)
    cht1: TChart;
    adtfnctnTeeFunction1: TAddTeeFunction;
    brsrsSeries1: TBarSeries;
    cht2: TChart;
    arsrsSeries1: TAreaSeries;
    btn1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  DLLInstance: THandle;
implementation

uses Main;

{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction); //При закритті форми 3
begin
  if form1.idftp2.Connected = True then
  begin
    Form1.idftp2.Disconnect;
  end
  else
  begin
    Form1.remfiles;
    Application.Terminate;
  end;
end;

procedure TForm3.btn1Click(Sender: TObject);//Оновлення результатів
var
  me: TMemoryStream;
  ini: TIniFile;
  userc, i, ID, ia, res, fast, slow, mini, max, min, time: integer;
  dat: string;
  ball: array[1..100] of Integer;

begin
  Main.Form1.idftp2.Host := '176.37.113.152';
  Main.Form1.idftp2.Username := 'QTESTER';
  Main.Form1.idftp2.Password := '83H3M52G';
  Main.Form1.idftp2.Passive := True;
  Main.Form1.idftp2.Port := 21;
  try
    Main.Form1.idftp2.connect;
  except
    on e: Exception do
    begin
      ShowMessage('Не має з*єднання з Інтернетом!' + ' Помилка: ' + e.Message);
      Form1.remfiles;
      Application.terminate;
    end;
  end;
  ChDir(ExtractFilePath(Application.ExeName));
  I := 1;
  Main.Form1.tmr4.Enabled := False;
  Form3.arsrsSeries1.Clear;
  Form3.brsrsSeries1.Clear;

  form3.show;
  Form1.Hide; //reading result and vieving
  me := TMemoryStream.Create;
  try
    Main.Form1.idftp2.Get('data/' + vuzname + '/' + kurs + '/0'+inttostr(form3.Tag)+'/results/ires.da0', me);
  except
    on E: Exception do
    begin
      ShowMessage('Не має результатів по цьому запиту');
      Main.Form1.idftp2.disconnect;
      Exit;
    end;
  end;
  me.SaveToFile('ires.da0');
  me.Free;
  chdir(ExtractFilePath(Application.ExeName));
  dat := (ExtractFilePath(Application.ExeName)) + 'ires.da0';
  ini := TIniFile.Create(dat);
  userc := ini.ReadInteger('General', 'UC', 1);
  for I := 1 to userc do
  begin
    res := ini.ReadInteger('Info_' + inttostr(I), '12sysbl', 0);
    user := ini.ReadString('Info_' + IntToStr(I), 'User', '####');
    time := ini.Readinteger('Info_' + inttostr(I), 'Time', 0);
    ia := 0;
    form3.brsrsSeries1.AddXY(I, res, user);
    form3.arsrsSeries1.AddXY(I, time, user);
    Form3.arsrsSeries1.Repaint;
    Form3.brsrsSeries1.Repaint;
  end;
  ini.Free;
  Main.Form1.idftp2.disconnect;
  form3.caption := 'Оцінки ' + vuzname + ', курс №' + kurs;
  deletefile('ires.da0');
end;
end.
