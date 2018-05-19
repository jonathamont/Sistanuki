unit UnitPesquisaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPesquisaBase, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TForm_PesquisaPessoa = class(TForm_PesquisaBase)
    QueryPesquisaCD_PESSOA: TIntegerField;
    QueryPesquisaNM_PESSOA: TIBStringField;
    QueryPesquisaFG_FISC_JURID: TIBStringField;
    QueryPesquisaFG_SEXO: TIBStringField;
    QueryPesquisaDT_NASCIMENTO: TDateField;
    QueryPesquisaNR_TELEFONE: TIBStringField;
    QueryPesquisaNR_CELULAR: TIBStringField;
    QueryPesquisaDS_EMAIL: TIBStringField;
    QueryPesquisaCD_CIDADE: TIntegerField;
    QueryPesquisaFG_FUNC: TIBStringField;
    QueryPesquisaDS_BAIRRO: TIBStringField;
    QueryPesquisaDS_RUA: TIBStringField;
    QueryPesquisaNM_CIDADE: TIBStringField;
    QueryPesquisaNR_CPF_CNPJ: TIBStringField;
    procedure ButPesquisaClick(Sender: TObject);
    procedure But_NovoClick(Sender: TObject);
    procedure But_AlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_PesquisaPessoa: TForm_PesquisaPessoa;

implementation

{$R *.dfm}

uses UnitConexao, UnitCadastroPessoas;

procedure TForm_PesquisaPessoa.ButPesquisaClick(Sender: TObject);
var
  SQL:String;
begin
  inherited;
  sql:='SELECT P.*, C.NM_CIDADE FROM TB_PESSOA P INNER JOIN TB_CIDADE C ON(C.CD_CIDADE = P.CD_CIDADE) ';
  case RadioFiltro.ItemIndex of
      0:
        begin
             if (Trim(MaskEditPesquisa.Text) = '')  then
               begin
                    SQL:=SQL +(' ORDER BY CD_PESSOA;')
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
end;

procedure TForm_PesquisaPessoa.But_AlterarClick(Sender: TObject);
begin
  inherited;
   try
        QueryPesquisa.Edit;
        Form_CadastroPessoa:=TForm_CadastroPessoa.Create(self);
        Form_CadastroPessoa.ShowModal;

     finally
        QueryPesquisaNR_CPF_CNPJ.EditMask:='';
        Form_CadastroPessoa.Free;
     end;
end;

procedure TForm_PesquisaPessoa.But_NovoClick(Sender: TObject);
begin
  inherited;
      try

        QueryPesquisa.Append;
        Form_CadastroPessoa:=TForm_CadastroPessoa.Create(self);
        Form_CadastroPessoa.ShowModal;

     finally
        Form_CadastroPessoa.Free;
        QueryPesquisaNR_CPF_CNPJ.EditMask:='';
        QueryPesquisa.Close;
        ButPesquisaClick(ButPesquisa);

     end;
end;

procedure TForm_PesquisaPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  QueryPesquisaDT_NASCIMENTO.EditMask:='00/00/0000';
  QueryPesquisaNR_TELEFONE.EditMask:='(00)0000-0000';
  QueryPesquisaNR_CELULAR.EditMask:='(00)00000-0000';
end;

end.
