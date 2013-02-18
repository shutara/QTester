unit Main;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ShellAPI, StdCtrls, ComCtrls, IniFiles, ExtCtrls, Unit2,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP, IdHTTP,
  sSkinManager, SC6,ComObj;
type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    btn1: TButton;
    btn2: TButton;
    var1: TButton;
    var2: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    var3: TButton;
    var4: TButton;
    var5: TButton;
    btn3: TButton;
    tmr1: TTimer;
    lbl3: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    tmr3: TTimer;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    dlgOpen1: TOpenDialog;
    tmr4: TTimer;
    idftp2: TIdFTP;
    idhtp: TIdHTTP;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    btn4: TButton;
    btn5: TButton;
    sknmngr1: TsSkinManager;
    L1: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    tmr2: TTimer;
    redt1: TRichEdit;
    N18: TMenuItem;
    tmr5: TTimer;
    N10: TMenuItem;
    N11: TMenuItem;
    lbl5: TLabel;
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure menu(var tag:integer);
    procedure FormCreate(Sender: TObject);
    procedure var1Click(Sender: TObject);
    procedure var2Click(Sender: TObject);
    procedure var3Click(Sender: TObject);
    procedure var4Click(Sender: TObject);
    procedure var5Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
    procedure btn3KeyPress(Sender: TObject; var Key: Char);
    procedure tmr3Timer(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmr4Timer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure tmr5Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }
  public
    function FTPFileExists(const RemoteFile: string): Boolean;
    procedure testing(var id, qid: integer);
    procedure ex(Sender: TObject; E: Exception);
    function quesr(var s: integer): Integer;
    procedure testpp(var test_n; tag:integer);
    procedure loadmtm;
    procedure tagtest(var tag1:integer);
    procedure journaladd(var kurs,vuzn,pred,oc,uch:string);
    function setc:Boolean;
    procedure remfiles;
  end;
var
  Form1: TForm1;
  p0: Integer;
  i, n: integer;
  block:boolean;
  name_t,admpass: string;
  way_t,name_ta:array [1..25] of string;
  exeltn: string[100];
  test: TIniFile;
  ap:Variant;
  DLLInstance: THandle;
  link, err, q,tagg: Integer;
  questionex, answf, answt, testlist: array of string;
  a0, Testn, workdir, namet: string;
  P, x: Integer;
  s, m: Integer;
  Chmod, Qi, code: Integer;
  resultW: TextFile;
  name, user: string;
  vuzname, kurs, idd: string;
  ID: Integer;
  acc, pr, pr2, pr3, pr4, pr5: Boolean;
  v1, v2, v3, v4, v5: Boolean;
  s3: Integer;
  mpos: Integer = 0;
  ma: array[1..27] of integer;
  acckey: string;
procedure count(var E: Exception); external 'qtdll.dll';
function qtsvp(var inp: integer; text: string; decode: boolean): string; external 'qtdll.dll';
function GetHDSerNo: shortstring; external 'qtdll.dll';
implementation
uses Unit3;
{$R *.dfm}
procedure TForm1.N6Click(Sender: TObject); //����������
begin
  Application.MessageBox('������� QTester.' + #13#10 +
    '����� ��� �����.' + #13#10 + '1-� ���� �12-11 ���', '����������', MB_OK +
    MB_ICONINFORMATION + MB_TOPMOST);
end;
procedure TForm1.N7Click(Sender: TObject); //������� �� ����
begin
  ShellExecute(Handle, 'open', 'http://sav-dev.blogspot.com', nil, nil, SW_SHOWNORMAL);
end;
procedure TForm1.N8Click(Sender: TObject); //����� � ��������
begin
  remfiles;
  Application.Terminate;
end;
procedure TForm1.menu(var tag:integer); //������ ����� �1 (�������)
var
  ini:TIniFile;
  m:TMemoryStream;
  i:Integer;
  way:string;
begin
if idftp2.Connected<>True then
begin
 form1.idftp2.Host := '176.37.113.152';
  form1.idftp2.Username := 'QTESTER';
  form1.idftp2.Password := '83H3M52G';
  form1.idftp2.Passive := True;
  form1.idftp2.Port := 21;
  Form1.idftp2.Connect;
end;
if Tag=1 then
begin
  m:=TMemoryStream.Create;
idftp2.ChangeDir(way_t[1]);
idftp2.Get('01.dco',m);
m.SaveToFile('01.dco');
m.Free;
way:=ExtractFilePath(Application.ExeName)+'01.dco';
ini:=tinifile.Create(way);
btn1.Caption:=ini.ReadString('Task_11','name','null');
btn1.tag:=ini.ReadInteger('Task_1','ID',0);
btn2.Caption:=ini.ReadString('Task_12','name','null');
btn2.tag:=ini.ReadInteger('Task_2','ID',0);
btn4.Caption:=ini.ReadString('Task_13','name','null');
btn4.tag:=ini.ReadInteger('Task_3','ID',0);
end;
if Tag=2 then
begin
  m:=TMemoryStream.Create;
idftp2.ChangeDir(way_t[2]);
idftp2.Get('02.dco',m);
m.SaveToFile('02.dco');
m.Free;
way:=ExtractFilePath(Application.ExeName)+'02.dco';
ini:=tinifile.Create(way);
btn1.Caption:=ini.ReadString('Task_21','name','null');
btn1.tag:=ini.ReadInteger('Task_1','ID',0);
btn2.Caption:=ini.ReadString('Task_22','name','null');
btn2.tag:=ini.ReadInteger('Task_2','ID',0);
btn4.Caption:=ini.ReadString('Task_23','name','null');
btn4.tag:=ini.ReadInteger('Task_3','ID',0);
end;
if Tag=3 then
begin
  m:=TMemoryStream.Create;
