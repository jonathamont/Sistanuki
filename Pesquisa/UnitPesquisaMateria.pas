unit UnitPesquisaMateria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaMateria = class(TForm_PesquisaBase)
    procedure But_NovoClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_ExcluirClick(Sender: TObject);
    procedure ButPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaMateria: TForm_PesquisaMateria;

implementation

{$R *.dfm}

uses UnitCadastroMateria, UnitConexao;

procedure TForm_PesquisaMateria.ButPesquisaClick(Sender: TObject);
VAR
    sql:String;
begin
  inherited;
  sql:='select M.CD_MATERIA, M. NM_MATERIA, M.DS_MATERIA FROM TB_MATERIA M ';
  case RadioFiltro.ItemIndex of
      0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_MATERIA;')
               end
             else
                    SQL:= (SQL +' WHERE CD_MATERIA = '+MaskEditPesquisa.Text+';');
        end;
      1: SQL:= (SQL+' where M.NM_MATERIA like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by NM_MATERIA;');
  END;

  CONEXAO.TrocaSQL(QueryPesquisa,SQL);
end;

procedure TForm_PesquisaMateria.But_AlterarClick(Sender: TObject);
begin
  inherited;
  try
        QueryPesquisa.Edit;
        Form_CadastroMaterias:=TForm_CadastroMaterias.Create(self);
        Form_CadastroMaterias.ShowModal;

     finally
        Form_CadastroMaterias.Free;
     end;
end;

procedure TForm_PesquisaMateria.But_ExcluirClick(Sender: TObject);
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

procedure TForm_PesquisaMateria.But_NovoClick(Sender: TObject);
begin
  inherited;
     try
        QueryPesquisa.Append;
        Form_CadastroMaterias:=TForm_CadastroMaterias.Create(self);
        Form_CadastroMaterias.ShowModal;

     finally
        Form_CadastroMaterias.Free;
     end;
end;

end.
