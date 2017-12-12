program PStrasse;

uses
  Forms,
  UHaupt in 'UHaupt.pas' {FrmAnwendung};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmAnwendung, FrmAnwendung);
  Application.Run;
end.
