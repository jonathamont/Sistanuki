inherited Form_PesquisaTurma: TForm_PesquisaTurma
  Caption = 'Pesquisa Turmas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select * from TB_TURMA')
  end
end
