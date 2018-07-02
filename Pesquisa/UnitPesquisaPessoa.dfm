inherited Form_PesquisaPessoa: TForm_PesquisaPessoa
  Caption = 'Pesquisa Pessoa'
  ClientWidth = 808
  ExplicitWidth = 824
  ExplicitHeight = 649
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
      OnClick = But_ImprimirClick
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
    Active = True
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
  object Dataset_Pessoa: TfrxDBDataset
    UserName = 'Dataset_Pessoa'
    CloseDataSource = False
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 448
    Top = 432
  end
  object Report_Pessoa: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43283.006491574100000000
    ReportOptions.LastChange = 43283.006491574100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 584
    Top = 424
    Datasets = <
      item
        DataSet = Dataset_Pessoa
        DataSetName = 'Dataset_Pessoa'
      end>
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 120.944960000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 85.015770000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'C'#243'd:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 45.354360000000000000
          Top = 85.015770000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 197.756030000000000000
          Top = 85.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Cpf/Cnpj')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 297.803340000000000000
          Top = 85.015770000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Nascto:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 557.590910000000000000
          Top = 85.015770000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
        end
        object Time: TfrxMemoView
          Left = 608.504330000000000000
          Top = 28.236240000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 608.504330000000000000
          Top = 2.000000000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 105.385900000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = -3.779530000000000000
          Top = 7.559060000000000000
          Width = 721.890230000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de pessoas')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 364.055350000000000000
          Top = 85.149660000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 453.661720000000000000
          Top = 84.929190000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Celular:')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Align = baCenter
          Left = 287.244280000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page#]/[TotalPages#]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = Dataset_Pessoa
        DataSetName = 'Dataset_Pessoa'
        RowCount = 0
        object Dataset_AulaExpCD_AULA_EXP: TfrxMemoView
          Top = 3.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'CD_PESSOA'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."CD_PESSOA"]')
          ParentFont = False
        end
        object Dataset_AulaExpNM_PESSOA: TfrxMemoView
          Left = 43.574830000000000000
          Top = 3.779530000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'NM_PESSOA'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."NM_PESSOA"]')
          ParentFont = False
        end
        object Dataset_AulaExpNM_CURSO: TfrxMemoView
          Left = 196.196970000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'NR_CPF_CNPJ'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."NR_CPF_CNPJ"]')
          ParentFont = False
        end
        object Dataset_AulaExpDT_AULA: TfrxMemoView
          Left = 295.685220000000000000
          Top = 3.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'DT_NASCIMENTO'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."DT_NASCIMENTO"]')
          ParentFont = False
        end
        object Dataset_AulaExpDT_CADASTRO: TfrxMemoView
          Left = 558.827150000000000000
          Top = 3.779530000000000000
          Width = 154.960634800000000000
          Height = 18.897650000000000000
          DataField = 'DS_EMAIL'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."DS_EMAIL"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 364.834880000000000000
          Top = 3.779530000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'NR_TELEFONE'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."NR_TELEFONE"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 454.102660000000000000
          Top = 3.779530000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          DataField = 'NR_CELULAR'
          DataSet = Dataset_Pessoa
          DataSetName = 'Dataset_Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Pessoa."NR_CELULAR"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 4.000000000000000000
          Top = 18.000000000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Total de Registros: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 15.338590000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
end
