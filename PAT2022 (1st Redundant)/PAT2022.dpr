program PAT2022;

uses
  Vcl.Forms,
  frmWelcome_U in 'frmWelcome_U.pas' {frmWelcome},
  frmRegister_U in 'frmRegister_U.pas' {frmRegister},
  clsValidation in 'clsValidation.pas',
  frmAdminPage_U in 'frmAdminPage_U.pas' {frmAdminPage},
  dbPAT2022 in 'dbPAT2022.pas' {dbmPAT2022: TDataModule},
  frmLogin_U in 'frmLogin_U.pas' {frmLogin},
  frmCourseBrowser_U in 'frmCourseBrowser_U.pas' {frmCourseBrowser},
  frmUniversityBrowser_U in 'frmUniversityBrowser_U.pas' {frmUniversityBrowser},
  clsFormatCalculations in 'clsFormatCalculations.pas',
  frmBrowserChooser_U in 'frmBrowserChooser_U.pas' {frmBrowserChooser},
  frmUniversityInfo_U in 'frmUniversityInfo_U.pas' {frmUniversityInfo},
  frmCourseInfo_U in 'frmCourseInfo_U.pas' {frmCourseInfo},
  frmProfile_U in 'frmProfile_U.pas' {frmProfile},
  frmCustomise_U in 'frmCustomise_U.pas' {frmCustomise};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWelcome, frmWelcome);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmAdminPage, frmAdminPage);
  Application.CreateForm(TdbmPAT2022, dbmPAT2022);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCourseBrowser, frmCourseBrowser);
  Application.CreateForm(TfrmUniversityBrowser, frmUniversityBrowser);
  Application.CreateForm(TfrmBrowserChooser, frmBrowserChooser);
  Application.CreateForm(TfrmUniversityInfo, frmUniversityInfo);
  Application.CreateForm(TfrmCourseInfo, frmCourseInfo);
  Application.CreateForm(TfrmProfile, frmProfile);
  Application.CreateForm(TfrmCustomise, frmCustomise);
  Application.Run;

end.
