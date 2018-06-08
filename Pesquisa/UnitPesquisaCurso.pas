unit UnitPesquisaCurso;

interface
// vERIFICAR A EXCLUSÃO PARA EXCLUIR DA TABELA FILHA TAMBÉM
//
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaCurso = class(TForm_PesquisaBase)
    QueryPesquisaCD_CURSO: TIntegerField;
    QueryPesquisaNM_CURSO: TIBStringField;
    QueryPesquisaNR_HORAS: TTimeField;
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
  Form_PesquisaCurso: TForm_PesquisaCurso;

implementation

{$R *.dfm}

uses UnitCadastroCurso, UnitConexao;

procedure TForm_PesquisaCurso.ButPesquisaClick(Sender: TObject);
begin
  inherited;
   //
end;

procedure TForm_PesquisaCurso.But_AlterarClick(Sender: TObject);
begin
  inherited;
  inherited;
   try
        QueryPesquisa.Edit;
        Form_CadastroCurso:=TForm_CadastroCurso.Create(self);
        Form_CadastroCurso.ShowModal;

     finally
        Form_CadastroCurso.Free;
     end;
end;

procedure TForm_PesquisaCurso.But_ExcluirClick(Sender: TObject);
var
  sql:String;
begin

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
          ShowMessage('Erro ao Remover!');
        End;
      End;

      QueryPesquisa.Open;


end;

procedure TForm_PesquisaCurso.But_NovoClick(Sender: TObject);
begin
  inherited;
   try

        QueryPesquisa.Append;
        QueryPesquisaCD_CURSO.Value:=(CONEXAO.RetornaPK('CD_CURSO','TB_CURSO'));
        Form_CadastroCurso:=TForm_CadastroCurso.Create(self);
        Form_CadastroCurso.ShowModal;

     finally
        Form_CadastroCurso.Free;
        QueryPesquisa.Close;
        ButPesquisaClick(ButPesquisa);

     end;
end;

end.
