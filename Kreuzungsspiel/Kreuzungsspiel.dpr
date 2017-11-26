program Kreuzungsspiel;

{$R 'Ressources.res' 'Ressources.rc'}

uses
  Vcl.Forms,
  Hauptunit in 'Hauptunit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
