inherited Form_PesquisaPessoa: TForm_PesquisaPessoa
  Caption = 'Pesquisa Pessoa'
  ClientWidth = 808
<<<<<<< HEAD
=======
  ExplicitLeft = -37
>>>>>>> bcfd8aa68dba10880080f6762371782f7666b99e
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
      DisplayLabel = 'Codigo'
      FieldName = 'CD_PESSOA'
      Origin = '"TB_PESSOA"."CD_PESSOA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaNR_CPF_CNPJ: TIBStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'NR_CPF_CNPJ'
      Origin = '"TB_PESSOA"."NR_CPF_CNPJ"'
      Size = 18
    end
    object QueryPesquisaFG_FISC_JURID: TIBStringField
      DisplayLabel = 'Fisica/Juridica'
      FieldName = 'FG_FISC_JURID'
      Origin = '"TB_PESSOA"."FG_FISC_JURID"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaFG_FUNC: TIBStringField
      DisplayLabel = 'Funcionario'
      FieldName = 'FG_FUNC'
      Origin = '"TB_PESSOA"."FG_FUNC"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaFG_SEXO: TIBStringField
      DisplayLabel = 'Sexo'
      FieldName = 'FG_SEXO'
      Origin = '"TB_PESSOA"."FG_SEXO"'
      Required = True
      FixedChar = True
      Size = 1
    end
    object QueryPesquisaDT_NASCIMENTO: TDateField
      DisplayLabel = 'Data Naciento'
      FieldName = 'DT_NASCIMENTO'
      Origin = '"TB_PESSOA"."DT_NASCIMENTO"'
      Required = True
    end
    object QueryPesquisaNR_TELEFONE: TIBStringField
      DisplayLabel = 'Telefone'
      FieldName = 'NR_TELEFONE'
      Origin = '"TB_PESSOA"."NR_TELEFONE"'
      Size = 13
    end
    object QueryPesquisaNR_CELULAR: TIBStringField
      DisplayLabel = 'Celular'
      FieldName = 'NR_CELULAR'
      Origin = '"TB_PESSOA"."NR_CELULAR"'
      Size = 14
    end
    object QueryPesquisaDS_EMAIL: TIBStringField
      DisplayLabel = 'Email'
      FieldName = 'DS_EMAIL'
      Origin = '"TB_PESSOA"."DS_EMAIL"'
      Size = 50
    end
    object QueryPesquisaCD_CIDADE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_CIDADE'
      Origin = '"TB_PESSOA"."CD_CIDADE"'
      Required = True
    end
    object QueryPesquisaNM_CIDADE: TIBStringField
      DisplayLabel = 'Nome Cidade'
      FieldName = 'NM_CIDADE'
      Origin = '"TB_CIDADE"."NM_CIDADE"'
      Required = True
      Size = 60
    end
    object QueryPesquisaDS_BAIRRO: TIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'DS_BAIRRO'
      Origin = '"TB_PESSOA"."DS_BAIRRO"'
      Required = True
      Size = 50
    end
    object QueryPesquisaDS_RUA: TIBStringField
      DisplayLabel = 'Rua'
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
  object ReportPessoa: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43238.903823263890000000
    ReportOptions.LastChange = 43238.903823263890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 536
    Top = 256
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 26.456710000000000000
          Top = 11.338590000000000000
          Width = 525.354670000000000000
          Height = 11.338590000000000000
        end
      end
    end
  end
  object DatasetPessoa: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CD_PESSOA=CD_PESSOA'
      'NM_PESSOA=NM_PESSOA'
      'NR_CPF_CNPJ=NR_CPF_CNPJ'
      'FG_FISC_JURID=FG_FISC_JURID'
      'FG_FUNC=FG_FUNC'
      '-FG_SEXO=FG_SEXO'
      'DT_NASCIMENTO=DT_NASCIMENTO'
      'NR_TELEFONE=NR_TELEFONE'
      'NR_CELULAR=NR_CELULAR'
      'DS_EMAIL=DS_EMAIL'
      '-CD_CIDADE=CD_CIDADE'
      'NM_CIDADE=NM_CIDADE'
      '-DS_BAIRRO=DS_BAIRRO'
      '-DS_RUA=DS_RUA')
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 616
    Top = 264
  end
end
