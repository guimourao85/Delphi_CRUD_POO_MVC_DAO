unit uDmPedidos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uPedidosDadosGeraisModel;

type
  TdmPedidos = class(TDataModule)
    sqlPesquisarPedidoCab: TFDQuery;
    sqlInserirPedidoCab: TFDQuery;
    sqlAlterarPedidoCab: TFDQuery;
    sqlExcluirPedidoCab: TFDQuery;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarPedido: TIntegerField;
    cdsPesquisarCodProduto: TIntegerField;
    cdsPesquisarDescricao: TStringField;
    cdsPesquisarQuantidade: TFloatField;
    cdsPesquisarValorUnitario: TFloatField;
    cdsPesquisarValorTotal: TFloatField;

  private

    { Private declarations }

  public

    { Public declarations }
    function  GerarPedido: Integer;
    procedure Pesquisar(pPedido: Integer);
    procedure CarregarPedido(oPedidosDadosGerais: TPedidosDadosGerais; pPedido: Integer);
    function  InserirPedido(oPedidosDadosGerais: TPedidosDadosGerais; out sErro: String): Boolean;
    function  AlterarPedido(oPedidosDadosGerais: TPedidosDadosGerais; out sErro: String): Boolean;
    function  ExcluirPedido(pPedido: Integer; out sErro: String): Boolean;
    function  RetornaNomeCliente(pCodCliente: Integer): String;
    function  RetornaDescricaoProduto(pCodProduto: Integer): String;

  end;

var
  dmPedidos: TdmPedidos;

implementation

uses
  uDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPedidos }
function TdmPedidos.GerarPedido: Integer;
var
  qrPesquisa: TFDQuery;
begin
  qrPesquisa := TFDQuery.Create(nil);

  Try
    qrPesquisa.Connection := dmConexao.FDConnection1;
    qrPesquisa.Transaction := dmConexao.FDTransaction1;

    qrPesquisa.SQL.Clear;
    qrPesquisa.SQL.Add('select                                                              ');
    qrPesquisa.SQL.Add('    COALESCE(MAX(pedidosdadosgerais.Pedido), 0) + 1 as ultimopedido ');
    qrPesquisa.SQL.Add('from                                                                ');
    qrPesquisa.SQL.Add('    pedidosdadosgerais                                              ');
    qrPesquisa.Open;

    Result := qrPesquisa.FieldByName('ultimopedido').AsInteger;
  Finally
    qrPesquisa.Close;
    FreeAndNil(qrPesquisa);
  End;
end;

procedure TdmPedidos.Pesquisar(pPedido: Integer);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;

  cdsPesquisar.Params.ParamByName('pPedido').AsInteger := pPedido;
  cdsPesquisar.Open;
end;

function TdmPedidos.RetornaNomeCliente(pCodCliente: Integer): String;
var
  qrPesquisa: TFDQuery;
begin
  qrPesquisa := TFDQuery.Create(nil);

  Try
    qrPesquisa.Connection  := dmConexao.FDConnection1;
    qrPesquisa.Transaction := dmConexao.FDTransaction1;

    qrPesquisa.SQL.Clear;
    qrPesquisa.SQL.Add('select                                   ');
    qrPesquisa.SQL.Add('    clientes.Nome                        ');
    qrPesquisa.SQL.Add('from                                     ');
    qrPesquisa.SQL.Add('    clientes                             ');
    qrPesquisa.SQL.Add('where                                    ');
    qrPesquisa.SQL.Add('    clientes.CodCliente  = :pCodCliente  ');
    qrPesquisa.SQL.Add('                                         ');

    qrPesquisa.Params.ParamByName('pCodCliente').AsInteger := pCodCliente;
    qrPesquisa.Open;

    Result := qrPesquisa.FieldByName('nome').AsString;
  Finally
    qrPesquisa.Close;
    FreeAndNil(qrPesquisa);
  End;
end;

function TdmPedidos.RetornaDescricaoProduto(pCodProduto: Integer): String;
var
  qrPesquisa: TFDQuery;