idftp2.ChangeDir(way_t[3]);
idftp2.Get('03.dco',m);
m.SaveToFile('03.dco');
m.Free;
way:=ExtractFilePath(Application.ExeName)+'03.dco';
ini:=tinifile.Create(way);
btn1.Caption:=ini.ReadString('Task_31','name','null');
btn1.tag:=ini.ReadInteger('Task_31','ID',0);
btn2.Caption:=ini.ReadString('Task_32','name','null');
btn2.tag:=ini.ReadInteger('Task_32','ID',0);
btn4.Caption:=ini.ReadString('Task_33','name','null');
btn4.tag:=ini.ReadInteger('Task_33','ID',0);
end;
if tag>10 then
begin
tagtest(tag);
end;
end;
procedure TForm1.FormCreate(Sender: TObject); //������ �� � ����������
label
  chk;
var
  m,m2: TMemoryStream;
  ini,ini2: TIniFile;
  way, cd, TUSN: string;
  left, top: Real;
  I, maks: Integer;
  test: TIniFile;
begin
  lbl5.Hide;
  Form1.Hide;
  form1.idftp2.Host := '176.37.113.152';
  form1.idftp2.Username := 'QTESTER';
  form1.idftp2.Password := '83H3M52G';
  form1.idftp2.Passive := True;
  form1.idftp2.Port := 21;
  try
    form1.idftp2.connect;
  except
    on e: Exception do
    begin
      ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
      remfiles;
      Application.terminate;
    end;
  end;
  m2:=TMemoryStream.Create;
  idftp2.ChangeDir('data');
  idftp2.Get('code.txt',m2);
  m2.SaveToFile('c.tmp');
  m2.free;
  ini2:=TIniFile.Create(ExtractFilePath(Application.exename)+'c.tmp');
  acckey:=ini2.ReadString('Unlock','code','80444577018');
  admpass:=ini2.ReadString('Teach','code','80444577018');
  ini2.free;
  DLLInstance := LoadLibrary('qtdll.dll');
  idd := GetHDSerNo;
    s3 := 1;
  FillChar(m, SizeOf(m), 0);
  pr := False;
  pr2 := False;
  pr3 := False;
  pr4 := False;
  pr5 := False;
  ID := 1;
  if DirectoryExists('data') then
  begin
    ChDir('data');
  end
  else
  begin
    MkDir('data');
    ChDir('data');
  end;
  Chmod := 0;
  edt1.Hide;
  lbl4.Hide;
  lbl3.Hide;
  tmr1.Enabled := false;
  btn3.hide;
  workdir := ExtractFilePath(Application.ExeName);
  var1.Hide;
  var2.Hide;
  var3.Hide;
  var4.Hide;
  var5.Hide;
  application.OnException := ex;
  lbl1.Hide;
  lbl2.Hide;
  top := ClientHeight / 2;
  var1.Top := Trunc(top);
  var2.Top := Trunc(top) + 32;
  var3.Top := Trunc(top) + 64;
  var4.Top := Trunc(top) + 96;
  var5.Top := Trunc(top) + 128;
  btn3.top := var5.Top + 100;
  btn1.Hide;// hide
  btn2.Hide;
  btn4.Hide;
  mm1 := nil;
  chk:
  if DirectoryExists(ExtractFilePath(Application.ExeName) + idd + 'b.js21') then
  begin
    block:=true;
    ShowMessage('������ �� ���������� � ���� ������ �����������, ��"������� � ��������������.');
    remfiles;
    Application.Terminate;
    end;

  chdir(ExtractFilePath(Application.ExeName));
  way := ExtractFilePath(Application.ExeName) + 'settings.ini';
  if FileExists('settings.ini') then
  begin
    Ini := tinifile.create(way);
    user := ini.ReadString('General', 'User', 'Error!');
    vuzname := ini.ReadString('General', 'VUZ', 'Error!');
    kurs := ini.ReadString('General', 'KURS', 'Error!');
    ini.Free;
  end
  else
  begin
    case
      Application.MessageBox('������ �������� ������? �� ��������� � �����������?'
      + #13#10 + '��� ��� ���������, ͳ ��� �����������.',
      '���� ������������ �� ��������', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST)
      of
      IDYES:
        begin

          way := ExtractFilePath(Application.ExeName) + 'settings.ini';
          Ini := tinifile.create(way);
          user := InputBox('�����!', '������ ������� �����������.', '');
          vuzname := InputBox('�����', '����� ����� ������ ���, �� ����� � ������.', 'KIBIT');
          kurs := InputBox('�����', '����� ������ �����', '1');
          ini.WriteString('General', 'User', user);
          ini.WriteString('General', 'VUZ', vuzname);
          ini.WriteString('General', 'KURS', kurs);
          ini.Free;
        end;
      IDNO:
        begin
          Main.form1.hide;
          user := InputBox('�����!', '������ ������� �����������.', '');
          vuzname := InputBox('�����', '����� ����� ������ ���, �� ����� � ������.', 'KIBIT');
          kurs := InputBox('�����', '����� ������ �����', '1');
        end;
    end;
  end;
    loadmtm;
end;
procedure TForm1.var1Click(Sender: TObject); //������ 1-�� �������
begin
  if pr = False then
  begin
    if v1 = true then
    begin
      p0 := p;
      p := p + 1;
      Form1.var1.Caption := var1.Hint;
      var1.Font.size := 15;
      pr := True;
    end
    else
    begin
      pr := True;
      p0 := p;
      p := p - 1;
      Form1.var1.Caption := var1.Hint;
      var1.Font.size := 15;
    end;
    lbl2.Caption := '����: ' + IntToStr(p);
  end
  else
  begin
  end;
