unit UnitPesquisaAula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TForm_PesquisaAula = class(TForm_PesquisaBase)
    QueryPesquisaCD_AULA: TIntegerField;
    QueryPesquisaCD_TURMA: TIntegerField;
    QueryPesquisaCD_PROF: TIntegerField;
    QueryPesquisaDT_AULA: TDateField;
    QueryPesquisaHR_INICIO: TTimeField;
    QueryPesquisaHR_FIM: TTimeField;
    QueryPesquisaFG_ENCERRADA: TIBStringField;
    QueryPesquisaFG_PROF_PRESENT: TIBStringField;
    QueryPesquisaNM_PESSOA: TIBStringField;
    Edit_DtInicio: TMaskEdit;
    Edit_DtFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Dataset_Aula: TfrxDBDataset;
    Report_Aula: TfrxReport;
    procedure But_NovoClick(Sender: TObject);
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure But_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaAula: TForm_PesquisaAula;

implementation

{$R *.dfm}

uses UnitCadastroAula, UnitConexao;

procedure TForm_PesquisaAula.ButPesquisaClick(Sender: TObject);
VAR
    sql:String;
begin
  inherited;
  sql:='select a.*,p.nm_pessoa  from TB_AULA a inner join tb_pessoa p on(p.cd_pessoa = a.cd_prof) ';
  case RadioFiltro.ItemIndex of
      0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_Aula;')
               end
             else
                    SQL:= (SQL +' WHERE CD_AULA = '+MaskEditPesquisa.Text+';');
        end;
      	  1: SQL:= (SQL+' where P.NM_PESSOA like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by P.NM_PESSOA;');
      2: SQL:= (SQL+' where DT_AULA BETWEEN '+QuotedStr(Edit_DtInicio.Text)+' AND '+QuotedStr(Edit_DtFim.Text) +' Order by DT_AULA;');
      3: begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_TURMA;')
               end
             else
                    SQL:= (SQL +' WHERE CD_TURMA = '+MaskEditPesquisa.Text+';');
        end;
        4: SQL:= (SQL+' where FG_ENCERRADA like '+QuotedStr('%'+MaskEditPesquisa.Text+'%')+' Order by FG_ENCERRADA;');
  END;

  CONEXAO.TrocaSQL(QueryPesquisa,SQL);
end;

procedure TForm_PesquisaAula.But_AlterarClick(Sender: TObject);
begin
  inherited;
  try
        QueryPesquisa.Edit;
        QueryPesquisaHR_INICIO.EditMask:='00:00:00';
        QueryPesquisaHR_FIM.EditMask:='00:00:00';
        QueryPesquisaDT_AULA.EditMask:='00/00/0000';
        Form_CadastroAula:=TForm_CadastroAula.Create(self);
        Form_CadastroAula.ShowModal;

     finally
        Form_CadastroAula.Free;
        ButPesquisaClick(ButPesquisa);

     end;
end;

procedure TForm_PesquisaAula.But_ImprimirClick(Sender: TObject);
begin
  inherited;
  Report_Aula.ShowReport();
end;

procedure TForm_PesquisaAula.But_NovoClick(Sender: TObject);
begin
  inherited;
  try
        QueryPesquisa.Open;
        QueryPesquisa.Append;
        QueryPesquisaCD_AULA.Value:=(CONEXAO.RetornaPK('CD_AULA','TB_AULA'));
        QueryPesquisaFG_ENCERRADA.Value:='N';
        QueryPesquisaHR_INICIO.EditMask:='00:00:00';
        QueryPesquisaHR_FIM.EditMask:='00:00:00';
        QueryPesquisaDT_AULA.EditMask:='00/00/0000';
        Form_CadastroAula:=TForm_CadastroAula.Create(self);
        Form_CadastroAula.ShowModal;

     finally
        Form_CadastroAula.Free;
        QueryPesquisa.Close;
        ButPesquisaClick(ButPesquisa);

     end;
end;

end.
