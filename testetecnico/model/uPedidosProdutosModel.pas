unit uPedidosProdutosModel;

interface

type

  TPedidosProdutos = class
  private

    FAutoincrem: Integer;
    FPedido: Integer;
    FCodProduto: Integer;
    FQuantidade: Integer;
    FValorUnitario: Real;
    FValorTotal: Real;

  public

    property Pedido: Integer read FPedido write FPedido;
    property CodProduto: Integer read FCodProduto write FCodProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property ValorUnitario: Real read FValorUnitario write FValorUnitario;
    property ValorTotal: Real read FValorTotal write FValorTotal;
  end;

implementation

{ TPedidosProdutos }


end.
