program ProjectMain;

uses
  Vcl.Forms,
  UnitMainFrm in 'UnitMainFrm.pas' {Form1},
  uThreads in 'uThreads.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
