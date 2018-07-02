unit UnitPesquisaMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TForm_PesquisaMatricula = class(TForm_PesquisaBase)
    QueryPesquisaCD_MATRICULA: TIntegerField;
    QueryPesquisaCD_PESSOA: TIntegerField;
    QueryPesquisaCD_TURMA: TIntegerField;
    QueryPesquisaDT_MATRICULA: TDateField;
    QueryPesquisaP: TIBStringField;
    QueryPesquisaNM_CURSO: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Btn_Novo: TBitBtn;
    Dataset_Matricula: TfrxDBDataset;
    Report_Matricula: TfrxReport;
    procedure Btn_NovoClick(Sender: TObject);
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaMatricula: TForm_PesquisaMatricula;

implementation

{$R *.dfm}

uses UnitConexao, UnitCadastroMatricula;

procedure TForm_PesquisaMatricula.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  try
    QueryPesquisa.Append;
    Form_CadastroMatricula := TForm_CadastroMatricula.Create(Self);
    Form_CadastroMatricula.ShowModal;
  finally
    Form_CadastroMatricula.Free;
  end;
end;

procedure TForm_PesquisaMatricula.ButPesquisaClick(Sender: TObject);
var
  sql: string;
begin
  inherited;
  sql:= 'select m.*, p.nm_pessoa p, c.nm_curso from tb_matricula m ' +
        'inner join tb_pessoa p on (p.cd_pessoa = m.cd_pessoa) ' +
        'inner join tb_turma t on (t.cd_turma = m.cd_turma) ' +
        'inner join tb_curso c on (c.cd_curso = t.cd_curso)' ;
  case RadioFiltro.ItemIndex of
    0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_MATRICULA;')
               end
             else
                    SQL:= (SQL +' WHERE CD_MATRICULA = '+MaskEditPesquisa.Text+';');
        end;
      1: SQL:= (SQL+' where p.nm_pessoa like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by p.nm_pessoa;');
  end;
  CONEXAO.TrocaSQL(QueryPesquisa,sql);
end;

procedure TForm_PesquisaMatricula.But_AlterarClick(Sender: TObject);
begin
  inherited;
  try
    QueryPesquisa.Edit;
    Form_CadastroMatricula := TForm_CadastroMatricula.Create(Self);
    Form_CadastroMatricula.ShowModal;
  finally
    Form_CadastroMatricula.Free;
  end;

end;

procedure TForm_PesquisaMatricula.But_ImprimirClick(Sender: TObject);
begin
  inherited;
  Report_Matricula.ShowReport();
end;

end.
