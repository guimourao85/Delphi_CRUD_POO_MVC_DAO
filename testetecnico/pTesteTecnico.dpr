program pTesteTecnico;

uses
  Vcl.Forms,
  uViewPedido in 'view\uViewPedido.pas' {frmPedidos},
  uPedidosDadosGeraisModel in 'model\uPedidosDadosGeraisModel.pas',
  uPedidosDadosGeraisController in 'controller\uPedidosDadosGeraisController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {dmConexao: TDataModule},
  uDmPedidos in 'dao\uDmPedidos.pas' {dmPedidos: TDataModule},
  uPedidosProdutosModel in 'model\uPedidosProdutosModel.pas',
  uDmPedidosProdutos in 'dao\uDmPedidosProdutos.pas' {dmPedidosProdutos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmPedidosProdutos, dmPedidosProdutos);
  Application.Run;
end.
