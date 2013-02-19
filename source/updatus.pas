unit updatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP, IniFiles;

type
  TForm1 = class(TForm)
    idftp2: TIdFTP;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ver_old, ver_new, way,dfn: string;
  M: TMemoryStream;
  ver_F: TIniFile;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  m1:TMemoryStream;
begin
  if not FileExists('ver.ini') then
  begin
    M := TMemoryStream.Create;
  idftp2.Host := '176.37.113.152';
  idftp2.Username := 'QTESTER';
  idftp2.Password := '83H3M52G';
  idftp2.Passive := True;
  idftp2.Port := 21;
  idftp2.Connect;
  idftp2.Get('ver.ini', m);
  m.SaveToFile('ver.tmp');
  m.free;
  dfn:='QTester.exe';
          if fileexists(dfn) then
          begin
          DeleteFile(dfn);
          end;
          begin
            DeleteFile('ver.ini');
           M1 := TMemoryStream.Create;
          idftp2.Get('QTester.exe', m1);
          m1.SaveToFile('QTester.exe');
          m1.Clear;
          idftp2.Get('ver.ini', m1);
          m1.SaveToFile('ver.ini');
          m1.Clear;
          idftp2.Get('qtdll.dll', m1);
          m1.SaveToFile('qtdll.dll');
          m1.free;
          ShowMessage('Успішно отримано!');
          idftp2.disconnect;
          Application.Terminate;
  end;
  way := ExtractFilePath(Application.ExeName) + 'ver.tmp';
  M := TMemoryStream.Create;
  idftp2.Host := '176.37.113.152';
  idftp2.Username := 'QTESTER';
  idftp2.Password := '83H3M52G';
  idftp2.Passive := True;
  idftp2.Port := 21;
  idftp2.Connect;
  idftp2.Get('ver.ini', m);
  m.SaveToFile('ver.tmp');
  m.free;
  ver_f := TIniFile.Create(way);
  ver_new := ver_F.ReadString('Version', 'V', '0');
  ver_F.Free;
  ver_f := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'ver.ini');
  ver_old := ver_F.ReadString('Version', 'V', '0');
  ver_F.Free;
  DeleteFile('ver.tmp');
  if StrToInt(ver_old) < StrToInt(ver_new) then
  begin
    case Application.MessageBox('Оновити', 'Є новіша версія',
      MB_YESNO + MB_ICONQUESTION) of
      IDYES:
        begin
          dfn:='QTester.exe';
          if fileexists(dfn) then
          begin
          DeleteFile(dfn);
          end;
          begin
            DeleteFile('ver.ini');
           M1 := TMemoryStream.Create;
          idftp2.Get('QTester.exe', m1);
          m1.SaveToFile('QTester.exe');
          m1.Clear;
          idftp2.Get('ver.ini', m1);
          m1.SaveToFile('ver.ini');
          m1.Clear;
          idftp2.Get('qtdll.dll', m1);
          m1.SaveToFile('qtdll.dll');
          m1.free;
          ShowMessage('Успішно оновлено!');
          idftp2.disconnect;
          Application.Terminate;
          end;
        end;
      IDNO:
        begin
          idftp2.disconnect;
          Application.Terminate;
        end;
    end;
  end
  else
    ShowMessage('Не має нових версій');
    idftp2.disconnect;
  Application.Terminate;
end;
end;

end.


