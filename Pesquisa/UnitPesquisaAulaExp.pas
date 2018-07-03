unit UnitPesquisaAulaExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TForm_PesquisaAulaExp = class(TForm_PesquisaBase)
    QueryPesquisaCD_AULA_EXP: TIntegerField;
    QueryPesquisaCD_PESSOA: TIntegerField;
    QueryPesquisaDT_CADASTRO: TDateField;
    QueryPesquisaDT_AULA: TDateField;
    QueryPesquisaCD_CURSO: TIntegerField;
    QueryPesquisaDS_INF: TIBStringField;
    QueryPesquisaNM_PESSOA: TIBStringField;
    QueryPesquisaNM_CURSO: TIBStringField;
    Dataset_AulaExp: TfrxDBDataset;
    Report_AulaExp: TfrxReport;
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_NovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaAulaExp: TForm_PesquisaAulaExp;

implementation

{$R *.dfm}

uses UnitCadastroAulaExp, UnitConexao;

procedure TForm_PesquisaAulaExp.ButPesquisaClick(Sender: TObject);
  var
  SQL:string;
begin
  inherited;
  sql:='select ae.*, p.nm_pessoa, c.nm_curso from tb_aula_exp ae '+
       'inner join tb_pessoa p on (p.cd_pessoa = ae.cd_pessoa) '+
       'inner join tb_curso c on (c.cd_curso = ae.cd_curso) ';
  case RadioFiltro.ItemIndex of
    0:begin
        if (Trim(MaskEditPesquisa.Text) ='') then
          begin
           SQL:= SQL + ('order by cd_aula_exp')
          end
       else
            SQL:= (SQL +' where cd_aula_exp = '+MaskEditPesquisa.Text+';')
       end;
     1: SQL:= (SQL+' where p.nm_pessoa like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by p.nm_pessoa;');
  end;
  CONEXAO.TrocaSQL(QueryPesquisa,SQL);
end;

procedure TForm_PesquisaAulaExp.But_AlterarClick(Sender: TObject);
begin
  inherited;
  try
    QueryPesquisa.Edit;
    Form_CadastroAulaExp := TForm_CadastroAulaExp.Create(Self);
    Form_CadastroAulaExp.ShowModal
  finally
    Form_CadastroAulaExp.Free;
  end;
end;

procedure TForm_PesquisaAulaExp.But_NovoClick(Sender: TObject);
begin
  inherited;
  try
    QueryPesquisa.Append;
    Form_CadastroAulaExp := TForm_CadastroAulaExp.Create(Self);
    Form_CadastroAulaExp.ShowModal;
  finally
    Form_CadastroAulaExp.Free;
    QueryPesquisa.Close;
    ButPesquisaClick(ButPesquisa);

  end;

end;

end.
