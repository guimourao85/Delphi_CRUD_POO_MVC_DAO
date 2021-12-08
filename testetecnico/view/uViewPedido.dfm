object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'frmPedidos - Pedido de Vendas'
  ClientHeight = 700
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1038
    Height = 58
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 416
      Top = 16
      Width = 163
      Height = 19
      Caption = 'PEDIDO DE VENDAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pCentral: TPanel
    Left = 0
    Top = 58
    Width = 1038
    Height = 519
    Align = alTop
    TabOrder = 1
    ExplicitTop = 52
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Pedido'
    end
    object Label3: TLabel
      Left = 90
      Top = 72
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 52
      Height = 13
      Caption = 'Dt Emiss'#227'o'
    end
    object Label5: TLabel
      Left = 8
      Top = 144
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label6: TLabel
      Left = 352
      Top = 144
      Width = 24
      Height = 13
      Caption = 'Qtde'
    end
    object Label7: TLabel
      Left = 432
      Top = 144
      Width = 64
      Height = 13
      Caption = 'Valor Unit'#225'rio'
    end
    object Label8: TLabel
      Left = 511
      Top = 144
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object edPedido: TEdit
      Left = 8
      Top = 38
      Width = 76
      Height = 21
      TabStop = False
      Color = 16774111
      ReadOnly = True
      TabOrder = 9
      Text = 'edPedido'
    end
    object edCodCliente: TEdit
      Left = 90
      Top = 87
      Width = 59
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
      OnExit = edCodClienteExit
    end
    object edNomeCliente: TEdit
      Left = 152
      Top = 87
      Width = 224
      Height = 21
      TabStop = False
      Color = 16774111
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit1'
    end
    object edCodProduto: TEdit
      Left = 8
      Top = 159
      Width = 76
      Height = 21
      TabOrder = 2
      Text = 'edCodProduto'
      OnExit = edCodProdutoExit
    end
    object edDescProduto: TEdit
      Left = 90
      Top = 159
      Width = 224
      Height = 21
      TabStop = False
      Color = 16774111
      ReadOnly = True
      TabOrder = 3
      Text = 'Edit1'
    end
    object edQtde: TEdit
      Left = 352
      Top = 159
      Width = 76
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
    end
    object edValorUnitario: TEdit
      Left = 434
      Top = 159
      Width = 76
      Height = 21
      TabOrder = 5
      Text = 'Edit1'
    end
    object edValorTotal: TEdit
      Left = 512
      Top = 159
      Width = 76
      Height = 21
      TabOrder = 6
      Text = 'Edit1'
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 186
      Width = 1017
      Height = 289
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = 'C'#243'd.Produto'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Descri'#231#227'o'
          Width = 233
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Qtde'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'Valor Total'
          Width = 115
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 920
      Top = 159
      Width = 105
      Height = 25
      Caption = '&Inserir'
      TabOrder = 8
    end
    object edDtEmissao: TMaskEdit
      Left = 8
      Top = 87
      Width = 76
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 10
      Text = '  /  /    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 577
    Width = 1038
    Height = 48
    Align = alTop
    TabOrder = 2
    object Label9: TLabel
      Left = 809
      Top = 16
      Width = 129
      Height = 19
      Caption = 'Total do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotPedido: TLabel
      Left = 950
      Top = 16
      Width = 70
      Height = 19
      Caption = '9.999,99'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 625
    Width = 1038
    Height = 72
    Align = alTop
    TabOrder = 3
    OnClick = Panel3Click
    object btGravarPedido: TBitBtn
      Left = 811
      Top = 6
      Width = 106
      Height = 58
      Caption = '&Gravar Pedido'
      TabOrder = 0
      OnClick = btGravarPedidoClick
    end
    object btConsultarPedido: TBitBtn
      Left = 10
      Top = 6
      Width = 113
      Height = 58
      Caption = '&Consultar Pedido'
      TabOrder = 1
      OnClick = btConsultarPedidoClick
    end
    object btExcluirPedido: TBitBtn
      Left = 122
      Top = 6
      Width = 113
      Height = 58
      Caption = '&Excluir Pedido'
      TabOrder = 2
      OnClick = btExcluirPedidoClick
    end
    object btCancelarPedido: TBitBtn
      Left = 919
      Top = 6
      Width = 106
      Height = 58
      Caption = '&Fechar'
      TabOrder = 3
      OnClick = btCancelarPedidoClick
    end
  end
  object dsPesquisa: TDataSource
    Left = 48
    Top = 290
  end
end
