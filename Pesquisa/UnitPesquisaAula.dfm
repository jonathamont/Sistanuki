inherited Form_PesquisaAula: TForm_PesquisaAula
  Caption = 'Pesquisa Aula'
  ExplicitWidth = 819
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select a.*,p.nm_pessoa  from TB_AULA a'
      'inner join tb_pessoa p on(p.cd_pessoa = a.cd_prof)'
      'order by a.dt_aula')
    object QueryPesquisaFG_PROF_PRESENT: TIBStringField
      DisplayLabel = 'Prof Presente?'
      FieldName = 'FG_PROF_PRESENT'
      Origin = '"TB_AULA"."FG_PROF_PRESENT"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaFG_ENCERRADA: TIBStringField
      DisplayLabel = 'Encerrada?'
      FieldName = 'FG_ENCERRADA'
      Origin = '"TB_AULA"."FG_ENCERRADA"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaHR_FIM: TTimeField
      DisplayLabel = 'Horario fim'
      FieldName = 'HR_FIM'
      Origin = '"TB_AULA"."HR_FIM"'
      Required = True
    end
    object QueryPesquisaHR_INICIO: TTimeField
      DisplayLabel = 'Horario Inicio'
      FieldName = 'HR_INICIO'
      Origin = '"TB_AULA"."HR_INICIO"'
      Required = True
    end
    object QueryPesquisaDT_AULA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DT_AULA'
      Origin = '"TB_AULA"."DT_AULA"'
      Required = True
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaCD_PROF: TIntegerField
      DisplayLabel = 'Codigo Prof'
      FieldName = 'CD_PROF'
      Origin = '"TB_AULA"."CD_PROF"'
      Required = True
    end
    object QueryPesquisaCD_TURMA: TIntegerField
      DisplayLabel = 'Turma'
      FieldName = 'CD_TURMA'
      Origin = '"TB_AULA"."CD_TURMA"'
      Required = True
    end
    object QueryPesquisaCD_AULA: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_AULA'
      Origin = '"TB_AULA"."CD_AULA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
end
