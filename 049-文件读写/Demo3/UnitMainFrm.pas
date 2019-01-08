unit UnitMainFrm;

interface

uses
  uThreads, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurPosition: Cardinal;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
const
  SOURCE_FILE = 'D:\Test\1.avi';
  TARGET_FILE = 'D:\Test\2.avi';

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
//    form1.Caption := 'a';
      //关联

    Timer1.Interval := 5;

    TThread.CreateAnonymousThread(
      procedure
      var
        SourceFile, TargetFile: file;
      var
        Buf: array[0..255] of Byte;
      begin
        AssignFile(SourceFile, SOURCE_FILE);

        AssignFile(TargetFile, TARGET_FILE);
       //设置打开方式
        Reset(SourceFile);
        Rewrite(TargetFile);
        Form1.ProgressBar1.Max := FileSize(SourceFile);
        //读写
        while not Eof(SourceFile) do begin
          form1.Caption := 'sss';
          BlockRead(SourceFile, Buf, 1);
          BlockWrite(TargetFile, Buf, 1);
          Form1.CurPosition := FileSize(TargetFile);
          form1.Caption := FileSize(TargetFile).ToString;
        end;

        CloseFile(SourceFile);
        CloseFile(TargetFile);
      end).Start;

  finally

  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    //终止始终周期
  Timer1.Interval := 0;
end;

//始终周期事件
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Position := CurPosition;

end;

end.

