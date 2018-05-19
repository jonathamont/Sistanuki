inherited Form_PesquisaBase1: TForm_PesquisaBase1
  Caption = 'Form_PesquisaBase1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select ae.*, p.nm_pessoa, c.nm_curso from tb_aula_exp ae'
      'inner join tb_pessoa p on (p.cd_pessoa = p.cd_pessoa)'
      'inner join tb_curso c on (c.cd_curso = c.cd_curso)'
      'order by p.nm_pessoa')
  end
end
