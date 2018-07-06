unit UnitCadastroAula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroBaseMestreDetalhe, Data.DB,
  IBX.IBCustomDataSet, IBX.IBUpdateSQL, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TForm_CadastroAula = class(TForm_CadastroBaseMestreDetalhe)
    Label1: TLabel;
    Edit_CdAula: TDBEdit;
    Label2: TLabel;
    Edit_CdTurma: TDBEdit;
    Label3: TLabel;
    Edit_CdProf: TDBEdit;
    Label4: TLabel;
    Edit_NmProf: TDBEdit;
    Label5: TLabel;
    Edit_Data: TDBEdit;
    Label6: TLabel;
    Edit_HrInicio: TDBEdit;
    Label7: TLabel;
    EditHrFim: TDBEdit;
    But_AdiconaAlunos: TBitBtn;
    RadioEncerrado: TDBRadioGroup;
    RadioProfPres: TDBRadioGroup;
    Panel1: TPanel;
    QueryItemCD_AULA_ALUNO: TIntegerField;
    QueryItemCD_AULA: TIntegerField;
    QueryItemCD_ALUNO: TIntegerField;
    QueryItemCD_MATERIA: TIntegerField;
    QueryItemFG_PRESENCA: TIBStringField;
    QueryItemFG_EXP: TIBStringField;
    QueryItemNM_PESSOA: TIBStringField;
    QueryItemNM_MATERIA: TIBStringField;
    Label8: TLabel;
    Edit_CdAluno: TDBEdit;
    Label9: TLabel;
    Edit_NmPessoa: TDBEdit;
    Label10: TLabel;
    Edit_CdMateria: TDBEdit;
    Label11: TLabel;
    Edit_NmMateria: TDBEdit;
    RadioPresenca: TDBRadioGroup;
    But_PesquisaMat: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure But_Item_EditClick(Sender: TObject);
    procedure But_Item_SaveClick(Sender: TObject);
    procedure But_AdiconaAlunosClick(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroAula: TForm_CadastroAula;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaAula, UnitPesquisaTurma;

procedure TForm_CadastroAula.But_AdiconaAlunosClick(Sender: TObject);
VAR
  chave:Integer;
  SQL:String;
begin
  inherited;
  sql:='select cd_aluno from tb_turma_aluno t where t.cd_turma = ' + Edit_CdTurma.Text;
  CONEXAO.TrocaSQL(CONEXAO.Query,SQL);
  if (CONEXAO.Query.IsEmpty) then
   BEGIN
      ShowMessage('Nenhum aluno encontrado:');
      exit;
   END;
   //chave:=DataSourceCadastro.DataSet.FieldByName('')
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
         DataSourceCadastro.DataSet.Locate('CD_Aula',Chave,[]);
         QueryItem.Open;
         QueryItem.Append;


  end;
   while not(CONEXAO.Query.IsEmpty) do
    begin

    end;


   ///CONEXAO.Query.FieldByName('cd_aluno').Value
end;

procedure TForm_CadastroAula.But_Item_EditClick(Sender: TObject);
begin
  Edit_CdAluno.Enabled:=True;
  Edit_CdMateria.Enabled:=True;
  RadioPresenca.Enabled:=True;
  But_PesquisaMat.Enabled:=True;
  inherited;

end;

procedure TForm_CadastroAula.But_Item_SaveClick(Sender: TObject);
var
  chave:integer;
begin
  inherited;
  DataSourceCadastro.DataSet.Locate('CD_TURMA',Chave,[]);
  QueryItem.Open;
  Edit_CdAluno.Enabled:=False;
  Edit_CdMateria.Enabled:=False;
  RadioPresenca.Enabled:=False;
  But_PesquisaMat.Enabled:=False;

end;

procedure TForm_CadastroAula.But_PesquisaClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaTurma:=TForm_PesquisaTurma.Create(self);
    Form_PesquisaTurma.ShowModal
  finally
    if (Form_PesquisaTurma.ModalResult = mrok) then
      begin
           DataSourceCadastro.DataSet.FieldByName('CD_TURMA').Value:=Form_PesquisaTurma.QueryPesquisa.FieldByName('CD_TURMA').AsInteger;
           DataSourceCadastro.DataSet.FieldByName('CD_PROF').Value:=Form_PesquisaTurma.QueryPesquisa.FieldByName('CD_PROFESSOR').AsInteger;
           DataSourceCadastro.DataSet.FieldByName('NM_PESSOA').Value:=Form_PesquisaTurma.QueryPesquisa.FieldByName('NM_PESSOA').Value;
      end;
    Form_PesquisaTurma.QueryPesquisa.Close;
    Form_PesquisaTurma.Free;
  end;
end;

procedure TForm_CadastroAula.FormCreate(Sender: TObject);
begin
  inherited;
  QueryItem.close;
  QueryItem.ParamByName('AULA').AsInteger:=DataSourceCadastro.DataSet.FieldByName('CD_AULA').Value;
  QueryItem.Open;
  Edit_CdAluno.Enabled:=False;
  Edit_CdMateria.Enabled:=False;
  RadioPresenca.Enabled:=False;
  But_PesquisaMat.Enabled:=False;
end;

end.
