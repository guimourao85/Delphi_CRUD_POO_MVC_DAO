object dmPedidosProdutos: TdmPedidosProdutos
  OldCreateOrder = False
  Height = 340
  Width = 814
  object sqlPesquisarPedidoItens: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      'select '
      '    pedidosprodutos.Pedido ,'
      '    pedidosprodutos.CodProduto ,'
      '    produtos.Descricao ,'
      '    pedidosprodutos.Quantidade ,'
      '    pedidosprodutos.ValorUnitario ,'
      '    pedidosprodutos.ValorTotal '
      '    '
      'from'
      '    pedidosprodutos '
      
        '    inner join produtos on (produtos.CodProduto = Pedidosproduto' +
        's.CodProduto)'
      '    '
      'where    '
      '    pedidosprodutos.Pedido  = :pPedido')
    Left = 61
    Top = 33
    ParamData = <
      item
        Name = 'PPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlInserirPedidoItens: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      
        'INSERT INTO pedidosprodutos (Pedido, CodProduto, Quantidade, Val' +
        'orUnitario, ValorTotal)'
      
        'VALUES (:Pedido, :CodProduto, :Quantidade, :ValorUnitario, :Valo' +
        'rTotal)')
    Left = 200
    Top = 32
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODPRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALORUNITARIO'
        DataType = ftFloat
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
  object sqlAlterarPedidoItens: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      'UPDATE pedidosprodutos '
      'SET Pedido  = :Pedido'
      '    CodProduto = :CodProduto'
      '    Quantidade = :Quantidade'
      '    ValorUnitario = :ValorUnitario'
      '    ValorTotal = :ValorTotal'
      'WHERE  Pedido = :pPedido')
    Left = 328
    Top = 32
    ParamData = <
      item
        Name = 'PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODPRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALORUNITARIO'
        DataType = ftFloat
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
  object sqlExcluirPedidoItens: TFDQuery
    Connection = dmConexao.FDConnection1
    SQL.Strings = (
      'DELETE FROM pedidosdadosgerais'
      'WHERE pedidosdadosgerais.Pedido = :pPedido')
    Left = 448
    Top = 32
    ParamData = <
      item
        Name = 'PPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
