unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBServices,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.Buttons;

type
  TForm1 = class(TForm)
    IBBackupService1: TIBBackupService;
    BTGeraBack: TButton;
    DBconexao: TFDConnection;
    btCopy: TBitBtn;
    OpenDialog: TOpenDialog;
    edDestino: TEdit;
    edLocal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    btLocal: TButton;
    btDestino: TButton;
    edCod: TEdit;
    Label3: TLabel;
    GeraTabuada: TGroupBox;
    edNumero: TEdit;
    Label4: TLabel;
    btGerarArquivos: TButton;
    procedure BTGeraBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btLocalClick(Sender: TObject);
    procedure btDestinoClick(Sender: TObject);
    function CriarArquivo(NomeArq,Dados: String):Boolean;
    procedure btGerarArquivosClick(Sender: TObject); // funcao salva texto


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btCopyClick(Sender: TObject);
var
  local, destino: string;

begin
  if edCod.Text = '' then
  begin
    ShowMessage('Informe o Cod');
    edCod.SetFocus;
    exit;
  end;
  local := edLocal.Text;
  destino := edDestino.Text+'\'+edCod.Text;
    if CopyFile((PChar(local)), (PChar(destino+edCod.Text+'.FDB')),True) then // copia o local para p destino {Coloque como True se quiser que se já existir o arquivo ele seja sobrescrito }
      ShowMessage('Arquivo copiado com sucesso')

    else
    begin
      ShowMessage('#Atenção# - Problema ao copiar o arquivo.');
    end;

//    CriarArquivo((PChar(destino+edCod.Text)+'.txt'),'digite aqui o texto ');
//      CopyFile((PChar(local)), (PChar(destino)),True)  // copia sem editar a extenção
//      pchar(Diretorio + DiretorioBackup + NomeArquivo + '.ZZZ'), false) // troca nome e extenção
end;

procedure TForm1.btDestinoClick(Sender: TObject);
var
i : Integer;

begin

 if (OpenDialog.Execute) then
  begin

   for i:= 0 to OpenDialog.Files.Count -1 do
   edDestino.Text:= OpenDialog.Files[i];

  end;
end;

procedure TForm1.BTGeraBackClick(Sender: TObject);


begin
with IBBackupService1 do
begin

  LoginPrompt := False;
  Params.Add('user_name=SYSDBA');
  Params.Add('password=masterkey');
  Verbose := True;
  Options := [NonTransportable, IgnoreLimbo];
  ServerName := '127.0.0.1'; //nome ou ip do servidor
  DatabaseName := 'C:\app1\BD-OS_Diversos3.0\001.FDB'; //caminho do banco de dados (gdb)
  BackupFile.Add('C:\app1\BD-OS_Diversos3.0\Back\BD.fdb'); //caminho do backup (gbk)
  try
    Active := True;
    ServiceStart;
    while not Eof do
    begin
        Memo1.Lines.Add(GetNextLine);
        Application.ProcessMessages;
    end;
  finally
    Active := False;
  end;

end;
end;

procedure TForm1.btGerarArquivosClick(Sender: TObject);
var  arq: TextFile; { declarando a variável "arq" do tipo arquivo texto }
    i, n: integer;
begin

  try
 { Associa a variável do programa "arq" ao arquivo externo "tabuada.txt" na unidade desejada }
    AssignFile(arq, 'D:\documentos\Luan\2021\Delphi Vcl\Gerar Backup\Win32\Debug\\Doc_' + FormatDateTime('hhmmss.zzz', Now)+'log.txt');
    Rewrite(arq); { [ 2 ] Cria o arquivo texto "tabuada.txt" na unidade de disco "d" }

    n := StrToInt(edNumero.Text);

    Writeln(arq, '+--Resultado--+'); { Grava uma linha no arquivo }
    for i:=1 to 10 do
    begin
      Writeln(arq, '| ', i:2, ' X ', n, ' = ', (i*n):2, ' |'); {  Grava uma linha da tabuada no arquivo }
    end;
    Writeln(arq, '+-------------+'); { [ 8 ] Grava uma linha no arquivo }

    CloseFile(arq); { [ 8 ] Fecha o arquivo texto "tabuada.txt". }
//    ShowMessage('Tabuada gravada com sucesso em "d:\tabuada.txt".');
   except
    Writeln(arq, '+-Log de Erro ---------------------------------------------+'); //Grava uma linha no arquivo
    Writeln(arq, '|                                                          |');
    Writeln(arq, '| Data e hora : '+FormatDateTime('hh'+'_'+'mm'+'_'+'ss.zzz', Now));
    Writeln(arq, '| Data e hora : '+TimeToStr(time)+'Data.: '+DateToStr(Date));

    Writeln(arq, '|                                                          |');
    Writeln(arq, '+----------------------------------------------------------+');// Grava uma linha no arquivo
    CloseFile(arq); { [ 8 ] Fecha o arquivo texto "extencao.txt". }
        ShowMessage('Erro ".');
  end;

end;
function TForm1.CriarArquivo(NomeArq, Dados: String): Boolean;
var
ArqLogico:TextFile;
begin
    try
    AssignFile(ArqLogico,NomeArq);
    if not FileExists(NomeArq) then
      ReWrite(ArqLogico)
    else
      Append(ArqLogico);
      Result:=True;
    except
       Result:=False;
    end;
    if Result then
    begin
     WriteLn(ArqLogico,Dados);
     CloseFile(ArqLogico);
    end;
end;

procedure TForm1.btLocalClick(Sender: TObject);
var
i : Integer;

begin

 if (OpenDialog.Execute) then
  begin

   for i:= 0 to OpenDialog.Files.Count -1 do
   edLocal.Text:= OpenDialog.Files[i];

  end;


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;

end;

end.
