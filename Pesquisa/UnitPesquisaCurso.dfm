inherited Form_PesquisaCurso: TForm_PesquisaCurso
  Caption = 'Pesquisa Curso'
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
    Active = True
    SQL.Strings = (
      'select * from TB_CURSO')
    Left = 688
    object QueryPesquisaCD_CURSO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_CURSO'
      Origin = '"TB_CURSO"."CD_CURSO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      DisplayLabel = 'Curso'
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
    object QueryPesquisaNR_HORAS: TIBBCDField
      DisplayLabel = 'Numero De Horas'
      FieldName = 'NR_HORAS'
      Origin = '"TB_CURSO"."NR_HORAS"'
      Required = True
      Precision = 9
      Size = 2
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
  object Dataset_Curso: TfrxDBDataset
    UserName = 'Dataset_Curso'
    CloseDataSource = False
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 512
    Top = 440
  end
  object Report_Curso: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43282.966229942100000000
    ReportOptions.LastChange = 43283.997551782400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 616
    Top = 440
    Datasets = <
      item
        DataSet = Dataset_Curso
        DataSetName = 'Dataset_Curso'
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
            'Total de horas:')
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
            'Relat'#243'rio de Cursos')
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
        DataSet = Dataset_Curso
        DataSetName = 'Dataset_Curso'
        RowCount = 0
        object Dataset_AulaExpCD_AULA_EXP: TfrxMemoView
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'CD_CURSO'
          DataSet = Dataset_Curso
          DataSetName = 'Dataset_Curso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Curso."CD_CURSO"]')
          ParentFont = False
        end
        object Dataset_AulaExpNM_PESSOA: TfrxMemoView
          Left = 73.811070000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'NM_CURSO'
          DataSet = Dataset_Curso
          DataSetName = 'Dataset_Curso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Curso."NM_CURSO"]')
          ParentFont = False
        end
        object Dataset_AulaExpDT_CADASTRO: TfrxMemoView
          Left = 623.622450000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'NR_HORAS'
          DataSet = Dataset_Curso
          DataSetName = 'Dataset_Curso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Curso."NR_HORAS"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 2.000000000000000000
          Top = 21.000000000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Total de Cursos: [COUNT(MasterData1)]')
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
