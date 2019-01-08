library TestDll;
{$S-}

uses
  Vcl.Forms,
  Winapi.Windows,
  System.SysUtils,
  System.Classes;

{$R *.res}


//stdcall参数的传递顺序

function Add(Num1, Num2: Integer): Integer; stdcall;
begin
  Result := Num1 + Num2;
  Exit;
end;

procedure ShowMessage(Content: string);
begin
  MessageBox(0, PWideChar(Content), '', MB_OK);
end;

function Show: Boolean; stdcall;
begin

  Application.MessageBox(PChar('Show FormDll'), '信息', 64);

  Result := True;

end;

exports

  Add;

begin

end.

