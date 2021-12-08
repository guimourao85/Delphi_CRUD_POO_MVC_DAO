object dmPedidos: TdmPedidos
  OldCreateOrder = False
  Height = 254
  Width = 532
  object sqlPesquisarPedidoCab: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      'select '
      '    pedidosdadosgerais.Pedido ,'
      '    pedidosprodutos.CodProduto ,'
      '    produtos.Descricao ,'
      '    pedidosprodutos.Quantidade ,'
      '    pedidosprodutos.ValorUnitario ,'
      '    pedidosprodutos.ValorTotal '
      '    '
      'from'
      '    pedidosdadosgerais '
      
        '    inner join pedidosprodutos on (pedidosprodutos.Pedido = pedi' +
        'dosdadosgerais.Pedido)'
      
        '    inner join produtos on (produtos.CodProduto = Pedidosproduto' +
        's.CodProduto)'
      '    '
      'where    '
      '    pedidosdadosgerais.Pedido  = :pPedido')
    Left = 53
    Top = 33
    ParamData = <
      item
        Name = 'PPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlInserirPedidoCab: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      
        'INSERT INTO pedidosdadosgerais (Pedido, DtEmissao, CodCliente, V' +
        'alorTotal)'
      'VALUES (:Pedido, :DtEmissao, :CodCliente, :ValorTotal)')
    Left = 168
    Top = 32
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DTEMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALORTOTAL'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlAlterarPedidoCab: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      'UPDATE pedidosdadosgerais '
      'SET DtEmissao  = :DtEmissao'
      '    CodCLiente = :CodCLiente'
      '    ValorTotal = :ValorTotal'
      'WHERE  Pedido = :pPedido')
    Left = 288
    Top = 32
    ParamData = <
      item
        Name = 'DTEMISSAO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALORTOTAL'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlExcluirPedidoCab: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      'DELETE FROM pedidosdadosgerais'
      'WHERE pedidosdadosgerais.Pedido = :pPedido')
    Left = 400
    Top = 32
    ParamData = <
      item
        Name = 'PPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisarPedidoCab
    Left = 52
    Top = 95
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PPEDIDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 53
    Top = 159
    object cdsPesquisarPedido: TIntegerField
      FieldName = 'Pedido'
      Required = True
    end
    object cdsPesquisarCodProduto: TIntegerField
      FieldName = 'CodProduto'
      ReadOnly = True
    end
    object cdsPesquisarDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 50
    end
    object cdsPesquisarQuantidade: TFloatField
      FieldName = 'Quantidade'
      ReadOnly = True
    end
    object cdsPesquisarValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      ReadOnly = True
    end
    object cdsPesquisarValorTotal: TFloatField
      FieldName = 'ValorTotal'
      ReadOnly = True
    end
  end
end
