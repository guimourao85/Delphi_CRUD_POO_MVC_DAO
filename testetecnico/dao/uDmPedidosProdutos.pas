unit uDmPedidosProdutos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPedidosProdutos = class(TDataModule)
    sqlPesquisarPedidoItens: TFDQuery;
    sqlInserirPedidoItens: TFDQuery;
    sqlAlterarPedidoItens: TFDQuery;
    sqlExcluirPedidoItens: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPedidosProdutos: TdmPedidosProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
