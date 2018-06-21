unit UnitCadastroAulaExp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrão, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls;

type
  TForm_CadastroAulaExp = class(TForm_CadastroPadrao)
    Label1: TLabel;
    Edit_CodAulaExp: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Edit_CodPessoa: TDBEdit;
    Label3: TLabel;
    Edit_DataCadastro: TDBEdit;
    Label4: TLabel;
    Edit_DataAula: TDBEdit;
    Label5: TLabel;
    Edit_CodCurso: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Edit_NomePessoa: TDBEdit;
    Label8: TLabel;
    Edit_NomeCurso: TDBEdit;
    Btn_PesquisaCurso: TSpeedButton;
    procedure But_SalvarClick(Sender: TObject);
    procedure Edit_CodCursoExit(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure Btn_PesquisaCursoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroAulaExp: TForm_CadastroAulaExp;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaAulaExp, UnitPesquisaCurso, UnitPesquisaPessoa;

procedure TForm_CadastroAulaExp.Btn_PesquisaCursoClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaCurso:=TForm_PesquisaCurso.Create(Self);
    Form_PesquisaCurso.ShowModal
  finally
    if (Form_PesquisaCurso.ModalResult = mrOk) then
    begin
      DataSourceCadastro.DataSet.FieldByName('CD_CURSO').AsInteger:=Form_PesquisaCurso.QueryPesquisaCD_CURSO.AsInteger;
      DataSourceCadastro.DataSet.FieldByName('NM_CURSO').AsString:=Form_PesquisaCurso.QueryPesquisaNM_CURSO.AsString;
    end;
    Form_PesquisaCurso.QueryPesquisa.Close;
    Form_PesquisaCurso.Free;
  end;

end;

procedure TForm_CadastroAulaExp.But_PesquisaClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaPessoa:=TForm_PesquisaPessoa.Create(Self);
    Form_PesquisaPessoa.ShowModal
  finally
    if (Form_PesquisaPessoa.ModalResult = mrOk) then
    begin
       DataSourceCadastro.DataSet.FieldByName('CD_PESSOA').AsInteger:=Form_PesquisaPessoa.QueryPesquisaCD_PESSOA.AsInteger;
       DataSourceCadastro.DataSet.FieldByName('NM_PESSOA').AsString:=Form_PesquisaPessoa.QueryPesquisaNM_PESSOA.AsString;
    end;
    Form_PesquisaPessoa.QueryPesquisa.Close;
    Form_PesquisaPessoa.Free;
  end;
end;

procedure TForm_CadastroAulaExp.But_SalvarClick(Sender: TObject);
begin
  inherited;

  if Edit_CodPessoa.Text = '' then
  begin
    Application.MessageBox('Nome é um campo obrigatório','Aviso');
    Exit;
  end;

  if Edit_CodCurso.Text = '' then
  begin
    Application.MessageBox('Curso é um campo obrigatório','Aviso');
    Exit;
  end;

  if Edit_DataCadastro.Text = '' then
  begin
    Application.MessageBox('Data de cadastro é um campo obrigatório','Aviso');
    Exit;
  end;

  if Edit_DataAula.Text = '' then
  begin
    Application.MessageBox('Data da aula é um campo obrigatório','Aviso');
    Exit;
  end;

end;

procedure TForm_CadastroAulaExp.Edit_CodCursoExit(Sender: TObject);
var
  sql:String;
begin
  inherited;

  if Edit_CodCurso.Text = '' then
    Begin
      Exit;
    End;

  sql := ('SELECT NM_CURSO FROM TB_CURSO = '+Edit_CodCurso.Text);
  CONEXAO.TrocaSQL(CONEXAO.Query,sql);
  if CONEXAO.Query.IsEmpty then
    begin
      Application.MessageBox('Código do CURSO não localizado','Aviso',MB_ICONWARNING+MB_OK);
      Edit_CodCurso.SetFocus;
      Exit;
    end;
  DataSourceCadastro.DataSet.FieldByName('NM_CURSO').AsString:=CONEXAO.Query.FieldByName('NM_CURSO').AsString;


end;

procedure TForm_CadastroAulaExp.FormCreate(Sender: TObject);
begin
   if (DataSourceCadastro.State = dsInsert) then
   begin
     DataSourceCadastro.DataSet.FieldByName('CD_AULA_EXP').Text:=IntToStr(CONEXAO.RetornaPK('CD_AULA_EXP','TB_AULA_EXP'));

   end;

  inherited;

end;

end.
