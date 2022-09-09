unit UnitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList, u99Permissions, FMX.MediaLibrary.Actions,

  {$IFDEF ANDROID}
  FMX.VirtualKeyboard, FMX.Platform,
  {$ENDIF}

  FMX.StdActns;

type
  TFrmLogin = class(TForm)
    Layout2: TLayout;
    img_login_logo: TImage;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    edt_login_email: TEdit;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    RoundRect2: TRoundRect;
    edt_login_senha: TEdit;
    Layout4: TLayout;
    rect_login: TRoundRect;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabConta: TTabItem;
    Layout5: TLayout;
    Image1: TImage;
    Layout6: TLayout;
    RoundRect4: TRoundRect;
    edt_cad_nome: TEdit;
    Layout7: TLayout;
    RoundRect5: TRoundRect;
    edt_cad_senha: TEdit;
    Layout8: TLayout;
    rect_conta_proximo: TRoundRect;
    Label2: TLabel;
    Layout9: TLayout;
    RoundRect7: TRoundRect;
    edt_cad_email: TEdit;
    TabFoto: TTabItem;
    Layout10: TLayout;
    c_foto_editar: TCircle;
    Layout11: TLayout;
    RoundRect8: TRoundRect;
    Label3: TLabel;
    TabEscolher: TTabItem;
    Layout12: TLayout;
    Label4: TLabel;
    img_foto: TImage;
    img_library: TImage;
    Layout13: TLayout;
    img_foto_voltar: TImage;
    Layout14: TLayout;
    Layout15: TLayout;
    ActionList1: TActionList;
    ActConta: TChangeTabAction;
    ActEscolher: TChangeTabAction;
    ActFoto: TChangeTabAction;
    ActLogin: TChangeTabAction;
    Layout18: TLayout;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActCamera: TTakePhotoFromCameraAction;
    lbl_login_conta: TLabel;
    actCodigo: TChangeTabAction;
    actLembrar: TChangeTabAction;
    actRedefinir: TChangeTabAction;
    lbl_conta_login: TLabel;
    Label12: TLabel;
    tabRedefinir: TTabItem;
    Layout25: TLayout;
    Layout26: TLayout;
    Image4: TImage;
    Layout27: TLayout;
    RoundRect11: TRoundRect;
    Edit3: TEdit;
    Layout28: TLayout;
    RoundRect12: TRoundRect;
    Edit4: TEdit;
    Layout29: TLayout;
    RoundRect13: TRoundRect;
    Label11: TLabel;
    Label14: TLabel;
    tabLembrar: TTabItem;
    Layout16: TLayout;
    Layout17: TLayout;
    Image2: TImage;
    Layout21: TLayout;
    Layout22: TLayout;
    RoundRect10: TRoundRect;
    Edit5: TEdit;
    RoundRect3: TRoundRect;
    Label5: TLabel;
    lblVoltar: TLabel;
    tabCodigo: TTabItem;
    Layout19: TLayout;
    Layout20: TLayout;
    Image3: TImage;
    Layout23: TLayout;
    RoundRect6: TRoundRect;
    Layout24: TLayout;
    RoundRect9: TRoundRect;
    Edit1: TEdit;
    Label6: TLabel;
    Layout30: TLayout;
    Image5: TImage;
    Layout31: TLayout;
    Image6: TImage;
    Label7: TLabel;
    Image7: TImage;
    procedure lbl_login_contaClick(Sender: TObject);
    procedure lbl_conta_loginClick(Sender: TObject);
    procedure rect_conta_proximoClick(Sender: TObject);
    procedure img_foto_voltarClick(Sender: TObject);
    procedure c_foto_editarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure img_fotoClick(Sender: TObject);
    procedure img_libraryClick(Sender: TObject);
    procedure img_escolher_voltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActLibraryDidFinishTaking(Image: TBitmap);
    procedure ActCameraDidFinishTaking(Image: TBitmap);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure rect_loginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblVoltarClick(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
  private
    { Private declarations }
    permissao: T99Permissions;
    procedure TrataErroPermissao(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses UnitPrincipal;

procedure TFrmLogin.ActCameraDidFinishTaking(Image: TBitmap);
begin
    c_foto_editar.Fill.Bitmap.Bitmap := Image;
    ActFoto.Execute;
end;

procedure TFrmLogin.ActLibraryDidFinishTaking(Image: TBitmap);
begin
    c_foto_editar.Fill.Bitmap.Bitmap := Image;
    ActFoto.Execute;
end;

procedure TFrmLogin.c_foto_editarClick(Sender: TObject);
begin
    ActEscolher.Execute;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmLogin := nil;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
    permissao := T99Permissions.Create;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
    permissao.DisposeOf;
end;

procedure TFrmLogin.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
{$IFDEF ANDROID}
var
    FService : IFMXVirtualKeyboardService;
{$ENDIF}

begin
    {$IFDEF ANDROID}
    if (Key = vkHardwareBack) then
    begin
        TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                          IInterface(FService));

        if (FService <> nil) and
           (TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState) then
        begin
            // Botao back pressionado e teclado visivel...
            // (apenas fecha o teclado)
        end
        else
        begin
           // Botao back pressionado e teclado NAO visivel...

            if TabControl1.ActiveTab = TabConta then
            begin
                Key := 0;
                ActLogin.Execute
            end
            else if TabControl1.ActiveTab = TabFoto then
            begin
                Key := 0;
                ActConta.Execute
            end
            else if TabControl1.ActiveTab = TabLembrar then
            begin
                Key := 0;
                ActLogin.Execute
            end
            else if TabControl1.ActiveTab = TabRedefinir then
            begin
                Key := 0;
                ActLogin.Execute
            end
            else if TabControl1.ActiveTab = TabCodigo then
            begin
                Key := 0;
                ActLembrar.Execute
            end
            else if TabControl1.ActiveTab = TabEscolher then
            begin
                Key := 0;
                ActFoto.Execute;
            end;
        end;
    end;
    {$ENDIF}
end;
procedure TFrmLogin.FormShow(Sender: TObject);
begin
    TabControl1.ActiveTab := TabLogin;
end;

procedure TFrmLogin.Image6Click(Sender: TObject);
begin
   actLembrar.Execute;
end;

procedure TFrmLogin.Image7Click(Sender: TObject);
begin
    actFoto.Execute;
end;

procedure TFrmLogin.TrataErroPermissao(Sender: TObject);
begin
    showmessage('Você não possui permissão de acesso para esse recurso');
end;

procedure TFrmLogin.img_escolher_voltarClick(Sender: TObject);
begin
    ActLogin.Execute;
end;

procedure TFrmLogin.img_fotoClick(Sender: TObject);
begin
    permissao.Camera(ActCamera, TrataErroPermissao);
end;

procedure TFrmLogin.img_foto_voltarClick(Sender: TObject);
begin
    ActConta.Execute;
end;

procedure TFrmLogin.img_libraryClick(Sender: TObject);
begin
    permissao.PhotoLibrary(ActLibrary, TrataErroPermissao);
end;

procedure TFrmLogin.Label12Click(Sender: TObject);
begin
    actLembrar.execute;
end;

procedure TFrmLogin.Label14Click(Sender: TObject);
begin
    actLogin.execute;
end;

procedure TFrmLogin.Label1Click(Sender: TObject);
begin
        if not Assigned(FrmPrincipal) then
         Application.CreateForm(TFrmPrincipal, FrmPrincipal);
      Application.MainForm := FrmPrincipal;
      FrmPrincipal.show;
      FrmLogin.Close;
end;

procedure TFrmLogin.Label5Click(Sender: TObject);
begin
     actCodigo.Execute;
end;

procedure TFrmLogin.Label6Click(Sender: TObject);
begin
      actRedefinir.Execute;
end;

procedure TFrmLogin.lblVoltarClick(Sender: TObject);
begin
      actLogin.Execute;
end;

procedure TFrmLogin.Label7Click(Sender: TObject);
begin
    actRedefinir.Execute;
end;

procedure TFrmLogin.Label9Click(Sender: TObject);
begin
    actCodigo.Execute;
end;

procedure TFrmLogin.lbl_conta_loginClick(Sender: TObject);
begin
    actLogin.Execute;
end;

procedure TFrmLogin.lbl_login_contaClick(Sender: TObject);
begin
    ActConta.Execute;
end;

procedure TFrmLogin.rect_conta_proximoClick(Sender: TObject);
begin
    ActFoto.Execute;
end;

procedure TFrmLogin.rect_loginClick(Sender: TObject);
begin
    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipal, FrmPrincipal);

    Application.MainForm := FrmPrincipal;
    FrmPrincipal.Show;
    FrmLogin.Close;
end;

end.
