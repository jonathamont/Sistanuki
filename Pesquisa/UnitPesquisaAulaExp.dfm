inherited Form_PesquisaAulaExp: TForm_PesquisaAulaExp
  Caption = 'Pesquisa de Aulas Esperimentais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select ae.*, p.nm_pessoa, c.nm_curso from tb_aula_exp ae'
      'inner join tb_pessoa p on (p.cd_pessoa = ae.cd_pessoa)'
      'inner join tb_curso c on (c.cd_curso = ae.cd_curso)'
      'order by p.nm_pessoa')
    object QueryPesquisaCD_AULA_EXP: TIntegerField
      FieldName = 'CD_AULA_EXP'
      Origin = '"TB_AULA_EXP"."CD_AULA_EXP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = '"TB_AULA_EXP"."CD_PESSOA"'
      Required = True
    end
    object QueryPesquisaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Origin = '"TB_AULA_EXP"."DT_CADASTRO"'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QueryPesquisaDT_AULA: TDateField
      FieldName = 'DT_AULA'
      Origin = '"TB_AULA_EXP"."DT_AULA"'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QueryPesquisaCD_CURSO: TIntegerField
      FieldName = 'CD_CURSO'
      Origin = '"TB_AULA_EXP"."CD_CURSO"'
      Required = True
    end
    object QueryPesquisaDS_INF: TIBStringField
      FieldName = 'DS_INF'
      Origin = '"TB_AULA_EXP"."DS_INF"'
      Size = 300
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tb_aula_exp '
      'where'
      '  CD_AULA_EXP = :CD_AULA_EXP')
    ModifySQL.Strings = (
      'update tb_aula_exp'
      'set'
      '  CD_AULA_EXP = :CD_AULA_EXP,'
      '  CD_PESSOA = :CD_PESSOA,'
      '  DT_CADASTRO = :DT_CADASTRO,'
      '  DT_AULA = :DT_AULA,'
      '  CD_CURSO = :CD_CURSO,'
      '  DS_INF = :DS_INF'
      'where'
      '  CD_AULA_EXP = :OLD_CD_AULA_EXP')
    InsertSQL.Strings = (
      'insert into tb_aula_exp'
      
        '  (CD_AULA_EXP, CD_PESSOA, DT_CADASTRO, DT_AULA, CD_CURSO, DS_IN' +
        'F)'
      'values'
      
        '  (:CD_AULA_EXP, :CD_PESSOA, :DT_CADASTRO, :DT_AULA, :CD_CURSO, ' +
        ':DS_INF)')
    DeleteSQL.Strings = (
      'delete from tb_aula_exp'
      'where'
      '  CD_AULA_EXP = :OLD_CD_AULA_EXP')
  end
end
