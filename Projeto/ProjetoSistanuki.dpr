program ProjetoSistanuki;

uses
  Vcl.Forms,
  UnitConexao in '..\DataModulo\UnitConexao.pas' {CONEXAO: TDataModule},
  UnitCadastroPadr�o in '..\Modelo\UnitCadastroPadr�o.pas' {Form_CadastroPadrao},
  Vcl.Themes,
  Vcl.Styles,
  UnitCadastroCidade in '..\Cadastros\UnitCadastroCidade.pas' {Form_CadastroCidades},
  UnitPesquisaBase in '..\Modelo\UnitPesquisaBase.pas' {Form_PesquisaBase},
  UnitPesquisaCidade in '..\Pesquisa\UnitPesquisaCidade.pas' {Form_PesquisaCidade},
  UnitCadastroMateria in '..\Cadastros\UnitCadastroMateria.pas' {Form_CadastroMaterias},
  UnitPesquisaMateria in '..\Pesquisa\UnitPesquisaMateria.pas' {Form_PesquisaMateria},
  UnitPesquisaPessoa in '..\Pesquisa\UnitPesquisaPessoa.pas' {Form_PesquisaPessoa},
  UnitCadastroPessoas in '..\Cadastros\UnitCadastroPessoas.pas' {Form_CadastroPessoa},
  UnitPesquisaAulaExp in '..\Pesquisa\UnitPesquisaAulaExp.pas' {Form_PesquisaBase1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TCONEXAO, CONEXAO);
<<<<<<< HEAD
  Application.CreateForm(TForm_PesquisaPessoa, Form_PesquisaPessoa);
  Application.CreateForm(TForm_PesquisaBase1, Form_PesquisaBase1);
=======
  Application.CreateForm(TForm_PesquisaMateria, Form_PesquisaMateria);
>>>>>>> bcfd8aa68dba10880080f6762371782f7666b99e
  Application.Run;
end.

