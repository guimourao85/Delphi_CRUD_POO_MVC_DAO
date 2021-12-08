unit uPedidosDadosGeraisModel;

interface

type

  TPedidosDadosGerais = class
  private

    FCodCliente: Integer;
    FPedido: Integer;
    FValorTotal: Real;
    FDtEmissao: TDate;

    procedure SetDtEmissao(const Value: TDate);
    procedure SetCodCliente(const Value: Integer);

  public

    property Pedido: Integer read FPedido write FPedido;
    property DtEmissao: TDate read FDtEmissao write SetDtEmissao;
    property CodCliente: Integer read FCodCliente write SetCodCliente;
    property ValorTotal: Real read FValorTotal write FValorTotal;
  end;

implementation

uses
  System.SysUtils;

{ TPedidoDadosGerais }
procedure TPedidosDadosGerais.SetCodCliente(const Value: Integer);
begin
  if (StrToIntDef(IntToStr(Value), 0) <= 0) then
    raise EArgumentException.Create('Informe o Cliente antes de salvar!');

  FCodCliente := Value;
end;

procedure TPedidosDadosGerais.SetDtEmissao(const Value: TDate);
begin
  if DateToStr(Value) = EmptyStr then
    raise EArgumentException.Create('Informe a Data de Emissão antes de salvar!');

  FDtEmissao := Value;
end;

end.
