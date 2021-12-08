unit uViewPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Mask, Data.DB;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TfrmPedidos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pCentral: TPanel;
    Label2: TLabel;
    edPedido: TEdit;
    Label3: TLabel;
    edCodCliente: TEdit;
    edNomeCliente: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edCodProduto: TEdit;
    edDescProduto: TEdit;
    Label6: TLabel;
    edQtde: TEdit;
    Label7: TLabel;
    edValorUnitario: TEdit;
    Label8: TLabel;
    edValorTotal: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label9: TLabel;
    lblTotPedido: TLabel;
    Panel3: TPanel;
    btGravarPedido: TBitBtn;
    btConsultarPedido: TBitBtn;
    btExcluirPedido: TBitBtn;
    edDtEmissao: TMaskEdit;
    dsPesquisa: TDataSource;
    btCancelarPedido: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure edCodClienteExit(Sender: TObject);
    procedure btConsultarPedidoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure btExcluirPedidoClick(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure btGravarPedidoClick(Sender: TObject);
    procedure edCodProdutoExit(Sender: TObject);
  private

    { Private declarations }
    FOperacao: TOperacao;

    procedure LimpaCampos;
    procedure AtualizaControles;
    procedure AtualizaInformacoes;
    procedure Novo;
    procedure Detalhar(pPedido: Integer);
    procedure Pesquisar(pPedido: Integer);
    procedure CarregaPedido(pPedido: Integer);
    procedure Alterar;
    procedure Excluir(pPedido: Integer);
    procedure Inserir;
    procedure Gravar;

  public

    { Public declarations }

  end;

var
  frmPedidos: TfrmPedidos;

implementation

uses
  uPedidosDadosGeraisController, uPedidosDadosGeraisModel;

{$R *.dfm}

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  LimpaCampos;
  AtualizaControles;
end;

procedure TfrmPedidos.LimpaCampos;
begin
  edPedido.Text        := '';
  edDtEmissao.Text     := '';
  edCodCliente.Text    := '';
  edNomeCliente.Text   := '';
  edCodProduto.Text    := '';
  edDescProduto.Text   := '';
  edQtde.Text          := '';
  edValorUnitario.Text := '';
  edValorTotal.Text    := '';

  if (edDtEmissao.Text = '  /  /    ') then
    edDtEmissao.Text := DateToStr(Date);
end;

procedure TfrmPedidos.AtualizaControles;
begin
  btExcluirPedido.Enabled   := Trim(edCodCliente.Text) = '';
  btConsultarPedido.Enabled := Trim(edCodCliente.Text) = '';
end;

procedure TfrmPedidos.btCancelarPedidoClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPedidos.btConsultarPedidoClick(Sender: TObject);
var
  zPedido: Integer;
begin
  zPedido := StrToIntDef(InputBox('Consulta de Pedidos', 'Informe o número do Pedido: ', '0'), 0);

  if (zPedido <= 0) then
     begin
       Application.MessageBox('Informe um número de Pedido válido!', 'Atenção', 48);
       Exit;
     end;

  CarregaPedido(zPedido);
end;

procedure TfrmPedidos.btExcluirPedidoClick(Sender: TObject);
var
  zPedido: Integer;
begin
  zPedido := StrToIntDef(InputBox('Exclusão de Pedido', 'Informe o número do Pedido: ', '0'), 0);

  if (zPedido <= 0) then
     begin
       Application.MessageBox('Informe um número de Pedido válido!', 'Atenção', 48);
       Exit;
     end;

  Excluir(zPedido);
end;

procedure TfrmPedidos.btGravarPedidoClick(Sender: TObject);
begin

  {$REGION '  Validações Campos em Tela  '}
    if (StrToIntDef(edCodCliente.Text, 0) <= 0) then
      begin
        MessageDlg('Informe o Cliente antes de salvar!', mtWarning, [mbOK], 0);
        edCodCliente.SetFocus;
        Exit;
      end;
  {$ENDREGION '  Validações Campos em Tela  '}

  try
    Gravar;
  finally
    Application.MessageBox('Pedido salvo com sucesso!', 'Processo Finalizado', 64);
    LimpaCampos;
    AtualizaInformacoes;
  end;
end;

procedure TfrmPedidos.edCodClienteExit(Sender: TObject);
begin
  AtualizaInformacoes;
end;

procedure TfrmPedidos.edCodProdutoExit(Sender: TObject);
begin
  AtualizaInformacoes;
end;

procedure TfrmPedidos.Novo;
begin
  FOperacao := opNovo;
end;

procedure TfrmPedidos.Detalhar(pPedido: Integer);
begin
  FOperacao := opNavegar;
end;

procedure TfrmPedidos.Panel3Click(Sender: TObject);
begin
  Gravar;
end;

procedure TfrmPedidos.Pesquisar(pPedido: Integer);
var
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
begin
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;
  try
    oPedidosDadosGeraisController.Pesquisar(pPedido);
  finally
    FreeAndNil(oPedidosDadosGeraisController);
  end;
end;

procedure TfrmPedidos.CarregaPedido(pPedido: Integer);
var
  oPedidosDadosGerais: TPedidosDadosGerais;
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
begin
  oPedidosDadosGerais := TPedidosDadosGerais.Create;
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;

  try
    oPedidosDadosGeraisController.CarregarPedido(oPedidosDadosGerais, pPedido);

    with oPedidosDadosGerais do
      begin
        edPedido.Text        := IntToStr(oPedidosDadosGerais.Pedido);
        edDtEmissao.Text     := DateToStr(oPedidosDadosGerais.DtEmissao);
        edCodCliente.Text    := IntToStr(oPedidosDadosGerais.CodCliente);
        lblTotPedido.Caption := FormatFloat('#,##0.00', oPedidosDadosGerais.ValorTotal);
      end;
  finally
    FreeAndNil(oPedidosDadosGerais);
    FreeAndNil(oPedidosDadosGeraisController);
    AtualizaInformacoes;
  end;
end;

procedure TfrmPedidos.Alterar;
var
  oPedidosDadosGerais: TPedidosDadosGerais;
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
  sErro: String;
begin
  oPedidosDadosGerais := TPedidosDadosGerais.Create;
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;

  try
    with oPedidosDadosGerais do
      begin
        Pedido     := StrToIntDef(edPedido.Text, 0);
        DtEmissao  := StrToDate(edDtEmissao.Text);
        CodCliente := StrToIntDef(edCodCliente.Text, 0);
      end;

    if oPedidosDadosGeraisController.AlterarPedido(oPedidosDadosGerais, sErro) then
      raise Exception.Create(sErro);
  finally
    FreeAndNil(oPedidosDadosGerais);
    FreeAndNil(oPedidosDadosGeraisController);
  end;
end;

procedure TfrmPedidos.Excluir(pPedido: Integer);
var
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
  sErro: String;
begin
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;

  try
     if (MessageDlg('Deseja realmente excluir este Pedido?', mtConfirmation, [mbYes, mbNo], 0) = IDYES) then
       begin
         if not oPedidosDadosGeraisController.ExcluirPedido(pPedido, sErro) then
           raise Exception.Create(sErro);
       end;

  finally
    AtualizaInformacoes;
    FreeAndNil(oPedidosDadosGeraisController);
  end;
end;

procedure TfrmPedidos.Inserir;
var
  oPedidosDadosGerais: TPedidosDadosGerais;
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
  sErro: String;
begin
  oPedidosDadosGerais := TPedidosDadosGerais.Create;
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;
  try
    with oPedidosDadosGerais do
      begin
        Pedido     := 0;
        DtEmissao  := StrTodate(edDtEmissao.Text);
        CodCliente := StrToIntDef(edCodCliente.Text, 0);
      end;

    if oPedidosDadosGeraisController.InserirPedido(oPedidosDadosGerais, sErro) = False then
      raise Exception.Create(sErro);

  Finally
    FreeAndNil(oPedidosDadosGerais);
    FreeAndNil(oPedidosDadosGeraisController);
  End;
end;

procedure TfrmPedidos.Gravar;
var
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
begin
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;
  try

    FOperacao := opNovo;
    if (StrToIntDef(edPedido.Text, 0) > 0) then
      FOperacao := opAlterar;

    case FOperacao of
      opNovo:    Inserir;
      opAlterar: Alterar;
    end;

  finally
    AtualizaInformacoes;
    FreeAndNil(oPedidosDadosGeraisController);
  end;
end;

procedure TfrmPedidos.AtualizaInformacoes;
var
  oPedidosDadosGeraisController: TPedidosDadosGeraisController;
begin
  oPedidosDadosGeraisController := TPedidosDadosGeraisController.Create;
  try
    AtualizaControles;

    edNomeCliente.Text := '';
    if (Trim(edCodCliente.Text) <> '') then
      edNomeCliente.Text :=   oPedidosDadosGeraisController.RetornaNomeCliente(StrToIntDef(edCodCliente.Text, 0));

    edDescProduto.Text := '';
    if (Trim(edCodProduto.Text) <> '') then
      edDescProduto.Text :=   oPedidosDadosGeraisController.RetornaDescricaoProduto(StrToIntDef(edCodProduto.Text, 0));

  finally
    FreeAndNil(oPedidosDadosGeraisController);
  end;
end;


end.
