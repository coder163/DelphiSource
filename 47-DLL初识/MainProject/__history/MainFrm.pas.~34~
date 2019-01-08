unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
//DLL中导出的函数
function Add(Num1,Num2:Integer):Integer;stdcall;external 'TestDll.dll';

var
  Form1: TForm1;

implementation

{$R *.dfm}

//动态调用
procedure TForm1.Button1Click(Sender: TObject);
var
  MyFun: function(x, y: Integer): Integer; stdcall;
var
  Hand: System.Cardinal;
begin
   //加载DLL
  Hand := LoadLibrary('TestDll.dll');
  if Hand <> 0 then
  begin
    try
      MyFun := GetProcAddress(Hand, 'Add');

      ShowMessage(MyFun(10, 20).ToString);
    finally
       //释放DLL
      FreeLibrary(Hand);
    end;

  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    ShowMessage(Add(15,1).ToString);
end;

end.

