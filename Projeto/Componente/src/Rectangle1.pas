unit Rectangle1;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Objects, fmx.Graphics,
  FMX.StdCtrls, FMX.Effects, FMX.Filter.Effects, System.UITypes;

type
  TBotao = class(TRectangle)
  private
    FLabel:Tlabel;
    FAniIndicator:TAniIndicator;
    FFillRGBEffect:TFillRGBEffect;
    FOnStart: TNotifyEvent;
    FOnStop: TNotifyEvent;
    FText: string;
    procedure SetText(const Value: string);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    { Published declarations }
    procedure Start;
    procedure Stop;
    property OnStart: TNotifyEvent read FOnStart write FOnStart;
    property OnStop: TNotifyEvent read FOnStop write FOnStop;
    property Text: string read FText write SetText;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('EmbarcaderoConference', [TBotao]);
end;

{ TBotao }

constructor TBotao.Create(AOwner: TComponent);
begin
  inherited;
  FText:= 'Aperte Aqui';


  self.Width:= 250;
  self.Height:= 60;
  self.Fill.Kind:= TBrushKind.Gradient;
  self.Fill.Gradient.Color:= $FF0649F9;
  self.Fill.Gradient.Color1:= $FF3280FF;
  self.Stroke.Kind:= TBrushKind.None;
  self.XRadius:= 15;
  self.YRadius:= 15;
  self.HitTest:= true;

  FLabel:= TLabel.Create(self);
  FLabel.Text:= FText;
  FLabel.HitTest:= false;
  FLabel.Align:= TAlignLayout.Client;
  FLabel.TextSettings.HorzAlign:= TTextAlign.Center;
  FLabel.TextSettings.Font.Size:= 16;
  FLabel.TextSettings.Font.Style:= [TFontStyle.fsBold];
  FLabel.StyledSettings:= [TStyledSetting.Family];
  FLabel.TextSettings.FontColor:= TAlphaColors.White;
  FLabel.SetSubComponent(true);
  FLabel.Stored:= false;
  FLabel.Visible:= true;

  self.AddObject(FLabel);

  FAniIndicator:= TAniIndicator.Create(self);
  FAniIndicator.Align:= TAlignLayout.Client;
  FAniIndicator.HitTest:= false;
  FAniIndicator.Margins.Top:= 10;
  FAniIndicator.Margins.Bottom:= 10;
  FAniIndicator.SetSubComponent(true);
  FAniIndicator.Visible:= false;
  FAniIndicator.Stored:= false;

  self.AddObject(FAniIndicator);

  FFillRGBEffect:= TFillRGBEffect.Create(self);
  FFillRGBEffect.Color:= TAlphaColors.White;
  FFillRGBEffect.SetSubComponent(true);
  FFillRGBEffect.Stored:= false;

  FAniIndicator.AddObject(FFillRGBEffect);

end;

{$REGION 'Text'}

procedure TBotao.SetText(const Value: string);
begin
  FText := Value;

  FLabel.Text:= Value;
end;

{$ENDREGION}

procedure TBotao.Start;
begin
  FOnStart(self);
  FLabel.Visible:= false;
  FAniIndicator.Visible:= true;
  FAniIndicator.Enabled:= true;
end;

procedure TBotao.Stop;
begin
  FOnStop(self);
  FLabel.Visible:= true;
  FAniIndicator.Visible:= false;
  FAniIndicator.Enabled:= false;

end;

end.
