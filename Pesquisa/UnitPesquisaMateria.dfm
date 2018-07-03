inherited Form_PesquisaMateria: TForm_PesquisaMateria
  Caption = 'Pesquisa Materia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox: TGroupBox
    inherited ButPesquisa: TBitBtn
      OnClick = ButPesquisaClick
    end
    inherited But_Imprimir: TBitBtn
      Visible = False
    end
  end
  inherited Panel1: TPanel
    inherited But_Alterar: TBitBtn
      OnClick = But_AlterarClick
    end
    inherited But_Excluir: TBitBtn
      OnClick = But_ExcluirClick
    end
  end
  inherited But_Novo: TBitBtn
    OnClick = But_NovoClick
  end
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select * from TB_MATERIA')
    Left = 672
    Top = 136
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_MATERIA,'
      '  NM_MATERIA,'
      '  DS_MATERIA'
      'from TB_MATERIA '
      'where'
      '  CD_MATERIA = :CD_MATERIA')
    ModifySQL.Strings = (
      'update TB_MATERIA'
      'set'
      '  CD_MATERIA = :CD_MATERIA,'
      '  NM_MATERIA = :NM_MATERIA,'
      '  DS_MATERIA = :DS_MATERIA'
      'where'
      '  CD_MATERIA = :OLD_CD_MATERIA')
    InsertSQL.Strings = (
      'insert into TB_MATERIA'
      '  (CD_MATERIA, NM_MATERIA, DS_MATERIA)'
      'values'
      '  (:CD_MATERIA, :NM_MATERIA, :DS_MATERIA)')
    DeleteSQL.Strings = (
      'delete from TB_MATERIA'
      'where'
      '  CD_MATERIA = :OLD_CD_MATERIA')
    Left = 512
    Top = 128
  end
end
