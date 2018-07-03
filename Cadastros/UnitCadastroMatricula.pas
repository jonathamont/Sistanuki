unit UnitCadastroMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrão, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TForm_CadastroMatricula = class(TForm_CadastroPadrao)
    Label1: TLabel;
    EditMatricula: TDBEdit;
    Label2: TLabel;
    EditCodNome: TDBEdit;
    Label3: TLabel;
    EditNomePessoa: TDBEdit;
    Label4: TLabel;
    EditCodTurma: TDBEdit;
    Label5: TLabel;
    EditDataMatricula: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure But_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroMatricula: TForm_CadastroMatricula;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaMatricula;

procedure TForm_CadastroMatricula.But_SalvarClick(Sender: TObject);
begin
     if Trim(EditNomePessoa.Text)='' then
     begin
       Application.MessageBox('Campo Nome é Obrigatório','Aviso');
       Exit;
     end;

  inherited;

end;

end.
