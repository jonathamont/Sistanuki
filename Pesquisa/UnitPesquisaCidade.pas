unit UnitPesquisaCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, UnitConexao, IBX.IBUpdateSQL, frxClass,
  frxDBSet;

type
  TForm_PesquisaCidade = class(TForm_PesquisaBase)
    QueryPesquisaCD_CIDADE: TIntegerField;
    QueryPesquisaNM_CIDADE: TIBStringField;
    QueryPesquisaDS_ESTADO: TIBStringField;
    QueryPesquisaDS_PAIS: TIBStringField;
    Dataset_Cidades: TfrxDBDataset;
    Report_Cidades: TfrxReport;
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_NovoClick(Sender: TObject);
    procedure But_ExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form_PesquisaCidade: TForm_PesquisaCidade;

implementation

{$R *.dfm}

uses UnitCadastroCidade;

procedure TForm_PesquisaCidade.ButPesquisaClick(Sender: TObject);
var
    SQL:string;
begin
  inherited;
  sql:='select C.CD_CIDADE, C. NM_CIDADE, C.DS_ESTADO, C.DS_PAIS FROM TB_CIDADE C ';
  case RadioFiltro.ItemIndex of
    0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_CIDADE;')
               end
             else
                    SQL:= (SQL +' WHERE CD_CIDADE = '+MaskEditPesquisa.Text+';');
        end;
      1: SQL:= (SQL+' where C.NM_CIDADE like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by NM_CIDADE;');
      2: SQL:= (SQL+' where C.DS_ESTADO like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by DS_ESTADO;');

  END;

  CONEXAO.TrocaSQL(QueryPesquisa,SQL);
end;

procedure TForm_PesquisaCidade.But_AlterarClick(Sender: TObject);
begin
  inherited;

      try
        QueryPesquisa.Edit;
        Form_CadastroCidades:=TForm_cadastroCidades.Create(self);
        Form_CadastroCidades.ShowModal;
      finally
        Form_CadastroCidades.Free;
      end;
end;

procedure TForm_PesquisaCidade.But_ExcluirClick(Sender: TObject);
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
          ShowMessage('Erro ao Remover!');
        End;
      End;
end;

procedure TForm_PesquisaCidade.But_NovoClick(Sender: TObject);
begin
  inherited;
    try
        /////
        QueryPesquisa.Append;
        Form_CadastroCidades:=TForm_CadastroCidades.Create(self);
        Form_CadastroCidades.ShowModal;

     finally
        Form_CadastroCidades.Free;
     end;

end;

end.
