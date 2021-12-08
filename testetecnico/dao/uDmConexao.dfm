object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 355
  Width = 537
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=testetecnico'
      'User_Name=root'
      'Password=1234'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\guilh\Documents\libmysql.dll'
    Left = 80
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 144
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 80
    Top = 200
  end
end