begin
  qrPesquisa := TFDQuery.Create(nil);

  Try
    qrPesquisa.Connection  := dmConexao.FDConnection1;
    qrPesquisa.Transaction := dmConexao.FDTransaction1;

    qrPesquisa.SQL.Clear;
    qrPesquisa.SQL.Add('select                                   ');
    qrPesquisa.SQL.Add('    produtos.Descricao                   ');
    qrPesquisa.SQL.Add('from                                     ');
    qrPesquisa.SQL.Add('    produtos                             ');
    qrPesquisa.SQL.Add('where                                    ');
    qrPesquisa.SQL.Add('    produtos.CodProduto = :pCodProduto   ');
    qrPesquisa.SQL.Add('                                         ');

    qrPesquisa.Params.ParamByName('pCodProduto').AsInteger := pCodProduto;
    qrPesquisa.Open;

    Result := qrPesquisa.FieldByName('Descricao').AsString;
  Finally
    qrPesquisa.Close;
    FreeAndNil(qrPesquisa);
  End;
end;

procedure TdmPedidos.CarregarPedido(oPedidosDadosGerais: TPedidosDadosGerais; pPedido: Integer);
var
  qrPesquisa: TFDQuery;
begin
  qrPesquisa := TFDQuery.Create(nil);

  Try
    qrPesquisa.Connection  := dmConexao.FDConnection1;
    qrPesquisa.Transaction := dmConexao.FDTransaction1;

    qrPesquisa.Close;
    qrPesquisa.SQL.Clear;
    qrPesquisa.SQL.Add('select                                    ');
    qrPesquisa.SQL.Add('    pedidosdadosgerais.*                  ');
    qrPesquisa.SQL.Add('from                                      ');
    qrPesquisa.SQL.Add('    pedidosdadosgerais                    ');
    qrPesquisa.SQL.Add('where                                     ');
    qrPesquisa.SQL.Add('    pedidosdadosgerais.Pedido  = :pPedido ');
    qrPesquisa.SQL.Add('                                          ');

    qrPesquisa.Params.ParamByName('pPedido').AsInteger := pPedido;
    qrPesquisa.Open;

    if qrPesquisa.RecordCount > 0 then
      with oPedidosDadosGerais do
        begin
          Pedido     := qrPesquisa.FieldByName('Pedido').AsInteger;
          DtEmissao  := qrPesquisa.FieldByName('DtEmissao').AsDateTime;
          CodCliente := qrPesquisa.FieldByName('CodCliente').AsInteger;
          ValorTotal := qrPesquisa.FieldByName('ValorTotal').AsFloat;
        end;

  Finally
    qrPesquisa.Close;
    FreeAndNil(qrPesquisa);
  End;
end;

function TdmPedidos.InserirPedido(oPedidosDadosGerais: TPedidosDadosGerais; out sErro: String): Boolean;
begin
  with sqlInserirPedidoCab do
    begin
      Params.ParamByName('Pedido').AsInteger     := GerarPedido;
      Params.ParamByName('DtEmissao').AsDate     := oPedidosDadosGerais.DtEmissao;
      Params.ParamByName('CodCliente').AsInteger := oPedidosDadosGerais.CodCliente;
      Params.ParamByName('ValorTotal').AsFloat   := oPedidosDadosGerais.ValorTotal;

      try
        ExecSQL;
        Result := True;
        dmConexao.FDTransaction1.CommitRetaining;
      Except on E: Exception do
        begin
          sErro  := 'Ocorreu um erro ao inserir o Pedido: ' + sLineBreak + E.Message;
          Result := False;
        end;
      end;
    end;
end;

function TdmPedidos.AlterarPedido(oPedidosDadosGerais: TPedidosDadosGerais; out sErro: String): Boolean;
begin
  with sqlAlterarPedidoCab do
    begin
      Params.ParamByName('DtEmissao').AsDate     := oPedidosDadosGerais.DtEmissao;
      Params.ParamByName('CodCliente').AsInteger := oPedidosDadosGerais.CodCliente;
      Params.ParamByName('pPedido').AsInteger    := oPedidosDadosGerais.Pedido;

      try
        ExecSQL;
        Result := True;
        dmConexao.FDTransaction1.CommitRetaining;
      Except on E: Exception do
        begin
          sErro  := 'Ocorreu um erro ao alterar o Pedido: ' + sLineBreak + E.Message;
          Result := False;
        end;
      end;
    end;
end;

function TdmPedidos.ExcluirPedido(pPedido: Integer; out sErro: String): Boolean;
begin
  with sqlExcluirPedidoCab do
    begin
      Params.ParamByName('pPedido').AsInteger := pPedido;

      try
        ExecSQL;
        Result := True;
        dmConexao.FDTransaction1.CommitRetaining;
      Except on E: Exception do
        begin
          sErro  := 'Ocorreu um erro ao excluir o Pedido: ' + sLineBreak + E.Message;
          Result := False;
        end;
      end;
    end;
end;

end.
