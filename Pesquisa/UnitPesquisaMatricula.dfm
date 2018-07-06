inherited Form_PesquisaMatricula: TForm_PesquisaMatricula
  Caption = 'Pesquisa Matricula'
  ClientHeight = 568
  ClientWidth = 807
  ExplicitWidth = 823
  ExplicitHeight = 607
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 280
    Top = 248
    Width = 43
    Height = 13
    Caption = 'Matr'#237'cula'
  end
  object Label2: TLabel [1]
    Left = 280
    Top = 440
    Width = 23
    Height = 13
    Caption = 'C'#243'd.'
  end
  object Label3: TLabel [2]
    Left = 280
    Top = 632
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label4: TLabel [3]
    Left = 280
    Top = 824
    Width = 56
    Height = 13
    Caption = 'C'#243'd. Turma'
  end
  object Label5: TLabel [4]
    Left = 280
    Top = 1016
    Width = 28
    Height = 13
    Caption = 'Curso'
  end
  object Label6: TLabel [5]
    Left = 280
    Top = 1208
    Width = 69
    Height = 13
    Caption = 'Data Matricula'
  end
  inherited GridPesquisa: TDBGrid
    Width = 807
    Height = 452
  end
  inherited GroupBox: TGroupBox
    Width = 807
    ExplicitWidth = 807
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
    Top = 527
    Width = 807
    ExplicitTop = 527
    ExplicitWidth = 807
    inherited But_Alterar: TBitBtn
      Top = 6
      OnClick = But_AlterarClick
      ExplicitTop = 6
    end
    object Btn_Novo: TBitBtn
      Left = 24
      Top = 8
      Width = 71
      Height = 25
      Caption = 'Novo'
      TabOrder = 3
      OnClick = Btn_NovoClick
    end
  end
  inherited QueryPesquisa: TIBQuery
    SQL.Strings = (
      'select m.*, p.nm_pessoa p, c.nm_curso from tb_matricula m'
      'inner join tb_pessoa p on (p.cd_pessoa = m.cd_pessoa)'
      'inner join tb_turma t on (t.cd_turma = m.cd_turma)'
      'inner join tb_curso c on (c.cd_curso = t.cd_curso)'
      'order by p.nm_pessoa')
    object QueryPesquisaCD_MATRICULA: TIntegerField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'CD_MATRICULA'
      Origin = '"TB_MATRICULA"."CD_MATRICULA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaCD_PESSOA: TIntegerField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_PESSOA'
      Origin = '"TB_MATRICULA"."CD_PESSOA"'
      Required = True
    end
    object QueryPesquisaP: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'P'
      Origin = '"TB_PESSOA"."NM_PESSOA"'
      Required = True
      Size = 50
    end
    object QueryPesquisaCD_TURMA: TIntegerField
      DisplayLabel = 'C'#243'd. Turma'
      FieldName = 'CD_TURMA'
      Origin = '"TB_MATRICULA"."CD_TURMA"'
      Required = True
    end
    object QueryPesquisaNM_CURSO: TIBStringField
      DisplayLabel = 'Curso'
      FieldName = 'NM_CURSO'
      Origin = '"TB_CURSO"."NM_CURSO"'
      Size = 50
    end
    object QueryPesquisaDT_MATRICULA: TDateField
      DisplayLabel = 'Data Matricula'
      FieldName = 'DT_MATRICULA'
      Origin = '"TB_MATRICULA"."DT_MATRICULA"'
      Required = True
      EditMask = '## /##/####;1;_'
    end
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      'from tb_matricula '
      'where'
      '  CD_MATRICULA = :CD_MATRICULA')
    ModifySQL.Strings = (
      'update tb_matricula'
      'set'
      '  CD_MATRICULA = :CD_MATRICULA,'
      '  CD_PESSOA = :CD_PESSOA,'
      '  CD_TURMA = :CD_TURMA,'
      '  DT_MATRICULA = :DT_MATRICULA'
      'where'
      '  CD_MATRICULA = :OLD_CD_MATRICULA')
    InsertSQL.Strings = (
      'insert into tb_matricula'
      '  (CD_MATRICULA, CD_PESSOA, CD_TURMA, DT_MATRICULA)'
      'values'
      '  (:CD_MATRICULA, :CD_PESSOA, :CD_TURMA, :DT_MATRICULA)')
    DeleteSQL.Strings = (
      'delete from tb_matricula'
      'where'
      '  CD_MATRICULA = :OLD_CD_MATRICULA')
  end
  object Dataset_Matricula: TfrxDBDataset
    UserName = 'Dataset_Matricula'
    CloseDataSource = False
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 472
    Top = 424
  end
  object Report_Matricula: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43282.982140381900000000
    ReportOptions.LastChange = 43282.982140381900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 560
    Top = 424
    Datasets = <
      item
        DataSet = Dataset_Matricula
        DataSetName = 'Dataset_Matricula'
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
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Matr'#237'cula:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 75.590600000000000000
          Top = 85.015770000000000000
          Width = 222.992270000000000000
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
          Left = 311.141930000000000000
          Top = 85.015770000000000000
          Width = 200.315090000000000000
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
          Left = 524.795610000000000000
          Top = 85.015770000000000000
          Width = 79.370130000000000000
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
        object Memo5: TfrxMemoView
          Left = 616.063390000000000000
          Top = 85.015770000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Memo.UTF8W = (
            'Data matr'#237'cula:')
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
            'Relat'#243'rio de Matr'#237'culas')
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
        DataSet = Dataset_Matricula
        DataSetName = 'Dataset_Matricula'
        RowCount = 0
        object Dataset_AulaExpCD_AULA_EXP: TfrxMemoView
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'CD_MATRICULA'
          DataSet = Dataset_Matricula
          DataSetName = 'Dataset_Matricula'
          Memo.UTF8W = (
            '[Dataset_Matricula."CD_MATRICULA"]')
        end
        object Dataset_AulaExpNM_PESSOA: TfrxMemoView
          Left = 73.811070000000000000
          Top = 3.779530000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DataField = 'P'
          DataSet = Dataset_Matricula
          DataSetName = 'Dataset_Matricula'
          Memo.UTF8W = (
            '[Dataset_Matricula."P"]')
        end
        object Dataset_AulaExpNM_CURSO: TfrxMemoView
          Left = 311.141930000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'NM_CURSO'
          DataSet = Dataset_Matricula
          DataSetName = 'Dataset_Matricula'
          Memo.UTF8W = (
            '[Dataset_Matricula."NM_CURSO"]')
        end
        object Dataset_AulaExpDT_AULA: TfrxMemoView
          Left = 527.236550000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'CD_TURMA'
          DataSet = Dataset_Matricula
          DataSetName = 'Dataset_Matricula'
          Memo.UTF8W = (
            '[Dataset_Matricula."CD_TURMA"]')
        end
        object Dataset_AulaExpDT_CADASTRO: TfrxMemoView
          Left = 613.842920000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'DT_MATRICULA'
          DataSet = Dataset_Matricula
          DataSetName = 'Dataset_Matricula'
          Memo.UTF8W = (
            '[Dataset_Matricula."DT_MATRICULA"]')
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
