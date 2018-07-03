unit UnitCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadr�o, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, IBX.IBCustomDataSet, IBX.IBUpdateSQL,
  IBX.IBQuery, Vcl.Buttons,UnitConexao;

type
  TForm_CadastroCidades = class(TForm_CadastroPadrao)
    Label1: TLabel;
    Edit_CodCidade: TDBEdit;
    Label2: TLabel;
    Edit_Nm_Cidade: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Combo_Pais: TDBComboBox;
    Combo_Estado: TDBComboBox;
    procedure But_SalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroCidades: TForm_CadastroCidades;

implementation

{$R *.dfm}

uses UnitPesquisaCidade;

procedure TForm_CadastroCidades.But_SalvarClick(Sender: TObject);
begin
  if Trim(Edit_Nm_Cidade.Text)='' then
  begin
      Application.MessageBox('Campo Nome � Obrigatorio','Aviso');
      exit;
  end;
  inherited;


end;

procedure TForm_CadastroCidades.FormCreate(Sender: TObject);
begin
  inherited;
  ////
  if (DataSourceCadastro.State = dsInsert) then
  begin
       DataSourceCadastro.DataSet.FieldByName('DS_PAIS').Value:='BRASIL';
       DataSourceCadastro.DataSet.FieldByName('DS_ESTADO').Value:='SC';
       DataSourceCadastro.DataSet.FieldByName('CD_CIDADE').text:=IntToStr(CONEXAO.RetornaPK('CD_CIDADE','TB_CIDADE'));
  end;
end;

end.
