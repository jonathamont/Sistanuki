program ProjetoSistanuki;

uses
  Vcl.Forms,
  UnitConexao in '..\DataModulo\UnitConexao.pas' {CONEXAO: TDataModule},
  UnitCadastroPadrão in '..\Modelo\UnitCadastroPadrão.pas' {Form_CadastroPadrao},
  Vcl.Themes,
  Vcl.Styles,
  UnitCadastroCidade in '..\Cadastros\UnitCadastroCidade.pas' {Form_CadastroCidades},
  UnitPesquisaBase in '..\Modelo\UnitPesquisaBase.pas' {Form_PesquisaBase},
  UnitPesquisaCidade in '..\Pesquisa\UnitPesquisaCidade.pas' {Form_PesquisaCidade},
  UnitCadastroMateria in '..\Cadastros\UnitCadastroMateria.pas' {Form_CadastroMaterias},
  UnitPesquisaMateria in '..\Pesquisa\UnitPesquisaMateria.pas' {Form_PesquisaMateria},
  UnitPesquisaPessoa in '..\Pesquisa\UnitPesquisaPessoa.pas' {Form_PesquisaPessoa},
  UnitCadastroPessoas in '..\Cadastros\UnitCadastroPessoas.pas' {Form_CadastroPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
<<<<<<< HEAD
  TStyleManager.TrySetStyle('Ruby Graphite');
=======
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
>>>>>>> parent of a50ed7f... FINAL CADASTRO PESSOA
  Application.CreateForm(TCONEXAO, CONEXAO);
  Application.CreateForm(TForm_PesquisaPessoa, Form_PesquisaPessoa);
  Application.Run;
end.
