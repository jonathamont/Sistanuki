object Form_CadastroPadrao: TForm_CadastroPadrao
  Left = 0
  Top = 0
  Caption = 'Cadastro Basico'
  ClientHeight = 463
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object But_Pesquisa: TSpeedButton
    Left = 392
    Top = 27
    Width = 23
    Height = 22
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000555
      55555555008880055555555088CCC880555555508C888C8055555508CCCCCCC8
      05555508CECCCCC805555508CEECCCC8055555508C444C805555555088FFF880
      5555555508FFF80555555555508F805555555555508F805555555555508F8055
      55555555508F8055555555550888880555555555500000555555}
  end
  object GroupBox1: TGroupBox
    Left = 430
    Top = 0
    Width = 89
    Height = 463
    Align = alRight
    TabOrder = 0
    object But_Salvar: TBitBtn
      Left = 13
      Top = 24
      Width = 73
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = But_SalvarClick
    end
    object But_Sair: TBitBtn
      Left = 13
      Top = 55
      Width = 73
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = But_SairClick
    end
  end
  object DataSourceCadastro: TDataSource
    AutoEdit = False
    Left = 456
    Top = 392
  end
end
