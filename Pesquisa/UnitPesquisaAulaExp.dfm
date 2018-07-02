inherited Form_PesquisaAulaExp: TForm_PesquisaAulaExp
  Caption = 'Pesquisa de Aulas Esperimentais'
  ExplicitWidth = 819
  ExplicitHeight = 649
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox: TGroupBox
    inherited RadioFiltro: TRadioGroup
      ItemIndex = 0
    end
    inherited ButPesquisa: TBitBtn
      OnClick = ButPesquisaClick
    end
    inherited But_Imprimir: TBitBtn
      OnClick = But_ImprimirClick
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
    Active = True
    SQL.Strings = (
      'select ae.*, p.nm_pessoa, c.nm_curso from tb_aula_exp ae'
      'inner join tb_pessoa p on (p.cd_pessoa = ae.cd_pessoa)'
      'inner join tb_curso c on (c.cd_curso = ae.cd_curso)'
      'order by p.nm_pessoa')
    object QueryPesquisaCD_AULA_EXP: TIntegerField
      DisplayLabel = 'Cod Aula'
      DisplayWidth = 7
      FieldName = 'CD_AULA_EXP'
      Origin = '"TB_AULA_EXP"."CD_AULA_EXP"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaCD_PESSOA: TIntegerField
      DisplayLabel = 'cod Pessoa'
      DisplayWidth = 7
      FieldName = 'CD_PESSOA'
      Origin = '"TB_AULA_EXP"."CD_PESSOA"'
      Required = True
    end
    object QueryPesquisaNM_PESSOA: TIBStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NM_PESSOA'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaCD_CURSO: TIntegerField
      DisplayLabel = 'Curso'
      DisplayWidth = 7
      FieldName = 'CD_CURSO'
      Origin = '"TB_AULA_EXP"."CD_CURSO"'
      Required = True
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
    object QueryPesquisaDT_AULA: TDateField
      DisplayLabel = 'Data aula'
      DisplayWidth = 12
      FieldName = 'DT_AULA'
      Origin = '"TB_AULA_EXP"."DT_AULA"'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QueryPesquisaDT_CADASTRO: TDateField
      DisplayLabel = 'Data cadastro'
      DisplayWidth = 12
      FieldName = 'DT_CADASTRO'
      Origin = '"TB_AULA_EXP"."DT_CADASTRO"'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QueryPesquisaDS_INF: TIBStringField
      DisplayLabel = 'Informa'#231#245'es'
      DisplayWidth = 30
      FieldName = 'DS_INF'
      Origin = '"TB_AULA_EXP"."DS_INF"'
      Size = 300
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
  object Dataset_AulasExp: TfrxDBDataset
    UserName = 'Dataset_AulaExp'
    CloseDataSource = False
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 328
    Top = 448
  end
  object Report_AulaExp: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43282.896268113400000000
    ReportOptions.LastChange = 43282.900075729200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 496
    Top = 448
    Datasets = <
      item
        DataSet = Dataset_AulasExp
        DataSetName = 'Dataset_AulaExp'
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
          Width = 56.692950000000000000
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
          Left = 75.590600000000000000
          Top = 85.015770000000000000
          Width = 200.315090000000000000
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
          Left = 296.023810000000000000
          Top = 85.015770000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Curso:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 509.457020000000000000
          Top = 85.015770000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Data aula:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Top = 85.015770000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Data cadastro:')
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
            'Relat'#243'rio de Aulas experimentais')
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
        DataSet = Dataset_AulasExp
        DataSetName = 'Dataset_AulaExp'
        RowCount = 0
        object Dataset_AulaExpCD_AULA_EXP: TfrxMemoView
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'CD_AULA_EXP'
          DataSet = Dataset_AulasExp
          DataSetName = 'Dataset_AulaExp'
          Memo.UTF8W = (
            '[Dataset_AulaExp."CD_AULA_EXP"]')
        end
        object Dataset_AulaExpNM_PESSOA: TfrxMemoView
          Left = 73.811070000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'NM_PESSOA'
          DataSet = Dataset_AulasExp
          DataSetName = 'Dataset_AulaExp'
          Memo.UTF8W = (
            '[Dataset_AulaExp."NM_PESSOA"]')
        end
        object Dataset_AulaExpNM_CURSO: TfrxMemoView
          Left = 292.464750000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'NM_CURSO'
          DataSet = Dataset_AulasExp
          DataSetName = 'Dataset_AulaExp'
          Memo.UTF8W = (
            '[Dataset_AulaExp."NM_CURSO"]')
        end
        object Dataset_AulaExpDT_AULA: TfrxMemoView
          Left = 512.118430000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DT_AULA'
          DataSet = Dataset_AulasExp
          DataSetName = 'Dataset_AulaExp'
          Memo.UTF8W = (
            '[Dataset_AulaExp."DT_AULA"]')
        end
        object Dataset_AulaExpDT_CADASTRO: TfrxMemoView
          Left = 623.622450000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DT_CADASTRO'
          DataSet = Dataset_AulasExp
          DataSetName = 'Dataset_AulaExp'
          Memo.UTF8W = (
            '[Dataset_AulaExp."DT_CADASTRO"]')
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
