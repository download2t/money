object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 328
  Width = 354
  object conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\mathe\OneDrive\'#193'rea de Trabalho\Financeiro\DB\' +
        'banco.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
end
