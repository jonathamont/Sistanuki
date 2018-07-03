inherited Form_PesquisaCidade: TForm_PesquisaCidade
  Caption = 'Pesquisa Cidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox: TGroupBox
    inherited RadioFiltro: TRadioGroup
      Items.Strings = (
        'Codigo'
        'Nome'
        'Estado')
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
      'select * from TB_CIDADE')
    Left = 696
    Top = 136
    object QueryPesquisaCD_CIDADE: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_CIDADE'
      Origin = '"TB_CIDADE"."CD_CIDADE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QueryPesquisaNM_CIDADE: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_CIDADE'
      Origin = '"TB_CIDADE"."NM_CIDADE"'
      Required = True
      Size = 60
    end
    object QueryPesquisaDS_ESTADO: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'DS_ESTADO'
      Origin = '"TB_CIDADE"."DS_ESTADO"'
      Required = True
      Size = 30
    end
    object QueryPesquisaDS_PAIS: TIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'DS_PAIS'
      Origin = '"TB_CIDADE"."DS_PAIS"'
      Required = True
      Size = 50
    end
  end
  inherited DataSourcePesquisa: TDataSource
    Left = 600
    Top = 136
  end
  inherited UpdateCadastro: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CD_CIDADE,'
      '  NM_CIDADE,'
      '  DS_ESTADO,'
      '  DS_PAIS'
      'from TB_CIDADE '
      'where'
      '  CD_CIDADE = :CD_CIDADE')
    ModifySQL.Strings = (
      'update TB_CIDADE'
      'set'
      '  CD_CIDADE = :CD_CIDADE,'
      '  NM_CIDADE = :NM_CIDADE,'
      '  DS_ESTADO = :DS_ESTADO,'
      '  DS_PAIS = :DS_PAIS'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    InsertSQL.Strings = (
      'insert into TB_CIDADE'
      '  (CD_CIDADE, NM_CIDADE, DS_ESTADO, DS_PAIS)'
      'values'
      '  (:CD_CIDADE, :NM_CIDADE, :DS_ESTADO, :DS_PAIS)')
    DeleteSQL.Strings = (
      'delete from TB_CIDADE'
      'where'
      '  CD_CIDADE = :OLD_CD_CIDADE')
    Left = 472
    Top = 144
  end
  object Dataset_Cidades: TfrxDBDataset
    UserName = 'Dataset_Cidades'
    CloseDataSource = False
    DataSet = QueryPesquisa
    BCDToCurrency = False
    Left = 448
    Top = 456
  end
  object Report_Cidades: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43282.919919432900000000
    ReportOptions.LastChange = 43283.997245497700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 552
    Top = 456
    Datasets = <
      item
        DataSet = Dataset_Cidades
        DataSetName = 'Dataset_Cidades'
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
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 217.322975000000000000
          Top = 15.118120000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio das cidades cadastradas')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Left = 634.961040000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
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
        object Time: TfrxMemoView
          Left = 634.961040000000000000
          Top = 37.795300000000000000
          Width = 79.370130000000000000
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
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 294.803340000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Page]/[TotalPages#]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 56.692950000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        Condition = 'Dataset_Cidades."DS_ESTADO"'
        object Shape1: TfrxShapeView
          Left = -2.000000000000000000
          Top = 7.559060000000000000
          Width = 718.110700000000000000
          Height = 20.787401570000000000
          Fill.BackColor = clSilver
          Frame.Color = clSilver
        end
        object Dataset_CidadesDS_ESTADO: TfrxMemoView
          Top = 8.559060000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'DS_ESTADO'
          DataSet = Dataset_Cidades
          DataSetName = 'Dataset_Cidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Dataset_Cidades."DS_ESTADO"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 173.858380000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = -1.220470000000000000
          Top = 49.252010000000000000
          Width = 718.110700000000000000
          Color = clSilver
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object Dataset_CidadesDS_ESTADO1: TfrxMemoView
          Left = 0.110235000000000000
          Top = 3.779530000000000000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          DataSet = Dataset_Cidades
          DataSetName = 'Dataset_Cidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'Total de cidades em  [Dataset_Cidades."DS_ESTADO"]:  [COUNT(Mast' +
              'erData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        DataSet = Dataset_Cidades
        DataSetName = 'Dataset_Cidades'
        RowCount = 0
        object Dataset_CidadesCD_CIDADE: TfrxMemoView
          Top = 3.779530000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'CD_CIDADE'
          DataSet = Dataset_Cidades
          DataSetName = 'Dataset_Cidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Cidades."CD_CIDADE"]')
          ParentFont = False
        end
        object Dataset_CidadesNM_CIDADE: TfrxMemoView
          Left = 173.858380000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NM_CIDADE'
          DataSet = Dataset_Cidades
          DataSetName = 'Dataset_Cidades'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Dataset_Cidades."NM_CIDADE"]')
          ParentFont = False
        end
      end
    end
  end
end
