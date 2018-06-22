unit UnitPesquisaTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaTurma = class(TForm_PesquisaBase)
    QueryPesquisaCD_TURMA: TIntegerField;
    QueryPesquisaCD_PROFESSOR: TIntegerField;
    QueryPesquisaDS_DIA: TIBStringField;
    QueryPesquisaDS_PERIODO: TIBStringField;
    QueryPesquisaCD_CURSO: TIntegerField;
    QueryPesquisaNM_PESSOA: TIBStringField;
    QueryPesquisaNM_CURSO: TIBStringField;
    procedure But_NovoClick(Sender: TObject);
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_ExcluirClick(Sender: TObject);
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
  ///CONTINUAR DAQUI
  sql:='SELECT T.*, P.NM_PESSOA, C.NM_CURSO FROM TB_TURMA T INNER JOIN TB_PESSOA P ON(T.CD_PROFESSOR = P.CD_CIDADE) INNER JOIN TB_CURSO C ON(C.CD_CURSO = T.CD_CURSO) ';
  case RadioFiltro.ItemIndex of
      0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_TURMA;')
               end
             else
                    SQL:= (SQL +' WHERE CD_PESSOA = '+MaskEditPesquisa.Text+';');
        end;
      1: SQL:= (SQL+' where NM_PESSOA like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by NM_PESSOA;');
      2: SQL:= (SQL+' where NR_CPF like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by NR_CPF;');
      3:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')   then
               begin
                    SQL:=SQL +(' ORDER BY DT_NASCIMENTO;')
               end
             else
                    SQL:= (SQL+' where extract(month from p.dt_nascimento) = '+QuotedStr(MaskEditPesquisa.Text)+' Order by DT_NASCIMENTO;');

        end;
      4: SQL:= (SQL+' where FG_FUNC like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by FG_FUNC;');
      5: SQL:= (SQL+' where C.NM_CIDADE like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by C.NM_CIDADE;');

  END;

  CONEXAO.TrocaSQL(QueryPesquisa,SQL);
end

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

procedure TForm_PesquisaTurma.But_NovoClick(Sender: TObject);
begin
  inherited;
   try

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
