unit UnitPesquisaTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TForm_PesquisaTurma = class(TForm_PesquisaBase)
    QueryPesquisaCD_TURMA: TIntegerField;
    QueryPesquisaCD_PROFESSOR: TIntegerField;
    QueryPesquisaDS_DIA: TIBStringField;
    QueryPesquisaDS_PERIODO: TIBStringField;
    QueryPesquisaCD_CURSO: TIntegerField;
    QueryPesquisaNM_PESSOA: TIBStringField;
    QueryPesquisaNM_CURSO: TIBStringField;
    Dataset_Turma: TfrxDBDataset;
    Report_Turma: TfrxReport;
    procedure But_NovoClick(Sender: TObject);
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_ExcluirClick(Sender: TObject);
    procedure But_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaTurma: TForm_PesquisaTurma;

implementation

{$R *.dfm}

uses UnitCadastroTurma, UnitConexao;



procedure TForm_PesquisaTurma.ButPesquisaClick(Sender: TObject);
var
  SQL:String;
begin
  inherited;

  sql:='SELECT T.*, P.NM_PESSOA, C.NM_CURSO FROM TB_TURMA T INNER JOIN TB_PESSOA P ON(T.CD_PROFESSOR = P.CD_CIDADE) INNER JOIN TB_CURSO C ON(C.CD_CURSO = T.CD_CURSO) ';
  case RadioFiltro.ItemIndex of
      0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_TURMA;')
               end
             else
                    SQL:= (SQL +' WHERE CD_TURMA = '+MaskEditPesquisa.Text+';');
        end;
      1: SQL:= (SQL+' where P.NM_PESSOA like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by P.NM_PESSOA;');
      2: SQL:= (SQL+' where DS_DIA like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by DS_DIA;');
      3: SQL:= (SQL+' where DS_PERIODO like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by DS_PERIODO;');
      4: SQL:= (SQL+' where C.NM_CURSO like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by C.NM_CURSO;');

  END;

  CONEXAO.TrocaSQL(QueryPesquisa,SQL);
end;

procedure TForm_PesquisaTurma.But_AlterarClick(Sender: TObject);
begin
  inherited;
  try
        QueryPesquisa.Edit;
        Form_CadastroTurma:=TForm_CadastroTurma.Create(self);
        Form_CadastroTurma.ShowModal;

     finally
        Form_CadastroTurma.Free;
        ButPesquisaClick(ButPesquisa);

     end;
end;

procedure TForm_PesquisaTurma.But_ExcluirClick(Sender: TObject);
var
  sql:string;
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir?','Aviso', MB_OK + MB_YESNO) = IDNO then
        Begin
          Exit;
        End;
     if not(CONEXAO.Transaction.InTransaction) then
        Begin
          CONEXAO.Transaction.StartTransaction;
        End;

      Begin
        Try
          QueryPesquisa.Delete;
          CONEXAO.Transaction.Commit;
        Except
          CONEXAO.Transaction.Rollback;
          Application.MessageBox('Erro ao Excluir Item! Uma Turma com Alunos não pode ser excluida!','Aviso')
        End;
      End;

      QueryPesquisa.Open;

end;

procedure TForm_PesquisaTurma.But_ImprimirClick(Sender: TObject);
begin
  inherited;
  Report_Turma.ShowReport();
end;

procedure TForm_PesquisaTurma.But_NovoClick(Sender: TObject);
begin
  inherited;
   try
        QueryPesquisa.Open;
        QueryPesquisa.Append;
        QueryPesquisaCD_TURMA.Value:=(CONEXAO.RetornaPK('CD_TURMA','TB_TURMA'));
        Form_CadastroTurma:=TForm_CadastroTurma.Create(self);
        Form_CadastroTurma.ShowModal;

     finally
        Form_CadastroTurma.Free;
        QueryPesquisa.Close;
        ButPesquisaClick(ButPesquisa);

     end;
end;

end.
