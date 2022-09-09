program Money;

uses
  System.StartUpCopy,
  FMX.Forms,
  u99Permissions in 'Units\u99Permissions.pas',
  UnitPrincipal in 'UnitPrincipal.pas' {FrmPrincipal},
  UnitLancamentos in 'UnitLancamentos.pas' {FrmLancamentos},
  UnitLancamentosCad in 'UnitLancamentosCad.pas' {FrmLancamentosCad},
  UnitCategorias in 'UnitCategorias.pas' {FrmCategorias},
  UnitCategoriasCad in 'UnitCategoriasCad.pas' {FrmCategoriasCad},
  UnitLogin in 'UnitLogin.pas' {FrmLogin},
  UnitDM in 'UnitDM.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.Run;
end.
