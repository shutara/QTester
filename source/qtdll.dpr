library qtdll;

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ShellAPI, ComCtrls,IniFiles, ExtCtrls, Main,
   Unit2, TeeProcs, TeEngine, Chart, DbChart, Series, TeeFunci,
  StdCtrls, Unit3,SC6;
  {$R *.res}
    
  Procedure count(E:Exception);export;  //³���� ����������
var
  f:textfile;
  s,s2:string;
begin
AssignFile(f, 'exeption.txt');
s:=inputbox('�������','���� ����� ������� ������� �� �������.','');
s2:=s+' AppCase^ '+e.Message;
Writeln(f, s2);
CloseFile(f);
Showmessage('������ �� �������� � ���������� �������! �������� ��������.');
end;
<<<<<<< HEAD
=======
exports
count index 1;
>>>>>>> Версія 2.5.3.1 (Нестабільна)

  function qtsvp(var inp:integer; decode: Boolean; fn:string):string;export;// �������� ������������ �����
  var
  Str1, Str2 : TFileStream;
  key:string;
  const
  v=1;
  begin
  if inp=1 then
  begin
  ShowMessage(IntToStr(v));
  inp:=0;
  end;
  if inp=2 then
  begin
    ChDir(ExtractFilePath(Application.ExeName));
    if FileExists('settings.ini') then
    begin
      result:=BoolToStr(True);
    end
    else
    begin
      result:=BoolToStr(False);
    end;
  end;
   if inp=3 then
  begin
    try
      Form1.idhtp.Get('blockzter-mc.at.ua/qt/data');
      except
        result:=BoolToStr(False);
        end;
  end;
  if inp=4 then
  begin
    key:='2411147';
    if decode=true then
    begin
  Str1 := TFileStream.Create(fn, fmOpenRead);
  Str2 := TFileStream.Create(fn+'1', fmCreate);
  sc6.EncryptCopy(Str2, Str1, Str1.Size, key);
  Str1.Free;
  Str2.Free;
  DeleteFile(fn);
  RenameFile(fn+'1',fn);
  end
  else
  begin
  Str1 := TFileStream.Create(fn, fmOpenRead);
  Str2 := TFileStream.Create(fn+'1', fmCreate);
  sC6.DecryptCopy(Str2, Str1, Str1.Size, key);
  Str1.Free;
  Str2.Free;
  end;
  end;
  end;
<<<<<<< HEAD
=======
exports
qtsvp index 2;
>>>>>>> Версія 2.5.3.1 (Нестабільна)

Function GetHDSerNo: shortstring; export; //��������� ID �� (������ �:)
var VolumeName, FileSystemName : array [0..MAX_PATH-1] of Char; VolumeSerialNo : Cardinal; MaxComponentLength, FileSystemFlags : DWORD;
Begin
Try GetVolumeInformation('C:\',VolumeName,MAX_PATH,@VolumeSerialNo, MaxComponentLength,FileSystemFlags, FileSystemName,MAX_PATH);
Result:=IntToHex(HiWord(VolumeSerialNo),4)+ '-'+IntToHex(LoWord(VolumeSerialNo),4); Except ;
End;
End;
<<<<<<< HEAD
=======
exports
GetHDSerNo index 3;
>>>>>>> Версія 2.5.3.1 (Нестабільна)

begin

end.
