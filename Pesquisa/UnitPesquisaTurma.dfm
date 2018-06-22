inherited Form_PesquisaTurma: TForm_PesquisaTurma
  Caption = 'Pesquisa Turmas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select T.*, P.NM_PESSOA, C.NM_CURSO from TB_TURMA T'
      'INNER JOIN TB_PESSOA P  ON (P.CD_PESSOA = T.CD_PROFESSOR)'
      'INNER JOIN TB_CURSO C ON (C.CD_CURSO = T.CD_CURSO)')
    object QueryPesquisaCD_TURMA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_TURMA'
      Origin = '"TB_TURMA"."CD_TURMA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaCD_PROFESSOR: TIntegerField
      DisplayLabel = 'Codigo Professor'
      FieldName = 'CD_PROFESSOR'
      Origin = '"TB_TURMA"."CD_PROFESSOR"'
      Required = True
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaDS_DIA: TIBStringField
      DisplayLabel = 'Dia'
      FieldName = 'DS_DIA'
      Origin = '"TB_TURMA"."DS_DIA"'
      Required = True
    end
    object QueryPesquisaDS_PERIODO: TIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'DS_PERIODO'
      Origin = '"TB_TURMA"."DS_PERIODO"'
      Required = True
    end
    object QueryPesquisaCD_CURSO: TIntegerField
      DisplayLabel = 'Codigo Curso'
      FieldName = 'CD_CURSO'
      Origin = '"TB_TURMA"."CD_CURSO"'
      Required = True
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      DisplayLabel = 'Curso'
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_TURMA,'
      '  CD_PROFESSOR,'
      '  DS_DIA,'
      '  DS_PERIODO,'
      '  CD_CURSO,'
      '  PC_FREQ'
      'from TB_TURMA '
      'where'
      '  CD_TURMA = :CD_TURMA')
    ModifySQL.Strings = (
      'update TB_TURMA'
      'set'
      '  CD_TURMA = :CD_TURMA,'
      '  CD_PROFESSOR = :CD_PROFESSOR,'
      '  DS_DIA = :DS_DIA,'
      '  DS_PERIODO = :DS_PERIODO,'
      '  CD_CURSO = :CD_CURSO,'
      '  PC_FREQ = :PC_FREQ'
      'where'
      '  CD_TURMA = :OLD_CD_TURMA')
    InsertSQL.Strings = (
      'insert into TB_TURMA'
      
        '  (CD_TURMA, CD_PROFESSOR, DS_DIA, DS_PERIODO, CD_CURSO, PC_FREQ' +
        ')'
      'values'
      
        '  (:CD_TURMA, :CD_PROFESSOR, :DS_DIA, :DS_PERIODO, :CD_CURSO, :P' +
        'C_FREQ)')
    DeleteSQL.Strings = (
      'delete from TB_TURMA'
      'where'
      '  CD_TURMA = :OLD_CD_TURMA')
  end
end