end;
procedure TForm1.var2Click(Sender: TObject); //������ 2-�� �������
begin
  if pr2 = False then
  begin
    if v2 = true then
    begin
      p0 := p;
      p := p + 1;
      Form1.var2.Caption := var2.Hint;
      var2.Font.size := 15;
      pr2 := True;
    end
    else
    begin
      pr2 := True;
      p0 := p;
      p := p - 1;
      Form1.var2.Caption := var2.Hint;
      var2.Font.size := 15;
    end;
    lbl2.Caption := '����: ' + IntToStr(p);
  end
  else
  begin
  end;
end;
procedure TForm1.var3Click(Sender: TObject); //������ 3-�� �������
begin
  if pr3 = False then
  begin
    if v3 = true then
    begin
      p0 := p;
      p := p + 1;
      Form1.var3.Caption := var3.Hint;
      var3.Font.size := 15;
      pr3 := True;
    end
    else
    begin
      pr3 := True;
      p0 := p;
      p := p - 1;
      Form1.var3.Caption := var2.Hint;
      var3.Font.size := 15;
    end;
    lbl2.Caption := '����: ' + IntToStr(p);
  end
  else
  begin
  end;
end;
procedure TForm1.var4Click(Sender: TObject); //������ 4-�� �������
begin
  if pr4 = False then
  begin
    if v4 = true then
    begin
      p0 := p;
      p := p + 1;
      Form1.var4.Caption := var4.Hint;
      var4.Font.size := 15;
      pr4 := True;
    end
    else
    begin
      pr4 := True;
      p0 := p;
      p := p - 1;
      Form1.var4.Caption := var4.Hint;
      var4.Font.size := 15;
    end;
    lbl2.Caption := '����: ' + IntToStr(p);
  end
  else
  begin
  end;
end;
procedure TForm1.var5Click(Sender: TObject); //������ 5-�� �������
begin
  if pr5 = False then
  begin
    if v5 = true then
    begin
      p0 := p;
      p := p + 1;
      Form1.var5.Caption := var5.Hint;
      var5.Font.size := 15;
      pr5 := True;
    end
    else
    begin
      pr5 := True;
      p0 := p;
      p := p - 1;
      Form1.var5.Caption := var5.Hint;
      var5.Font.size := 15;
    end;
    lbl2.Caption := '����: ' + IntToStr(p);
  end
  else
  begin
  end;
end;
procedure TForm1.btn3Click(Sender: TObject); //������ "�������� �������"
var
  c: Integer;
  way: string;
begin
  if btn3.Caption = '��������� ����' then
  begin
    tmr2.Enabled := false;
    way := Workdir + 'data\dt.dco1';
    tmr1.Enabled := False;
    Form1.Hide;
    DeleteFile(way);
  end;
  pr := false;
  pr2 := False;
  pr3 := False;
  pr4 := False;
  pr5 := False;
  q := quesr(s3);
  s3 := s3 + 1;
  var1.Font.Size := 8;
  var2.Font.Size := 8;
  var3.Font.Size := 8;
  var4.Font.Size := 8;
  var5.Font.Size := 8;
  ID := 1;
  testing(ID, q);
  if s3 = 27 then
  begin
    btn3.Caption := '��������� ����';
  end;
end;
procedure TForm1.tmr1Timer(Sender: TObject); //³��� ����
var
  m0, s0: Integer;
begin
  s := s + 1;
  if s = 60 then
  begin
    s := 0;
    M := m + 1;
  end;
  M0 := 19 - M;
  s0 := 60 - s;
  lbl4.Caption := '��� ' + inttostr(M0) + ':' + inttostr(S0);
  if m = 20 then
  begin
    s3 := 28;
    tmr1.Enabled := False;
  end;
