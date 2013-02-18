unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, WinTypes, ComCtrls, SC6;

type
  TForm2 = class(TForm)
    edt2: TEdit;
    edt3: TEdit;
    ed2: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt7: TEdit;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    btn1: TButton;
    lbl1: TLabel;
    dlgSave1: TSaveDialog;
    btn2: TButton;
    pb1: TProgressBar;
    btn3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form2: TForm2;
  testW: TIniFile;
  I: Integer;
  way: string;
  Qn: array[1..27] of string;
  va1: array[1..27] of string;
  va2: array[1..27] of string;
  va3: array[1..27] of string;
  va4: array[1..27] of string;
  va5: array[1..27] of string;
  cv1: array[1..27] of Boolean;
  cv2: array[1..27] of Boolean;
  cv3: array[1..27] of Boolean;
  cv4: array[1..27] of Boolean;
  cv5: array[1..27] of Boolean;
  tde, pass: string;
  DLLInstance: THandle;
function qtsvp(var inp: integer; decode: Boolean; fn: string): string; external 'qtdll.dll';
implementation

uses Main;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);  //Створення 2-ї Форми
begin

  btn3.Hide;
  if form1.idftp2.Connected<>true then
  begin
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
      ShowMessage('Не має з*єднання з Інтернетом!' + ' Помилка: ' + e.Message);
      Form1.remfiles;
      Application.terminate;
    end;
  end;
  end;
  begin
    pb1.Hide;
    form2.Hide;
    DLLInstance := LoadLibrary('qtdll.dll');
    I := 1;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction); // При закритті форми
begin

  if Form1.idftp2.Connected = True then
  begin
    Form1.idftp2.Disconnect;
  end
  else
  begin
    Form1.remfiles;
    Application.Terminate;
  end;
end;

procedure TForm2.btn1Click(Sender: TObject);  //Запис питаннь і шифрування тесту
label
  writetst;
var
  v1, v2, v3, v4, v5: Boolean;
  codet: string;
  C: Integer;
begin
  writetst:
  if (I > 27) and (qn[27] <> '') then
  begin
    way := ExtractFilePath(Application.ExeName) + 'data\' + main.name_t + '.dco';
    pass := '804445770189bt7kh1996lubKIBITQTESTER';
    testW := TIniFile.Create(way);
    for I := 1 to 27 do
    begin
      testW.WriteString('Question_' + inttostr(I), 'QuestionLine', qn[i]);
      testW.WriteString('Question_' + inttostr(I), 'Variant_1', va1[I]);
      testW.WriteString('Question_' + inttostr(I), 'Variant_2', va2[I]);
      testW.WriteString('Question_' + inttostr(I), 'Variant_3', va3[I]);
      testW.WriteString('Question_' + inttostr(I), 'Variant_4', va4[I]);
      testW.WriteString('Question_' + inttostr(I), 'Variant_5', va5[I]);
      testw.WriteString('Question_' + inttostr(I), 'CorrectVariant_1', BoolToStr(cv1[I]));
      testw.WriteString('Question_' + inttostr(I), 'CorrectVariant_2', BoolToStr(cv2[I]));
      testw.WriteString('Question_' + inttostr(I), 'CorrectVariant_3', BoolToStr(cv3[I]));
      testw.WriteString('Question_' + inttostr(I), 'CorrectVariant_4', BoolToStr(cv4[I]));
      testw.WriteString('Question_' + inttostr(I), 'CorrectVariant_5', BoolToStr(cv5[I]));
      pb1.Position := pb1.Position + 3;
    end;
    testW.Free;
    C := 4;
    qtsvp(c, true, way);
    ShowMessage('Тест створено!');
    btn3.Show;
    edt2.Hide;
    ed2.Hide;
    edt3.Hide;
    edt4.Hide;
    edt5.Hide;
    edt7.Hide;
    chk1.Hide;
    chk2.Hide;
    chk3.Hide;
    chk4.Hide;
    chk5.Hide;
    lbl1.Hide;
    Form2.AutoSize := true;
    btn1.Enabled := False;
    pb1.Hide;
  end
  else
  begin
    if (edt2.text = '') or (edt3.text = '') or (ed2.text = '') or (edt5.text = '') or (edt4.text = '') or (edt7.text = '') then
    begin
      ShowMessage('Не всі поля заповнені!');
      Exit;
    end;
    if chk5.Checked = True then
      v1 := true;
    if chk1.Checked = True then
      v2 := true;
    if chk2.Checked = True then
      v3 := true;
    if chk3.Checked = True then
      v4 := true;
    if chk4.Checked = True then
      v5 := true;
    qn[I] := edt2.Text;
    codet := edt3.Text;
    va1[I] := codet;
    codet := ed2.text;
    va2[I] := codet;
    codet := edt5.text;
    va3[I] := codet;
    codet := edt4.text;
    va4[I] := codet;
    codet := edt7.text;
    va5[I] := codet;
    codet := BoolToStr(v1);
    cv1[I] := StrToBool(codet);
    codet := BoolToStr(v2);
    cv2[I] := StrToBool(codet);
    codet := BoolToStr(v3);
    cv3[I] := StrToBool(codet);
    codet := BoolToStr(v4);
    cv4[I] := StrToBool(codet);
    codet := BoolToStr(v5);
    cv5[I] := StrToBool(codet);
    I := I + 1;
    edt2.text := '';
    edt3.text := '';
    ed2.text := '';
    edt5.text := '';
    edt4.text := '';
    edt7.text := '';
    chk1.Checked := False;
    chk2.Checked := False;
    chk3.Checked := False;
    chk4.Checked := False;
    chk5.Checked := False;
    if I = 27 then
      btn1.Caption := 'Завершити';
    if I = 28 then
    begin
      lbl1.Hide;
      goto writetst;
    end;
    lbl1.Caption := IntToStr(I) + '\27';
  end;
end;

procedure TForm2.btn2Click(Sender: TObject); //Назад до роботи
begin
  Form1.Show;
  form2.Hide;
  form1.N3.Enabled := False;
end;

procedure TForm2.btn3Click(Sender: TObject);  //Завантажити Тест
begin
  if Form1.idftp2.Connected = False then
  begin
    Form1.idftp2.Host := '176.37.113.152';
    Form1.idftp2.Username := 'QTESTER';
    Form1.idftp2.Password := '83H3M52G';
    Form1.idftp2.Passive := True;
    Form1.idftp2.Port := 21;
    try
      Form1.idftp2.connect;
    except
      on e: Exception do
      begin
        ShowMessage('Не має з*єднання з Інтернетом!' + ' Помилка: ' + e.Message);
        Form1.remfiles;
        Application.terminate;
      end;
    end;
  end
  else
  begin

    Form1.idftp2.ChangeDir('tests');
    try
      Form1.idftp2.Put(way, main.name_t + '.dco', false);
    finally
      Form1.idftp2.disconnect;
      Form1.idftp2.Free;
      ShowMessage('Файл завантажено. Перезавантажте программу для роботи.');
      btn3.Hide;
    end;
  end;
end;

end.
