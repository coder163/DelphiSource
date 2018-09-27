program ProjectHelloWorld;

uses
  Vcl.Forms,
  Unit1Form in 'Unit1Form.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