end;
procedure TForm1.edt1KeyPress(Sender: TObject; var Key: Char); //�������
begin
  if (Key = #27) then
  begin
    edt1.Hide;
  end;
  if (Key = #13) then
  begin
    if edt1.Text = 'exit' then
    begin
      remfiles;
      Application.Terminate;
    end;
    if edt1.Text = admpass then
    begin
      edt1.Hide;
      n2.Enabled := True;
      N3.Enabled := True;
      edt1.Hint := '���� �� ������ ������������, ��������� Escape';
    end;
    if edt1.Text = 'pmax' then
    begin
      p := 52;
      edt1.Hint := '�������� �������� �����!';
      edt1.Text := '';
    end;
    if edt1.Text = 'timestop' then
    begin
      if tmr1.Enabled = True then
      begin
        tmr1.Enabled := False;
        edt1.Hint := '����� ����������!';
        edt1.Text := '';
      end
      else
      begin
        tmr1.Enabled := true;
        edt1.Hint := '����� ��������!';
        edt1.Text := '';
      end;
    end;
    if edt1.Text = 'timezero' then
    begin
      M := 0;
      S := 0;
      edt1.Hint := '����� ��������!';
      edt1.Text := '';
    end;
    if edt1.Text = 'end' then
    begin
      tmr2.Enabled := False;
      s3 := 28;
      edt1.Hide;
      edt1.Text := '';
    end;
    if edt1.Text = 'hhelp' then
    begin
      if chmod = 0 then
      begin
        chmod := 1;
        var1.ShowHint := True;
        var2.ShowHint := True;
        var3.ShowHint := True;
        var4.ShowHint := True;
        var5.ShowHint := True;
        edt1.Text := '';
      end
      else
      begin
        chmod := 0;
        var1.ShowHint := False;
        var2.ShowHint := False;
        var3.ShowHint := False;
        var4.ShowHint := False;
        var5.ShowHint := False;
        edt1.Text := '';
       end;
    end;
  end;
end;
procedure TForm1.btn3KeyPress(Sender: TObject; var Key: Char); //�����
begin
  if (Key = 'C') then
  begin
    edt1.Show;
  end;
  if (key = 'H') then
    if chmod = 0 then
    begin
      chmod := 1;
      var1.ShowHint := True;
      var2.ShowHint := True;
      var3.ShowHint := True;
      var4.ShowHint := True;
      var5.ShowHint := True;
      edt1.Text := '';
     end
    else
    begin
      chmod := 0;
      var1.ShowHint := False;
      var2.ShowHint := False;
      var3.ShowHint := False;
      var4.ShowHint := False;
      var5.ShowHint := False;
      edt1.Text := '';
     end;
end;
function tform1.FTPFileExists(const RemoteFile: string): Boolean; //������� �������� �������� ����� �� ������
begin
  IdFTP2.List(nil, '-la ' + RemoteFile);
  Result := IdFTP2.DirectoryListing.Count > 0;
end;
procedure TForm1.tmr3Timer(Sender: TObject); //��������� ������
var
  way: string;
  me: TMemoryStream;
  res: real;
  time: real;
begin
  if s3 = 28 then
  begin
    idftp2.Host := '176.37.113.152';
    idftp2.Username := 'QTESTER';
    idftp2.Password := '83H3M52G';
    idftp2.Passive := True;
    idftp2.Port := 21;
    if idftp2.connected <> true then
    begin
      try
        idftp2.connect;
      except
        on e: Exception do
        begin
          ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
          remfiles;
          Application.terminate;
        end;
      end;
    end
    else
    begin
      idftp2.disconnect;
      try
        idftp2.connect;
      except
        on e: Exception do
        begin
          ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
          remfiles;
          Application.terminate;
        end;
      end;
    end;
    begin
      idftp2.ChangeDir('data');
      idftp2.ChangeDir(vuzname);
      idftp2.ChangeDir(kurs);
      idftp2.ChangeDir('0'+IntToStr(tagg));
       idftp2.ChangeDir('results');
      res := Round(p / 4.333333333333333);   //koef 4.3-10 = vopr_count/12;
      tmr1.Enabled := False;
      form1.Hide;
      tmr3.enabled := false;
      ShowMessage('���� �������� ! ʳ������ ����: ' + floattostr(res) + '. ���������� ���������!');
      AssignFile(resultW, 'result.txt');
      Rewrite(resultW);
      Writeln(resultW, 'Result :' + inttostr(p) + 'pts. Time : ' + Inttostr(M) + ':' + inttostr(S) + ' end.');
      CloseFile(resultW);
      way := ExtractFilePath(Application.ExeName) + 'ires.da0';
      test := TIniFile.Create(way);
      time := (m*60) + s;
      if FTPFileExists('ires.da0') = false then
      begin
        I := 1;
      end;
      test.WriteString('General', 'UC', '1');
      test.WriteString('Info_' + IntToStr(I), 'User', User);
      test.WriteString('Info_' + IntToStr(I), 'ID', '1');
      test.WriteString('Info_' + IntToStr(I), 'Time', FloatToStr(time));
      test.WriteInteger('Info_' + IntToStr(I), 'Points', p);
      test.WriteString('Info_' + IntToStr(I), '12sysbl', FloatToStr(res));
      test.Free;
      if FTPFileExists('ires.da0') = true then
      begin
        ChDir(ExtractFilePath(Application.ExeName));
        me := TMemoryStream.Create;
        idftp2.Get('ires.da0', me);
        me.SaveToFile('ires.da0');
        me.Free;
        test := TIniFile.Create(way);
        I := test.Readinteger('General', 'UC', 1) + 1;
        time := (m / 60) + s;
        test.WriteString('General', 'UC', IntToStr(I));
        test.WriteString('Info_' + IntToStr(I), 'User', User);
        test.WriteString('Info_' + IntToStr(I), 'ID', IntToStr(I));
        test.WriteString('Info_' + IntToStr(I), 'Time', FloatToStr(time));
        test.WriteInteger('Info_' + IntToStr(I), 'Points', p);
        test.WriteString('Info_' + IntToStr(I), '12sysbl', FloatToStr(res));
        test.Free;
        try
          idftp2.Put('ires.da0', 'ires.da0', false);
        finally
          idftp2.Disconnect;
          ChDir(ExtractFilePath(Application.ExeName));
          DeleteFile('ires.da0');
          tmr4.Enabled := True;
        end;
      end
      else
      begin
        try
          ChDir(ExtractFilePath(Application.ExeName));
          idftp2.Put('ires.da0', 'ires.da0', false);
        finally
          idftp2.Disconnect;
          tmr4.Enabled := True;
          ChDir(ExtractFilePath(Application.ExeName));
          DeleteFile('ires.da0');
        end;
      end;
    end;
  end;
end;
procedure TForm1.N9Click(Sender: TObject); //��������� ����� (��������)
begin
  dlgOpen1.Execute;
  DeleteFile(dlgOpen1.FileName);
  showmessage('���� ���� ��������');
end;
procedure TForm1.N2Click(Sender: TObject); //�����������
begin
  if N3.Enabled = False then
  begin
    case
      Application.MessageBox('�� ������ ������ �����������. ������ ������ ������� ��� ������������ �� ��������� Enter. �� ������ ����������?',
      '����������', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) of
      IDYES:
        begin
         edt1.Show;
        end;
      IDNO:
        begin
        end;
    end;
  end
  else
end;
procedure TForm1.N4Click(Sender: TObject);   //��������� �����
begin
  form1.Hide;
  form2.show;
  Form2.Caption := '�����������';
  name_t := InputBox('�����!', '������ ����� �����', '');
  Form2.Caption := '����������� ' + name_t;
end;
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction); //�������� �����
begin
remfiles;
  if idftp2.Connected = True then
  begin
    idftp2.Disconnect;
  end
  else
  begin
    remfiles;
    Application.Terminate;
  end;
end;
procedure TForm1.tmr4Timer(Sender: TObject); //���� ���������� �� ����������� �������
var
  me: TMemoryStream;
  ini: TIniFile;
  userc, i, ID, ia, res, fast, slow, mini, max, min, time: integer;
  dat: string;
  ball: array[1..100] of Integer;
  tag:Integer;
begin
  tmr4.Enabled := false;
  tmr2.Enabled := false;
  I := 1;
  case Application.MessageBox('�� ������ �������� ��������� ���������?',
    '����������', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) of
    IDYES:
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
            ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
            remfiles;
            Application.terminate;
          end;
        end;
        Form3.Tag:=tagg;
        form3.show;
        Form1.Hide;
        if (Tag>10)and(tag<20)then
        begin
          Tag :=1
        end;
        if (Tag>20)and(tag<30)then
        begin
          Tag :=2
        end;
        if (Tag>30)and(tag<40)then
        begin
          Tag :=3
        end;
        me := TMemoryStream.Create;
        try
          Main.Form1.idftp2.Get('data/' + vuzname + '/' + kurs +'/0' + IntToStr(tagg) + '/results/ires.da0', me);
        except
          on E: Exception do
          begin
            ShowMessage('�� �� ���������� �� ����� ������');
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
        idftp2.Disconnect;
        form3.caption := '������ ' + vuzname + ', ���� �' + kurs;
        deletefile('ires.da0');
      end;
    IDNO:
      begin
        remfiles;
        Application.Terminate;
      end;
  end;
end;
procedure TForm1.N5Click(Sender: TObject); //������������ ������ �����
begin
  dlgOpen1.Execute;
  if idftp2.Connected = False then
  begin
    idftp2.Host := '176.37.113.152';
    idftp2.Username := 'QTESTER';
    idftp2.Password := '83H3M52G';
    idftp2.Passive := True;
    idftp2.Port := 21;
    try
      idftp2.connect;
    except
      on e: Exception do
      begin
        ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
        remfiles;
        Application.terminate;
      end;
    end;
  end
  else
  begin
    idftp2.ChangeDir('tests');
    try
      idftp2.Put(dlgOpen1.FileName, ExtractFileName(dlgOpen1.FileName), false);
    finally
      idftp2.disconnect;
      idftp2.Free;
      ShowMessage('���� �����������.');
    end;
  end;
end;
procedure TForm1.N14Click(Sender: TObject); //���� ������ ��������
var
  ini: TIniFile;
  way: string;
begin
  way := ExtractFilePath(Application.ExeName) + 'settings.ini';
  Ini := tinifile.create(way);
  user := ini.ReadString('General', 'User', 'Error!');
  vuzname := ini.ReadString('General', 'VUZ', 'Error!');
  kurs := ini.ReadString('General', 'KURS', 'Error!');
  user := InputBox('�����!', '������ ������� �����������.', user);
  vuzname := InputBox('�����', '����� ����� ������ ���, �� ����� � ������.', vuzname);
  kurs := InputBox('�����', '����� ������ �����', kurs);
  ini.WriteString('General', 'User', user);
  ini.WriteString('General', 'VUZ', vuzname);
  ini.WriteString('General', 'KURS', kurs);
  ini.Free;
end;
procedure TForm1.N15Click(Sender: TObject); //��������� ���������� ����������
var
  pred:string;
begin
  if idftp2.Connected = False then
  begin
    idftp2.Host := '176.37.113.152';
    idftp2.Username := 'QTESTER';
    idftp2.Password := '83H3M52G';
    idftp2.Passive := True;
    idftp2.Port := 21;
    try
      idftp2.connect;
    except
      on e: Exception do
      begin
        ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
        remfiles;
        Application.terminate;
      end;
    end;
  end
  else
  begin
    idftp2.changedirup;
    idftp2.changedirup;
    idftp2.changedirup;
    idftp2.changedirup;
    idftp2.ChangeDir('data');
    idftp2.ChangeDir(vuzname);
    idftp2.ChangeDir(kurs);
    pred:=inputbox('ID ��������','��������� 1,2','');
    idftp2.ChangeDir(pred);
    idftp2.ChangeDir('results');
    try
      idftp2.Delete('ires.da0');
    except
      on e: Exception do
      begin
        ShowMessage('�� ���� �����!' + ' �������: ' + e.Message);
        end;
    end;
    idftp2.Disconnect;
    idftp2.Free;
  end;
end;
procedure tform1.loadmtm;  //������� ���� ��������
var
  M:TMemoryStream;
  ini:TIniFile;
  way:string;
  max,i:Integer;
  bt:array [1..25] of TButton;
begin
  lbl5.hide;
  if form1.idftp2.connected<>true then
  begin
    idftp2.Host := '176.37.113.152';
    idftp2.Username := 'QTESTER';
    idftp2.Password := '83H3M52G';
    idftp2.Passive := True;
    idftp2.Port := 21;
    form1.idftp2.connect;
  end;
  idftp2.ChangeDirUp;
  idftp2.ChangeDirUp;
  idftp2.ChangeDirUp;
  idftp2.ChangeDirUp;
  idftp2.ChangeDirUp;
  btn1.Tag:=1;
  btn2.Tag:=2;
  btn4.Tag:=3;
  way:=ExtractFilePath(Application.ExeName)+'lib.dco';
  idftp2.ChangeDir('data');
  idftp2.ChangeDir(vuzname);
  idftp2.ChangeDir(kurs);
  m:=TMemoryStream.Create;
  ChDir(ExtractFilePath(Application.ExeName));
  idftp2.Get('t_lib.dco',m);
  m.SaveToFile('lib.dco');
  m.Free;
  ini:=TIniFile.Create(way);
  max:=ini.ReadInteger('General','hu',0);
  bt[1]:=btn1;
  bt[2]:=btn2;
  bt[3]:=btn4;
  for I:=1 to max do
  begin
  name_ta[I]:=ini.ReadString('Task_'+inttostr(i),'name_t','null');
  way_t[I]:=ini.ReadString('Task_'+inttostr(i),'way_t','null');
  bt[i].Caption:=name_ta[i];
  bt[i].show;
end;
  btn5.hide;
  ini.Free;
  mm1:= mm1;
  btn1.Show;// show
  btn2.Show;
  btn4.Show;
end;
procedure TForm1.testing(var id, qid: integer); //��������� ��������� ������� �� ��������� � ����� ��
var
  way, workdir: string;
  testdata: TIniFile;
  I: Integer;
begin
  workdir := ExtractFilePath(Application.ExeName);
  way := Workdir + 'data\dt.dco1';
  testdata := tinifile.Create(way);
  begin
    lbl1.Caption := testdata.ReadString('Question_' + inttostr(qid), 'QuestionLine', 'Er');
    var1.Caption := testdata.ReadString('Question_' + inttostr(qid), 'Variant_1', 'Er');
    var2.Caption := testdata.ReadString('Question_' + inttostr(qid), 'Variant_2', 'Er');
    var3.Caption := testdata.ReadString('Question_' + inttostr(qid), 'Variant_3', 'Er');
    var4.Caption := testdata.ReadString('Question_' + inttostr(qid), 'Variant_4', 'Er');
    var5.Caption := testdata.ReadString('Question_' + inttostr(qid), 'Variant_5', 'Er');
    v1 := testdata.ReadBool('Question_' + inttostr(qid), 'CorrectVariant_1', False);
    v2 := testdata.ReadBool('Question_' + inttostr(qid), 'CorrectVariant_2', False);
    v3 := testdata.ReadBool('Question_' + inttostr(qid), 'CorrectVariant_3', False);
    v4 := testdata.ReadBool('Question_' + inttostr(qid), 'CorrectVariant_4', False);
    v5 := testdata.ReadBool('Question_' + inttostr(qid), 'CorrectVariant_5', False);
    testdata.Free;
    if v1 = False then
    begin
      var1.Hint := '����������� �������';
    end
    else
    begin
      var1.Hint := '��������� �������';
    end;
    if v2 = False then
    begin
      var2.Hint := '����������� �������';
    end
    else
    begin
      var2.Hint := '��������� �������';
    end;
    if v3 = False then
    begin
      var3.Hint := '����������� �������';
    end
    else
    begin
      var3.Hint := '��������� �������';
    end;
    if v4 = False then
    begin
      var4.Hint := '����������� �������';
    end
    else
    begin
      var4.Hint := '��������� �������';
    end;
    if v5 = False then
    begin
      var5.Hint := '����������� �������';
    end
    else
    begin
      var5.Hint := '��������� �������';
    end;
  end;
  lbl3.Caption := '������� � ' + IntToStr(s3);
end;
procedure TForm1.ex(Sender: TObject; E: Exception);
begin
  count(E);
end;
procedure TForm1.N16Click(Sender: TObject);  //��������� ��� �� ����� �� �����
var
  vuzn: string;
  I, mz: integer;
begin
  vuzn := InputBox('������ ���������� ���', '���������: ����,ʳ���,�ϲ', '');
  mz := StrToInt(InputBox('������ ������� �����', '���������: 1,2', '5'));
  idftp2.Host := '176.37.113.152';
  idftp2.Username := 'QTESTER';
  idftp2.Password := '83H3M52G';
  idftp2.Passive := True;
  idftp2.Port := 21;
  if idftp2.Connected <> True then
  begin
    try
      idftp2.connect;
    except
      on e: Exception do
      begin
        ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
        remfiles;
        Application.terminate;
      end;
    end;
    idftp2.ChangeDir('data');
    try
      idftp2.MakeDir(vuzn);
    except
      on E: Exception do
      begin
        showmessage('��� � ����� ���! ������� ���������...');
        idftp2.Disconnect;
        Exit;
      end;
    end;
    idftp2.ChangeDir(vuzn);
    for I := 1 to mz do
    begin
      try
        idftp2.MakeDir(intToStr(I));
      except
        on e: Exception do
        begin
          showmessage('��� � ����� ����! ������� ���������...');
          idftp2.Disconnect;
          Exit;
        end;
      end;
    end;
    begin
      idftp2.ChangeDir('data');
      try
        idftp2.MakeDir(vuzn);
      except
        on E: Exception do
        begin
          showmessage('��� � ����� ���! ������� ���������...');
          idftp2.Disconnect;
          Exit;
        end;
      end;
      idftp2.ChangeDir(vuzn);
      for I := 1 to mz do
      begin
        try
          idftp2.MakeDir(intToStr(I));
        except
          on e: Exception do
          begin
            showmessage('��� � ����� ����! ������� ���������...');
            idftp2.Disconnect;
            Exit;
          end;
        end;
        idftp2.Disconnect;
      end;
    end;
  end;
end;
procedure TForm1.N17Click(Sender: TObject);    //��������� �����
var
  vuzn: string;
  I, mz: integer;
begin
  vuzn := InputBox('������ ���������� ���', '���������: ����,ʳ���,�ϲ', '');
  mz := StrToInt(InputBox('������ ������� ����� ��� ���������', '���������: 1,2', '5'));
  idftp2.Host := '176.37.113.152';
  idftp2.Username := 'QTESTER';
  idftp2.Password := '83H3M52G';
  idftp2.Passive := True;
  idftp2.Port := 21;
  if idftp2.Connected <> True then
  begin
    try
      idftp2.connect;
    except
      on e: Exception do
      begin
        ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
        remfiles;
        Application.terminate;
      end;
    end;
  end
  else
  begin
    idftp2.ChangeDir('data');
    idftp2.ChangeDir(vuzn);
    for I := 1 to mz do
    begin
      try
        idftp2.MakeDir(InputBox('����� ��� ����� �����', '���������: 1,2, �12-11EMP', ''));
      except
        on E: Exception do
        begin
          showmessage('��� � ����� ����! ������� ���������...');
          idftp2.Disconnect;
          Exit;
        end;
      end;
      idftp2.Disconnect;
    end;
  end;
end;
function TForm1.quesr(var s: integer): Integer;   //��������� ���������� �������
label
  chek;
var
  code, s2, i, ind: Integer;
  te: Boolean;
  code1: Integer;
  ares: string;
begin
  chek:
  code := Random(27) + 1;
  Randomize;
  s2 := s;
  if (s3 = 1) and (code = 1) then
  begin
    s3 := 1;
    code := Random(27) + 1;
    Randomize;
    goto chek;
  end
  else
  begin
    for I := 1 to 27 do
    begin
      if (code <> ma[I]) then
      begin
        ind := 0;
      end
      else
      begin
        goto chek;
      end;
    end;
    if ind > 0 then
    begin
      te := False;
    end;
    if ind = 0 then
    begin
      te := True;
    end;
    if te = True then
    begin
      code1 := code;
      ma[s3] := code1;
      s2 := s2 + 1;
      result := code;
      end
    else
    begin
      goto chek;
    end;
   end;
end;
procedure TForm1.tmr2Timer(Sender: TObject); //����-����������
var
  way: string;
begin
  if Form1.Active <> True then
  begin
    remfiles;
    tmr2.Enabled := False;
    way := 'dt.dco1';
    ChDir(ExtractFilePath(Application.ExeName));
    ChDir('data');
    DeleteFile(way);
    DeleteFile('ires.da0');
    DeleteFile('result.txt');
    ShowMessage('��������������� ������ ����� ��� ����������');
    MkDir(ExtractFilePath(Application.ExeName) + idd + 'b.js21');
    remfiles;
    Application.Terminate;
  end;
end;
procedure TForm1.N18Click(Sender: TObject);  //���� �����
var
  I: Integer;
  testp: TIniFile;
  way, vd: string;
  str1, str2: TFileStream;
begin
    way := ExtractFilePath(Application.ExeName) + 'data\dt.dco';
    Str1 := TFileStream.Create(way, fmOpenRead);
    Str2 := TFileStream.Create(way + '1', fmCreate);
    SC6.DecryptCopy(Str2, Str1, Str1.Size, key);
    Str1.Free;
    Str2.Free;
    testp := TIniFile.Create(way + '1');
    redt1.Lines.Add(Testn);
    for I := 1 to 27 do
    begin
      vd := testp.ReadString('Question_' + inttostr(I), 'QuestionLine', '������� �����������');
      redt1.Lines.Add('������� �' + inttostr(i) + ' : ' + vd);
      vd := testp.ReadString('Question_' + inttostr(I), 'Variant_1', '������� �����������');
      redt1.Lines.Add('�)' + vd);
      vd := testp.ReadString('Question_' + inttostr(I), 'Variant_2', '������� �����������');
      redt1.Lines.Add('�)' + vd);
      vd := testp.ReadString('Question_' + inttostr(I), 'Variant_3', '������� �����������');
      redt1.Lines.Add('�)' + vd);
      vd := testp.ReadString('Question_' + inttostr(I), 'Variant_4', '������� �����������');
      redt1.Lines.Add('�)' + vd);
      vd := testp.ReadString('Question_' + inttostr(I), 'Variant_5', '������� �����������');
      redt1.Lines.Add('�)' + vd);
      redt1.Lines.Add('');
    end;
    DeleteFile(way + '1');
    redt1.Print(testn);
  end;
procedure TForm1.testpp(var test_n; tag:integer);
var
  M:TMemoryStream;
  maks:integer;
  s,tusn,way:string;
  str1,str2:TFileStream;
  testdata:TIniFile;
begin
btn5.hide;
    if idftp2.Connected = False then
    begin
      idftp2.Host := '176.37.113.152';
      idftp2.Username := 'QTESTER';
      idftp2.Password := '83H3M52G';
      idftp2.Passive := True;
      idftp2.Port := 21;
      try
        idftp2.connect;
      except
        on e: Exception do
        begin
          ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
          remfiles;
          Application.terminate;
        end;
      end;
    end
    else
    begin
      //idftp2.ChangeDir('data');
      //idftp2.ChangeDir(vuzname);
      //idftp2.ChangeDir(kurs);
      if FTPFileExists('ires.da0') = True then
      begin
        m := TMemoryStream.Create;
        idftp2.Get('ires.da0', m);
        m.SaveToFile('ires.da0');
        m.Free;
        way := ExtractFilePath(Application.ExeName) + 'ires.da0';
        test := TIniFile.Create(way);
        maks := test.ReadInteger('General', 'UC', 0);
        for I := 1 to maks do
        begin
          TUSN := test.readString('Info_' + IntToStr(I), 'User', User);
        end;
        test.Free;
        if TUSN = user then
        begin
          ShowMessage('����� ' + tusn + ' ��� ������ ���� � ' + testn + ', ���������� �� ���������.');
          remfiles;
          Application.Terminate;
        end;
      end;
    end;
    btn5.hide;
    btn1.Hide;
    btn2.Hide;
    btn4.Hide;
    tmr1.Enabled := True;
    workdir := ExtractFilePath(Application.ExeName);
    way := Workdir + 'data\dt.dco';
    case Application.MessageBox('����������! 27 �������, 20 ������. �� �����?',
      '����������', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) of
      IDYES:
        begin
          tmr2.Enabled := True;
          N18.Enabled:=True;
          key := '2411147';
          Str1 := TFileStream.Create(way, fmOpenRead);
          Str2 := TFileStream.Create(way + '1', fmCreate);
          SC6.DecryptCopy(Str2, Str1, Str1.Size, key);
          Str1.Free;
          Str2.Free;
          testdata := tinifile.Create(way + '1');
          S := testdata.ReadString('General', 'Title', S);
          testdata.Free;
          Form1.Caption := '���� - '+ S;
          lbl4.Show;
          lbl3.show;
          lbl2.Show;
          btn3.Show;
          var1.Show;
          lbl1.Show;
          var2.Show;
          var3.Show;
          var4.Show;
          var5.Show;
          p := 0;
          id := 1;
          s3 := 1;
          I := Q;
          Q := quesr(s3);
          testing(id, q);
          lbl5.Hide;
          Exit;
        end;
      IDNO:
        begin
          lbl5.Caption:='³����� �� �����, �������� ������...';
          lbl5.Show;
          remfiles;
          remfiles;
          loadmtm;
        end;
    end;
  end;
procedure TForm1.btn5Click(Sender: TObject);
begin
 loadmtm;
end;
procedure TForm1.btn2Click(Sender: TObject);
var
  tg:Integer;
begin
  tg:=btn2.tag;
menu(tg);
btn5.show;
end;
procedure TForm1.btn1Click(Sender: TObject);
var
  tg:Integer;
begin
  tg:=btn1.tag;
menu(tg);
btn5.show;
end;
procedure TForm1.btn4Click(Sender: TObject);
var
  tg:Integer;
begin
  tg:=btn4.tag;
menu(tg);
btn5.show;
end;
procedure TForm1.tagtest(var tag1: integer);
var
ini:TIniFile;
m:TMemoryStream;
i:Integer;
name:string;
begin
lbl5.Caption:='��������� ���������...';
lbl5.Show;
idftp2.ChangeDir('tests');
m:=TMemoryStream.Create;
idftp2.Get(inttostr(tag1)+'.dco',m);
ChDir('data');
m.SaveToFile('dt.dco');
m.Free;
ini:=TIniFile.Create('dt.dco');
name:=ini.ReadString('Task_'+inttostr(tag1),'name','');
testpp(name,tag1);
tmr5.Enabled:=True;

if (Tag1>10)and(tag1<20)then
        begin
          Tagg :=1
        end;
        if (Tag1>20)and(tag1<30)then
        begin
          Tagg :=2
        end;
        if (Tag1>30)and(tag1<40)then
        begin
          Tagg :=3
        end;
end;
procedure TForm1.tmr5Timer(Sender: TObject);
begin
if btn5.Visible=True then
begin
btn5.Hide;
end
else
begin
tmr5.Enabled:=False;
end;
end;
procedure TForm1.journaladd(var kurs, vuzn, pred, oc, uch: string);
var
  M:TMemoryStream;
begin
//If setc=True then
begin
//idftp2.ChangeDir('data');
//idftp2.ChangeDir(vuzn);
//idftp2.ChangeDir(kurs);
Ap := CreateOleObject('Excel.Application');
m:=TMemoryStream.Create;
if FTPFileExists('j.ex')=True then
begin
idftp2.Get('j.ex',m);
m.SaveToFile('j.ex');
Ap.Workbooks.Open('j.ex');
m.Free;
Ap.Range['A2'] := uch;
Ap.Range['B1'] := pred;
Ap.Range['B2'] := oc;
end
else
begin
Ap.Workbooks.Add;
Ap.Range['A2'] := uch;
Ap.Range['B1'] := pred;
Ap.Range['B2'] := oc;
end;
Ap.Visible := True;//end
end;
end;
function TForm1.setc: Boolean;
begin
idftp2.Host := '176.37.113.152';
      idftp2.Username := 'QTESTER';
      idftp2.Password := '83H3M52G';
      idftp2.Passive := True;
      idftp2.Port := 21;
      try
        idftp2.connect;
      except
        on e: Exception do
        begin
          result:=false;
          ShowMessage('�� �� �*������� � ����������!' + ' �������: ' + e.Message);
          remfiles;
          Application.terminate;
          end;
      end;
      result:=True;
end;
procedure TForm1.N11Click(Sender: TObject);
var
id,id_2:string;
begin
id:=InputBox('Predm','Geom','');
id_2:=InputBox('Ocenka','0-12','');
journaladd(kurs,vuzname,id,id_2,user);
end;
procedure TForm1.remfiles;
begin
ChDir(ExtractFilePath(Application.ExeName));
DeleteFile('03.dco');
DeleteFile('c.tmp');
DeleteFile('lib.dco');
ChDir('data');
DeleteFile('dt.dco');
Exit;
end;


end.
