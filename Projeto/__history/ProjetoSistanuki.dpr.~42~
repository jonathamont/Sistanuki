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
  UnitCadastroPessoas in '..\Cadastros\UnitCadastroPessoas.pas' {Form_CadastroPessoa},
  UnitPesquisaAulaExp in '..\Pesquisa\UnitPesquisaAulaExp.pas' {Form_PesquisaAulaExp},
  UnitCadastroAulaExp in '..\Cadastros\UnitCadastroAulaExp.pas' {Form_CadastroAulaExp},
  UnitCadastroBaseMestreDetalhe in '..\Modelo\UnitCadastroBaseMestreDetalhe.pas' {Form_CadastroBaseMestreDetalhe},
  UnitPesquisaCurso in '..\Pesquisa\UnitPesquisaCurso.pas' {Form_PesquisaCurso},
  UnitCadastroCurso in '..\Cadastros\UnitCadastroCurso.pas' {Form_CadastroCurso},
  UnitPesquisaTurma in '..\Pesquisa\UnitPesquisaTurma.pas' {Form_PesquisaTurma},
  UnitCadastroTurma in '..\Cadastros\UnitCadastroTurma.pas' {Form_CadastroTurma},
  UnitPesquisaAula in '..\Pesquisa\UnitPesquisaAula.pas' {Form_PesquisaAula},
  UnitCadastroAula in '..\Cadastros\UnitCadastroAula.pas' {Form_CadastroAula},
  UnitCadastroMatricula in '..\Cadastros\UnitCadastroMatricula.pas' {Form_CadastroMatricula},
  UnitPesquisaMatricula in '..\Pesquisa\UnitPesquisaMatricula.pas' {Form_PesquisaMatricula},
  UnitMenu in '..\Menu\UnitMenu.pas' {Form_Menu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCONEXAO, CONEXAO);
  Application.CreateForm(TForm_Menu, Form_Menu);
  Application.Run;
end.

