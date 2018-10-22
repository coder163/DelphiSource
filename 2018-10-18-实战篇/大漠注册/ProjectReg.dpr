program ProjectReg;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {Form1},
  uUtils in 'uUtils.pas',
  uMainThread in 'uMainThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
