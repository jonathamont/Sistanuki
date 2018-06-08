inherited Form_PesquisaCurso: TForm_PesquisaCurso
  Caption = 'Pesquisa Curso'
  ExplicitTop = -213
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox: TGroupBox
    inherited ButPesquisa: TBitBtn
      OnClick = ButPesquisaClick
    end
  end
  inherited Panel1: TPanel
    inherited But_Alterar: TBitBtn
      OnClick = But_AlterarClick
    end
  end
  inherited But_Novo: TBitBtn
    OnClick = But_NovoClick
  end
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select * from TB_CURSO')
    Left = 688
    object QueryPesquisaCD_CURSO: TIntegerField
      FieldName = 'CD_CURSO'
      Origin = '"TB_CURSO"."CD_CURSO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
    object QueryPesquisaNR_HORAS: TTimeField
      FieldName = 'NR_HORAS'
      Origin = '"TB_CURSO"."NR_HORAS"'
      Required = True
    end
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_CURSO,'
      '  NM_CURSO,'
      '  NR_HORAS'
      'from TB_CURSO '
      'where'
      '  CD_CURSO = :CD_CURSO')
    ModifySQL.Strings = (
      'update TB_CURSO'
      'set'
      '  CD_CURSO = :CD_CURSO,'
      '  NM_CURSO = :NM_CURSO,'
      '  NR_HORAS = :NR_HORAS'
      'where'
      '  CD_CURSO = :OLD_CD_CURSO')
    InsertSQL.Strings = (
      'insert into TB_CURSO'
      '  (CD_CURSO, NM_CURSO, NR_HORAS)'
      'values'
      '  (:CD_CURSO, :NM_CURSO, :NR_HORAS)')
    DeleteSQL.Strings = (
      'delete from TB_CURSO'
      'where'
      '  CD_CURSO = :OLD_CD_CURSO')
    Left = 488
  end
end
