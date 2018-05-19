unit UnitCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitCadastroPadrão, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TForm_CadastroPessoa = class(TForm_CadastroPadrao)
    Label1: TLabel;
    Edit_CodigoPessoa: TDBEdit;
    Label2: TLabel;
    Edit_Nome: TDBEdit;
    Label3: TLabel;
    Edit_CPF_CNPJ: TDBEdit;
    Label7: TLabel;
    Edit_Dt_Nasci: TDBEdit;
    Label8: TLabel;
    Edit_Telefone: TDBEdit;
    Label9: TLabel;
    Edit_Celulat: TDBEdit;
    Label10: TLabel;
    Edit_Email: TDBEdit;
    Label11: TLabel;
    Edit_CodCidade: TDBEdit;
    Label13: TLabel;
    Edit_NmCidade: TDBEdit;
    Label14: TLabel;
    Edit_Bairro: TDBEdit;
    Label15: TLabel;
    Edit_Rua: TDBEdit;
    RadioSexo: TDBRadioGroup;
    RadioFunc: TDBRadioGroup;
    Radio_Fis_Juri: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure But_PesquisaClick(Sender: TObject);
    procedure Edit_CodCidadeExit(Sender: TObject);
    procedure But_SalvarClick(Sender: TObject);
    procedure Radio_Fis_JuriExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_CadastroPessoa: TForm_CadastroPessoa;

implementation

{$R *.dfm}

uses UnitConexao, UnitPesquisaPessoa, UnitPesquisaCidade;

procedure TForm_CadastroPessoa.But_PesquisaClick(Sender: TObject);
begin
  inherited;
  try
    Form_PesquisaCidade:=TForm_PesquisaCidade.Create(self);
    Form_PesquisaCidade.ShowModal
  finally
    if (Form_PesquisaCidade.ModalResult = mrok) then
      begin
           DataSourceCadastro.DataSet.FieldByName('CD_CIDADE').AsInteger:=Form_PesquisaCidade.QueryPesquisaCD_CIDADE.AsInteger;
           DataSourceCadastro.DataSet.FieldByName('NM_CIDADE').AsString:=Form_PesquisaCidade.QueryPesquisaNM_CIDADE.AsString;
           //QueryCadastroNM_CIDADE.AsString:=Form_PesquisaCidade.QueryPesquisaNM_CIDADE.AsString;
      end;
    Form_PesquisaCidade.QueryPesquisa.Close;
    Form_PesquisaCidade.Free;
  end;
end;

procedure TForm_CadastroPessoa.But_SalvarClick(Sender: TObject);
begin
  if Edit_Nome.Text = '' then
  begin
        Application.MessageBox('Nome é um campo obrigatorio','Aviso');
        exit;
  end;
  if Edit_Dt_Nasci.Text = '' then
  begin
        Application.MessageBox('Data de nascimento é um campo obrigatorio','Aviso');
        exit;
  end;
  if Edit_CodCidade.Text = '' then
  begin
        Application.MessageBox('Cidade é um campo obrigatorio','Aviso');
        exit;
  end;
  if Edit_Bairro.Text = '' then
  begin
        Application.MessageBox('Bairro é um campo obrigatorio','Aviso');
        exit;
  end;
  if Edit_Rua.Text = '' then
  begin
        Application.MessageBox('Rua é um campo obrigatorio','Aviso');
        exit;
  end;

  inherited;

end;

procedure TForm_CadastroPessoa.Edit_CodCidadeExit(Sender: TObject);
var
  sql:String;
begin
  inherited;
   if Edit_CodCidade.Text='' then
  begin
    EXIT;
  end;
  SQL:=('SELECT NM_CIDADE FROM TB_CIDADE WHERE CD_CIDADE ='+Edit_CodCidade.Text);
  CONEXAO.TrocaSQL(CONEXAO.Query,SQL);
  if CONEXAO.Query.IsEmpty then
    begin
         Application.MessageBox('Codigo CIDADE não localizado','Aviso',MB_ICONWARNING+MB_OK);
         Edit_CodCidade.SetFocus;
         exit;
    end;
  DataSourceCadastro.DataSet.FieldByName('NM_CIDADE').AsString:=CONEXAO.Query.FieldByName('NM_CIDADE').AsString;
end;

procedure TForm_CadastroPessoa.FormCreate(Sender: TObject);
begin

  if (DataSourceCadastro.State = dsInsert) then
  begin
       DataSourceCadastro.DataSet.FieldByName('NR_CPF_CNPJ').EditMask:='000.000.00-00';
       DataSourceCadastro.DataSet.FieldByName('FG_SEXO').Value:='M';
       DataSourceCadastro.DataSet.FieldByName('FG_FISC_JURID').Value:='F';
       DataSourceCadastro.DataSet.FieldByName('FG_FUNC').Value:='N';
       DataSourceCadastro.DataSet.FieldByName('CD_PESSOA').Text:=intToStr(CONEXAO.RetornaPK('CD_PESSOA','TB_PESSOA'));
       //Edit_CodigoPessoa.text:=IntToStr(CONEXAO.RetornaPK('CD_PESSOA','TB_PESSOA'));

  end;

  inherited;



end;

procedure TForm_CadastroPessoa.Radio_Fis_JuriExit(Sender: TObject);
begin
  inherited;
  case Radio_Fis_Juri.ItemIndex of
  0:DataSourceCadastro.DataSet.FieldByName('NR_CPF_CNPJ').EditMask:='000.000.00-00';
  1:DataSourceCadastro.DataSet.FieldByName('NR_CPF_CNPJ').EditMask:='000.000/0000-00'
  end;
end;

end.
