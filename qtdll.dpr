library qtdll;

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ShellAPI, ComCtrls,IniFiles, ExtCtrls, Main,
   Unit2, TeeProcs, TeEngine, Chart, DbChart, Series, TeeFunci,
  StdCtrls, Unit3,SC6;
  {$R *.res}
    
  Procedure count(E:Exception);export;  //Відлов виключеннь
var
  f:textfile;
begin
  AssignFile(f, 'log_exeption.txt');
  Rewrite(f);
  Writeln(f, 'Error # '+ E.message);
  CloseFile(f);
  Form1.Hide;
  showmessage('Помилка! Повідомте адмінітсратора. Лог збережено');
  Application.Terminate;
end;
 exports
  count index 2;

  function qtsvp(var inp:integer; decode: Boolean; fn:string):string;export;// Протокол підтвердження даних
  var
  i: integer;
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
  exports
  qtsvp index 3;

Function GetHDSerNo: shortstring; export; //Отримання ID ПК (Розділу С:)
var VolumeName, FileSystemName : array [0..MAX_PATH-1] of Char; VolumeSerialNo : Cardinal; MaxComponentLength, FileSystemFlags : DWORD;
Begin
Try GetVolumeInformation('C:\',VolumeName,MAX_PATH,@VolumeSerialNo, MaxComponentLength,FileSystemFlags, FileSystemName,MAX_PATH);
Result:=IntToHex(HiWord(VolumeSerialNo),4)+ '-'+IntToHex(LoWord(VolumeSerialNo),4); Except ;
End;
End;
  exports
  GetHDSerNo index 4;

begin

end.
