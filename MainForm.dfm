object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Backup BD'
  ClientHeight = 339
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 80
    Width = 24
    Height = 13
    Caption = 'Local'
  end
  object Label2: TLabel
    Left = 24
    Top = 126
    Width = 36
    Height = 13
    Caption = 'Destino'
  end
  object Label3: TLabel
    Left = 24
    Top = 27
    Width = 92
    Height = 13
    Caption = 'C'#243'digo da Empresa'
  end
  object BTGeraBack: TButton
    Left = 41
    Top = 388
    Width = 75
    Height = 25
    Caption = 'Gerar Backup'
    TabOrder = 0
    OnClick = BTGeraBackClick
  end
  object btCopy: TBitBtn
    Left = 487
    Top = 97
    Width = 98
    Height = 209
    Caption = 'Copiar Banco'
    TabOrder = 1
    OnClick = btCopyClick
  end
  object edDestino: TEdit
    Left = 24
    Top = 145
    Width = 393
    Height = 21
    Color = clGrayText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = 'D:\Projetos\2021\BackupBanco'
  end
  object edLocal: TEdit
    Left = 24
    Top = 99
    Width = 393
    Height = 21
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 24
    Top = 171
    Width = 457
    Height = 137
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object btLocal: TButton
    Left = 423
    Top = 97
    Width = 58
    Height = 25
    Caption = 'Local'
    TabOrder = 5
    OnClick = btLocalClick
  end
  object btDestino: TButton
    Left = 423
    Top = 140
    Width = 58
    Height = 25
    Caption = 'Destino'
    Enabled = False
    TabOrder = 6
    OnClick = btDestinoClick
  end
  object edCod: TEdit
    Left = 24
    Top = 46
    Width = 75
    Height = 21
    TabOrder = 7
  end
  object GeraTabuada: TGroupBox
    Left = 320
    Top = 10
    Width = 265
    Height = 81
    Caption = 'GroupBox1'
    TabOrder = 8
    object Label4: TLabel
      Left = 14
      Top = 17
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object edNumero: TEdit
      Left = 14
      Top = 36
      Width = 67
      Height = 21
      TabOrder = 0
    end
    object btGerarArquivos: TButton
      Left = 116
      Top = 40
      Width = 98
      Height = 25
      Caption = 'Cria Arquivos '
      TabOrder = 1
      OnClick = btGerarArquivosClick
    end
  end
  object IBBackupService1: TIBBackupService
    TraceFlags = []
    ServerType = 'IBServer'
    BlockingFactor = 0
    Options = []
    PreAllocate = 0
    Left = 272
    Top = 400
  end
  object DBconexao: TFDConnection
    Params.Strings = (
      'Database=C:\app1\BD-OS_Diversos3.0\001.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 363
    Top = 400
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'FDB'
    Filter = '|*'
    InitialDir = 'C:\app1\BD-OS_Diversos3.0'
    Left = 416
    Top = 208
  end
end
