unit UnitForm;

interface

uses
  Unit1, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Msg: TMyMsg;
  MsgAccepter: TMsgAccepter;
begin
  Msg.MsgNum := 2000;
  Msg.MsgText := '消息和事件';
  MsgAccepter := TMsgAccepter.Create;
  //分发消息
  MsgAccepter.Dispatch(Msg);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Msg: TMyMsg;
  MsgAccepter: TMsgAccepter;
begin
  Msg.MsgNum := 2002;
  Msg.MsgText := '消息和事件';
  MsgAccepter := TMsgAccepter.Create;
  //分发消息
  MsgAccepter.Dispatch(Msg);

end;

end.

