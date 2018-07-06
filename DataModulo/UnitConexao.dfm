object CONEXAO: TCONEXAO
  OldCreateOrder = False
  Height = 239
  Width = 261
  object DB: TIBDatabase
    Connected = True
    DatabaseName = 'C:\SisTanuki\Banco\BANCO_TANUKI.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Transaction
    ServerType = 'IBServer'
    Left = 56
    Top = 88
  end
  object Transaction: TIBTransaction
    Active = True
    DefaultDatabase = DB
    Left = 160
    Top = 88
  end
  object Query: TIBQuery
    Database = DB
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 88
    Top = 160
  end
  object Query2: TIBQuery
    Database = DB
    Transaction = Transaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 144
    Top = 160
  end
end
