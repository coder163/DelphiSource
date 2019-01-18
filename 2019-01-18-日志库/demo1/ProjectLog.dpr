program ProjectLog;

uses
  TConfiguratorUnit, {需要引用该单元} Vcl.Forms,
  frmMain in 'frmMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  { 初始化，读取属性 }
  doPropertiesConfiguration('log4delphi.properties');
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
