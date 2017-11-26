unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    EditC: TEdit;
    EditF: TEdit;
    EditK: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PnlHelp: TPanel;
    PnlK: TPanel;
    PnlF: TPanel;
    PnlC: TPanel;
    procedure EditCChange(Sender: TObject);
    procedure EditFChange(Sender: TObject);
    procedure EditKChange(Sender: TObject);
    procedure PnlHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1, Form2: TForm1;
  C, F, K: Extended;
  calculating: Boolean;

implementation

{$R *.dfm}

procedure TForm1.EditCChange(Sender: TObject);
begin
    EditC.Color := clWhite;
    if not calculating then
    begin
      if TryStrToFloat(EditC.Text, C) then
      begin
        calculating := true;
        PnlK.Color := clWhite;
        PnlC.Color := clLime;
        PnlF.Color := clWhite;
        F:=C*1.8+32;
        K:=C+273.15;
        EditF.Text:=FloattoStr(F);
        EditK.Text:=FloattoStr(K);
        calculating := false;
      end
      else
      begin
        PnlC.Color := clRed;
      end;
    end;
end;

procedure TForm1.EditFChange(Sender: TObject);
begin
    EditF.Color := clWhite;
    if not calculating then
    begin
      if TryStrToFloat(EditF.Text, F) then
      begin
        calculating := true;
        PnlC.Color := clWhite;
        PnlF.Color := clLime;
        PnlK.Color := clWhite;
        C:=(F-32)/1.8;
        K:=(F + 459.67) / 1.8;
        EditC.Text:=FloattoStr(C);
        EditK.Text:=FloattoStr(K);
        calculating := false;
      end
      else
      begin
        PnlF.Color := clRed;
      end;
    end;
end;

procedure TForm1.EditKChange(Sender: TObject);
begin
   EditK.Color := clWhite;
    if not calculating then
    begin
      if TryStrToFloat(EditK.Text, K) then
      begin
        calculating := true;
        PnlK.Color := clLime;
        PnlC.Color := clWhite;
        PnlF.Color := clWhite;
        F:= K*1.8-459.67;
        C:= K-273.15;
        EditC.Text:=FloattoStr(C);
        EditF.Text:=FloattoStr(F);
        calculating := false;
      end
      else
      begin
        PnlK.Color := clRed;
      end;
    end;
end;

procedure TForm1.PnlHelpClick(Sender: TObject);
begin
  Form2.Show;
end;

end.
