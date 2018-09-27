program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  Unit2 in 'Unit2.pas',
  AddFormUnit in 'AddFormUnit.pas' {FormAdd},
  DaoUnit in 'DaoUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormAdd, FormAdd);
  Application.Run;
end.
