inherited Form_PesquisaPessoa: TForm_PesquisaPessoa
  Caption = 'Pesquisa Pessoa'
  ClientWidth = 808
  ExplicitWidth = 824
  PixelsPerInch = 96
  TextHeight = 13
  inherited GridPesquisa: TDBGrid
    Top = 81
    Width = 808
    Height = 489
  end
  inherited GroupBox: TGroupBox
    Width = 808
    Height = 81
    ExplicitWidth = 808
    ExplicitHeight = 81
    inherited RadioFiltro: TRadioGroup
      Width = 337
      Height = 53
      Items.Strings = (
        'Codigo'
        'Nome'
        'CPF'
        'Data Nasci.'
        'Funcionario(S/N)'
        'Cidade')
      ExplicitWidth = 337
      ExplicitHeight = 53
    end
    inherited MaskEditPesquisa: TMaskEdit
      Left = 359
      Width = 212
      CharCase = ecNormal
      ExplicitLeft = 359
      ExplicitWidth = 212
    end
    inherited ButPesquisa: TBitBtn
      Left = 586
      OnClick = ButPesquisaClick
      ExplicitLeft = 586
    end
    inherited But_Imprimir: TBitBtn
      Left = 667
      ExplicitLeft = 667
    end
  end
  inherited Panel1: TPanel
    Width = 808
    ExplicitWidth = 808
    inherited But_Alterar: TBitBtn
      OnClick = But_AlterarClick
    end
  end
  inherited But_Novo: TBitBtn
    OnClick = But_NovoClick
  end
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'Select p.*,c.nm_cidade from tb_pessoa p'
      'inner join tb_cidade c on (c.cd_cidade = p.cd_cidade)'
      'order by p.nm_pessoa')
    Left = 688
    object QueryPesquisaCD_PESSOA: TIntegerField
      FieldName = 'CD_PESSOA'
      Origin = '"TB_PESSOA"."CD_PESSOA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaNR_CPF_CNPJ: TIBStringField
      FieldName = 'NR_CPF_CNPJ'
      Origin = '"TB_PESSOA"."NR_CPF_CNPJ"'
      Size = 18
    end
    object QueryPesquisaFG_FISC_JURID: TIBStringField
      FieldName = 'FG_FISC_JURID'
      Origin = '"TB_PESSOA"."FG_FISC_JURID"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaFG_FUNC: TIBStringField
      FieldName = 'FG_FUNC'
      Origin = '"TB_PESSOA"."FG_FUNC"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaFG_SEXO: TIBStringField
      FieldName = 'FG_SEXO'
      Origin = '"TB_PESSOA"."FG_SEXO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = '"TB_PESSOA"."DT_NASCIMENTO"'
      Required = True
    end
    object QueryPesquisaNR_TELEFONE: TIBStringField
      FieldName = 'NR_TELEFONE'
      Origin = '"TB_PESSOA"."NR_TELEFONE"'
      Size = 13
    end
    object QueryPesquisaNR_CELULAR: TIBStringField
      FieldName = 'NR_CELULAR'
      Origin = '"TB_PESSOA"."NR_CELULAR"'
      Size = 14
    end
    object QueryPesquisaDS_EMAIL: TIBStringField
      FieldName = 'DS_EMAIL'
      Origin = '"TB_PESSOA"."DS_EMAIL"'
      Size = 50
    end
    object QueryPesquisaCD_CIDADE: TIntegerField
      FieldName = 'CD_CIDADE'
      Origin = '"TB_PESSOA"."CD_CIDADE"'
      Required = True
    end
    object QueryPesquisaNM_CIDADE: TIBStringField
      FieldName = 'NM_CIDADE'
      Origin = '"TB_CIDADE"."NM_CIDADE"'
      Required = True
      Size = 60
    end
    object QueryPesquisaDS_BAIRRO: TIBStringField
      FieldName = 'DS_BAIRRO'
      Origin = '"TB_PESSOA"."DS_BAIRRO"'
      Required = True
      Size = 50
    end
    object QueryPesquisaDS_RUA: TIBStringField
      FieldName = 'DS_RUA'
      Origin = '"TB_PESSOA"."DS_RUA"'
      Required = True
      Size = 50
    end
  end
  inherited DataSourcePesquisa: TDataSource
    Left = 600
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tb_pessoa '
      'where'
      '  CD_PESSOA = :CD_PESSOA')
    ModifySQL.Strings = (
      'update tb_pessoa'
      'set'
      '  CD_PESSOA = :CD_PESSOA,'
      '  NM_PESSOA = :NM_PESSOA,'
      '  NR_CPF_CNPJ = :NR_CPF_CNPJ,'
      '  FG_FISC_JURID = :FG_FISC_JURID,'
      '  FG_SEXO = :FG_SEXO,'
      '  DT_NASCIMENTO = :DT_NASCIMENTO,'
      '  NR_TELEFONE = :NR_TELEFONE,'
      '  NR_CELULAR = :NR_CELULAR,'
      '  DS_EMAIL = :DS_EMAIL,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  FG_FUNC = :FG_FUNC,'
      '  DS_BAIRRO = :DS_BAIRRO,'
      '  DS_RUA = :DS_RUA'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    InsertSQL.Strings = (
      'insert into tb_pessoa'
      
        '  (CD_PESSOA, NM_PESSOA, NR_CPF_CNPJ, FG_FISC_JURID, FG_SEXO, DT' +
        '_NASCIMENTO, '
      
        '   NR_TELEFONE, NR_CELULAR, DS_EMAIL, CD_CIDADE, FG_FUNC, DS_BAI' +
        'RRO, DS_RUA)'
      'values'
      
        '  (:CD_PESSOA, :NM_PESSOA, :NR_CPF_CNPJ, :FG_FISC_JURID, :FG_SEX' +
        'O, :DT_NASCIMENTO, '
      
        '   :NR_TELEFONE, :NR_CELULAR, :DS_EMAIL, :CD_CIDADE, :FG_FUNC, :' +
        'DS_BAIRRO, '
      '   :DS_RUA)')
    DeleteSQL.Strings = (
      'delete from tb_pessoa'
      'where'
      '  CD_PESSOA = :OLD_CD_PESSOA')
    Left = 496
  end
end
