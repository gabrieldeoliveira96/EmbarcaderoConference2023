unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Effects,
  FMX.Filter.Effects;

type
  TForm3 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    AniIndicator1: TAniIndicator;
    FillRGBEffect1: TFillRGBEffect;
    procedure Rectangle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Rectangle1Click(Sender: TObject);
begin
  Label1.Visible:= false;
  AniIndicator1.Visible:= true;
  AniIndicator1.Enabled:= true;
  TThread.CreateAnonymousThread(
  procedure
  begin
    sleep(3000);
    Tthread.Synchronize(nil,
    procedure
    begin
      Label1.Visible:= true;
      AniIndicator1.Visible:= false;
    end);
  end).Start;
end;

end.
