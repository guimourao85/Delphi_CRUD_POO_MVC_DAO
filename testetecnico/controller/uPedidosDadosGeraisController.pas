unit uPedidosDadosGeraisController;

interface

uses
  uPedidosDadosGeraisModel,  uDmPedidos, System.SysUtils;

type
  TPedidosDadosGeraisController = class
  public
    constructor Create;
    destructor  Destroy; override;
    function    InserirPedido(oPedidosDadosGerais: TPedidosDadosGerais; var sErro: String): Boolean;
    function    AlterarPedido(oPedidosDadosGerais: TPedidosDadosGerais; var sErro: String): Boolean;
    function    ExcluirPedido(pPedido: Integer; var sErro: String): Boolean;
    procedure   CarregarPedido(oPedidosDadosGerais: TPedidosDadosGerais; pCodigo: Integer);
    procedure   Pesquisar(pPedido: Integer);
    function    RetornaNomeCliente(pCodCliente: Integer): String;
    function    RetornaDescricaoProduto(pCodProduto: Integer): String;
  end;

implementation


{ TClienteController }

constructor TPedidosDadosGeraisController.create;
begin
  {Para criar DAO somente quanto for utilizar}
  dmPedidos := TdmPedidos.Create(nil);
end;

destructor TPedidosDadosGeraisController.Destroy;
begin
  FreeAndNil(dmPedidos);
  inherited;
end;

function TPedidosDadosGeraisController.InserirPedido(oPedidosDadosGerais: TPedidosDadosGerais; var sErro: String): Boolean;
begin
  Result := dmPedidos.InserirPedido(oPedidosDadosGerais, sErro);
end;

function TPedidosDadosGeraisController.AlterarPEdido(oPedidosDadosGerais: TPedidosDadosGerais; var sErro: String): Boolean;
begin
  Result := dmPedidos.AlterarPedido(oPedidosDadosGerais, sErro);
end;

function TPedidosDadosGeraisController.ExcluirPedido(pPedido: Integer; var sErro: String): Boolean;
begin
  Result := dmPedidos.ExcluirPedido(pPedido, sErro);
end;

procedure TPedidosDadosGeraisController.CarregarPedido(oPedidosDadosGerais: TPedidosDadosGerais; pCodigo: Integer);
begin
  dmPedidos.CarregarPedido(oPedidosDadosGerais, pCodigo);
end;

procedure TPedidosDadosGeraisController.Pesquisar(pPedido: Integer);
begin
  dmPedidos.Pesquisar(pPedido);
end;

function TPedidosDadosGeraisController.RetornaNomeCliente(pCodCliente: Integer): String;
begin
  Result := dmPedidos.RetornaNomeCliente(pCodCliente);
end;

function TPedidosDadosGeraisController.RetornaDescricaoProduto(pCodProduto: Integer): String;
begin
  Result := dmPedidos.RetornaDescricaoProduto(pCodProduto);
end;

end.
