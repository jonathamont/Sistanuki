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
    Label3: TLabel;
    Edit_Horas: TDBEdit;
    procedure But_Item_NovoClick(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure Edit_CodMateriaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure But_Item_SaveClick(Sender: TObject);
    procedure But_Item_EditClick(Sender: TObject);
    procedure But_Item_ExcluirClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure But_SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form_CadastroCurso: TForm_CadastroCurso;


implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaCurso, UnitPesquisaMateria;


procedure TForm_CadastroCurso.But_Item_EditClick(Sender: TObject);
begin
  inherited;
  Edit_CodMateria.Enabled:=true;
end;

procedure TForm_CadastroCurso.But_Item_ExcluirClick(Sender: TObject);
var
    chave:Integer;
begin
  chave:=StrToInt(Edit_CodCurso.Text);
  inherited;
  DataSourceCadastro.DataSet.Locate('CD_CURSO',chave,[]);
  QueryItem.Open;


end;

procedure TForm_CadastroCurso.But_Item_NovoClick(Sender: TObject);
begin
  Edit_CodMateria.Enabled:=true;
  DataSourceItem.DataSet.Open;
  inherited;
  QueryItemCD_CURSO_MATERIA.Value:=CONEXAO.RetornaPK('CD_CURSO_MATERIA','TB_CURSO_MATERIA');
  QueryItemCD_CURSO.Value:=StrToInt(DataSourceCadastro.DataSet.FieldByName('CD_CURSO').Value);

end;

procedure TForm_CadastroCurso.But_Item_SaveClick(Sender: TObject);
var
  chave,chaveitem,materia:Integer;
  nome:String;
begin
  if Trim(Edit_NMCurso.Text) = '' then
        begin
             Application.MessageBox('Nome é obrigatorio','Aviso');
             exit;
        end;
        if Trim(Edit_Horas.Text) = '' then
        begin
             Application.MessageBox('Numero de horas é obrigatorio','Aviso');
             exit;
        end;
  chave:=StrToInt(Edit_CodCurso.Text);
  chaveitem:=QueryItemCD_CURSO_MATERIA.Value;
  materia:=QueryItemCD_MATERIA.Value;
  nome:=QueryItemNM_MATERIA.value;
  if DataSourceCadastro.DataSet.State = dsInsert then
  begin

        if not(CONEXAO.Transaction.InTransaction) then
        Begin
          CONEXAO.Transaction.StartTransaction;
        End;

         Try
            DataSourceCadastro.DataSet.Post;
            CONEXAO.Transaction.Commit;
         Except
            ShowMessage('Erro ao gravar!');
            CONEXAO.Transaction.Rollback;
         End;

         DataSourceCadastro.DataSet.Open;
         QueryItem.Open;
         QueryItem.Append;
         QueryItemCD_CURSO_MATERIA.Value:= chaveitem;
         QueryItemCD_CURSO.Value:=chave;
         QueryItemCD_MATERIA.Value:=materia;
         QueryItemNM_MATERIA.Value:=nome;

  end;

  inherited;
  DataSourceCadastro.DataSet.Locate('CD_CURSO',chave,[]);
  QueryItem.Open;
  Edit_CodMateria.Enabled:=false;

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
procedure TForm_CadastroCurso.But_SalvarClick(Sender: TObject);
begin
  if Trim(Edit_NMCurso.Text) = '' then
  begin
       Application.MessageBox('Nome é obrigatorio','Aviso');
       exit;
  end;
  if Trim(Edit_Horas.Text) = '' then
  begin
       Application.MessageBox('Numero de horas é obrigatorio','Aviso');
       exit;
  end;
  if Form_PesquisaCurso.QueryPesquisa.State <> dsInsert then
    begin
      Form_PesquisaCurso.QueryPesquisa.Edit;
  end;

  inherited;

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
         Application.MessageBox('Codigo MATERIA não localizado','Aviso',MB_ICONWARNING+MB_OK);
         Edit_CodMateria.SetFocus;
         exit;
    end;
  QueryItemNM_MATERIA.Value:=CONEXAO.Query.FieldByName('NM_MATERIA').AsString;
end;

procedure TForm_CadastroCurso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QueryItem.Close;
end;

procedure TForm_CadastroCurso.FormCreate(Sender: TObject);
begin
  inherited;
  QueryItem.close;
  QueryItem.ParamByName('CURSO').AsInteger:=DataSourceCadastro.DataSet.FieldByName('CD_CURSO').Value;
  QueryItem.Open;

end;

procedure TForm_CadastroCurso.Label1Click(Sender: TObject);
begin
  inherited;
end;

///OPÇÃO PARA ATUALIZA GRID
///  sql:='select c.*,m.nm_materia from tb_curso_materia c  inner join tb_materia m on(m.cd_materia = c.cd_materia ) where cd_curso =' + IntToStr( DataSourceCadastro.DataSet.FieldByName('CD_CURSO').Value);
//  CONEXAO.TrocaSQL(QueryItem,SQL);


end.
