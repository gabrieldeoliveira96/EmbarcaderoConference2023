unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Effects, FMX.Filter.Effects;

type
  TForm3 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FRectangle:TRectangle;
    FLabel:Tlabel;
    FAniIndicator:TAniIndicator;
    FFillRGBEffect:TFillRGBEffect;
    procedure OnClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.FormCreate(Sender: TObject);
begin

  FRectangle:= TRectangle.Create(self);
  FRectangle.Width:= 250;
  FRectangle.Height:= 60;
  FRectangle.Fill.Kind:= TBrushKind.Gradient;
  FRectangle.Fill.Gradient.Color:= $FF0649F9;
  FRectangle.Fill.Gradient.Color1:= $FF3280FF;
  FRectangle.Stroke.Kind:= TBrushKind.None;
  FRectangle.XRadius:= 15;
  FRectangle.YRadius:= 15;
  FRectangle.OnClick:= OnClick;

  FLabel:= TLabel.Create(self);
  FLabel.Text:= 'Aperte Aqui';
  FLabel.Align:= TAlignLayout.Client;
  FLabel.TextSettings.HorzAlign:= TTextAlign.Center;
  FLabel.TextSettings.Font.Size:= 16;
  FLabel.TextSettings.Font.Style:= [TFontStyle.fsBold];
  FLabel.StyledSettings:= [TStyledSetting.Family];
  FLabel.TextSettings.FontColor:= TAlphaColors.White;
  FLabel.SetSubComponent(true);

  FRectangle.AddObject(FLabel);

  FAniIndicator:= TAniIndicator.Create(self);
  FAniIndicator.Align:= TAlignLayout.Client;
  FAniIndicator.Margins.Top:= 10;
  FAniIndicator.Margins.Bottom:= 10;
  FAniIndicator.SetSubComponent(true);
  FAniIndicator.Visible:= false;

  FRectangle.AddObject(FAniIndicator);

  FFillRGBEffect:= TFillRGBEffect.Create(self);
  FFillRGBEffect.Color:= TAlphaColors.White;
  FFillRGBEffect.SetSubComponent(true);

  FAniIndicator.AddObject(FFillRGBEffect);

  self.AddObject(FRectangle);

end;

procedure TForm3.OnClick(Sender:TObject);
begin
  FLabel.Visible:= false;
  FAniIndicator.Visible:= true;
  FAniIndicator.Enabled:= true;
  TThread.CreateAnonymousThread(
  procedure
  begin
    sleep(3000);
    Tthread.Synchronize(nil,
    procedure
    begin
      FLabel.Visible:= true;
      FAniIndicator.Visible:= false;
    end);
  end).Start;

end;


end.
