inherited Form_PesquisaTurma: TForm_PesquisaTurma
  Caption = 'Pesquisa Turmas'
  ExplicitWidth = 819
  ExplicitHeight = 649
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox: TGroupBox
    inherited RadioFiltro: TRadioGroup
      Items.Strings = (
        'Codigo'
        'Professor'
        'Dia'
        'Periodo'
        'Curso')
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
  object Dataset_Turma: TfrxDBDataset
    UserName = 'Dataset_Turma'
    CloseDataSource = False
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 376
    Top = 440
  end
  object Report_Turma: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43283.030965578700000000
    ReportOptions.LastChange = 43283.045401006940000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 568
    Top = 440
    Datasets = <
      item
        DataSet = Dataset_Turma
        DataSetName = 'Dataset_Turma'
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
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Turma:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Top = 85.015770000000000000
          Width = 204.094620000000000000
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
        object Memo3: TfrxMemoView
          Left = 314.921460000000000000
          Top = 85.015770000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Professor:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 600.165740000000000000
          Top = 85.015770000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Per'#237'odo:')
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
            'Relat'#243'rio de turmas')
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
        DataSet = Dataset_Turma
        DataSetName = 'Dataset_Turma'
        RowCount = 0
        object Dataset_AulaExpCD_AULA_EXP: TfrxMemoView
          Top = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'CD_TURMA'
          DataSet = Dataset_Turma
          DataSetName = 'Dataset_Turma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Turma."CD_TURMA"]')
          ParentFont = False
        end
        object Dataset_AulaExpNM_PESSOA: TfrxMemoView
          Left = 81.370130000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'NM_CURSO'
          DataSet = Dataset_Turma
          DataSetName = 'Dataset_Turma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Turma."NM_CURSO"]')
          ParentFont = False
        end
        object Dataset_AulaExpNM_CURSO: TfrxMemoView
          Left = 313.362400000000000000
          Top = 3.779530000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'NM_PESSOA'
          DataSet = Dataset_Turma
          DataSetName = 'Dataset_Turma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Turma."NM_PESSOA"]')
          ParentFont = False
        end
        object Dataset_AulaExpDT_AULA: TfrxMemoView
          Left = 598.047620000000000000
          Top = 3.559060000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'DS_PERIODO'
          DataSet = Dataset_Turma
          DataSetName = 'Dataset_Turma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Turma."DS_PERIODO"]')
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
