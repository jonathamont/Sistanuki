unit UnitCadastroCurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBaseMestreDetalhe, Data.DB,
  Vcl.ExtCtrls, IBX.IBCustomDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TForm_CadastroCurso = class(TForm_CadastroBaseMestreDetalhe)
    Label1: TLabel;
    Edit_CodCurso: TDBEdit;
    Label2: TLabel;
    Edit_NMCurso: TDBEdit;
    Label3: TLabel;
    Edit_Horas: TDBEdit;
    QueryItemCD_CURSO_MATERIA: TIntegerField;
    QueryItemCD_CURSO: TIntegerField;
    QueryItemCD_MATERIA: TIntegerField;
    QueryItemNM_MATERIA: TIBStringField;
    Label4: TLabel;
    Edit_CodMateria: TDBEdit;
    Label5: TLabel;
    Edit_NmMateria: TDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure But_Item_NovoClick(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure Edit_CodMateriaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroCurso: TForm_CadastroCurso;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaCurso, UnitPesquisaMateria;

procedure TForm_CadastroCurso.But_Item_NovoClick(Sender: TObject);
begin

  DataSourceItem.DataSet.Open;
  inherited;
  QueryItemCD_CURSO_MATERIA.Value:=CONEXAO.RetornaPK('CD_CURSO_MATERIA','TB_CURSO_MATERIA');
  QueryItemCD_CURSO.Value:=StrToInt(Edit_CodCurso.Text);

end;

procedure TForm_CadastroCurso.But_PesquisaClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaMateria:=TForm_PesquisaMateria.Create(self);
    Form_PesquisaMateria.ShowModal
  finally
    if (Form_PesquisaMateria.ModalResult = mrok) then
      begin
           QueryItemCD_MATERIA.Value:=Form_PesquisaMateria.QueryPesquisa.FieldByName('CD_MATERIA').AsInteger;
           QueryItemNM_MATERIA.Value:=Form_PesquisaMateria.QueryPesquisa.FieldByName('NM_MATERIA').AsString;
      end;
    Form_PesquisaMateria.QueryPesquisa.Close;
    Form_PesquisaMateria.Free;


  end;
end;
procedure TForm_CadastroCurso.Edit_CodMateriaExit(Sender: TObject);
var
  sql:String;
begin
  inherited;
   if Edit_CodMateria.Text='' then
  begin
    EXIT;
  end;
  SQL:=('SELECT NM_MATERIA FROM TB_MATERIA M WHERE CD_MATERIA='+Edit_CodMateria.Text);
  CONEXAO.TrocaSQL(CONEXAO.Query,SQL);
  if CONEXAO.Query.IsEmpty then
    begin
         Application.MessageBox('Codigo MATERIA n�o localizado','Aviso',MB_ICONWARNING+MB_OK);
         Edit_CodMateria.SetFocus;
         exit;
    end;
  QueryItemNM_MATERIA.Value:=CONEXAO.Query.FieldByName('NM_MATERIA').AsString;
end;

end.
