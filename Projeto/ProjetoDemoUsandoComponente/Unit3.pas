unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  Rectangle1;

type
  TForm3 = class(TForm)
    Botao1: TBotao;
    procedure Botao1Click(Sender: TObject);
    procedure Botao1Start(Sender: TObject);
    procedure Botao1Stop(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Botao1Click(Sender: TObject);
begin
  Botao1.Start;
  TThread.CreateAnonymousThread(
  procedure
  begin
    sleep(3000);
    Tthread.Synchronize(nil,
    procedure
    begin
      Botao1.Text:= 'Atualizada';
      Botao1.Stop;
    end);
  end).Start;

end;

procedure TForm3.Botao1Start(Sender: TObject);
begin
  ShowMessage('come�ou');
end;

procedure TForm3.Botao1Stop(Sender: TObject);
begin
  ShowMessage('terminou');

end;

end.
