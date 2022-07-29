unit frmUniversityBrowser_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ComCtrls, clsValidation, dbPAT2022,
  clsFormatCalculations;

type
  TfrmUniversityBrowser = class(TForm)
    Panel1: TPanel;
    btnBack: TButton;
    btnClose: TButton;
    pnlUni1: TPanel;
    lblUni1: TLabel;
    imgUni1: TImage;
    pnlUni2: TPanel;
    lblUni2: TLabel;
    imgUni2: TImage;
    ScrollBox1: TScrollBox;
    pnlUni3: TPanel;
    lblUni3: TLabel;
    imgUni3: TImage;
    redUniDescription1: TRichEdit;
    redUniDescription2: TRichEdit;
    redUniDescription3: TRichEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    pnlUni4: TPanel;
    lblUni4: TLabel;
    imgUni4: TImage;
    redUniDescription4: TRichEdit;
    pnlUni5: TPanel;
    lblUni5: TLabel;
    imgUni5: TImage;
    redUniDescription5: TRichEdit;
    pnlUni6: TPanel;
    lblUni6: TLabel;
    imgUni6: TImage;
    redUniDescription6: TRichEdit;
    lblProvince1: TLabel;
    lblProvince2: TLabel;
    lblProvince3: TLabel;
    lblProvince4: TLabel;
    lblProvince5: TLabel;
    lblProvince6: TLabel;
    lblPublic1: TLabel;
    lblPublic2: TLabel;
    lblPublic3: TLabel;
    lblPublic4: TLabel;
    lblPublic5: TLabel;
    lblPublic6: TLabel;
    lblSelected: TLabel;
    Panel3: TPanel;
    btnMoreInfo: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnCoursesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblUni1Click(Sender: TObject);
    procedure lblUni1MouseEnter(Sender: TObject);
    procedure lblUni1MouseLeave(Sender: TObject);
    procedure lblUni2Click(Sender: TObject);
    procedure lblUni2MouseEnter(Sender: TObject);
    procedure lblUni2MouseLeave(Sender: TObject);
    procedure lblUni3Click(Sender: TObject);
    procedure lblUni3MouseLeave(Sender: TObject);
    procedure lblUni3MouseEnter(Sender: TObject);
    procedure lblUni4Click(Sender: TObject);
    procedure lblUni4MouseLeave(Sender: TObject);
    procedure lblUni4MouseEnter(Sender: TObject);
    procedure lblUni5Click(Sender: TObject);
    procedure lblUni5MouseEnter(Sender: TObject);
    procedure lblUni5MouseLeave(Sender: TObject);
    procedure lblUni6Click(Sender: TObject);
    procedure lblUni6MouseLeave(Sender: TObject);
    procedure lblUni6MouseEnter(Sender: TObject);
    procedure btnMoreInfoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblSelectedMouseEnter(Sender: TObject);
    procedure lblSelectedMouseLeave(Sender: TObject);
  private
    { Private declarations }
    objFormatCalculations: TFormatCalculation;
  public
    { Public declarations }
  end;

var
  frmUniversityBrowser: TfrmUniversityBrowser;
  sUniversityName: string;

implementation

uses frmLogin_U, frmCourseBrowser_U, frmBrowserChooser_U, frmUniversityInfo_U,
  frmCustomise_U;

{$R *.dfm}

procedure TfrmUniversityBrowser.btnBackClick(Sender: TObject);
begin
  frmUniversityBrowser.Close;
  frmBrowserChooser.Show;
end;

procedure TfrmUniversityBrowser.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmUniversityBrowser.btnCoursesClick(Sender: TObject);
begin
  frmUniversityBrowser.Close;
  frmCourseBrowser.Show;
end;

procedure TfrmUniversityBrowser.btnMoreInfoClick(Sender: TObject);
begin
  frmUniversityBrowser.Close;
  frmUniversityInfo.Show;

end;

procedure TfrmUniversityBrowser.FormCreate(Sender: TObject);
begin
  frmUniversityBrowser.Position := poScreenCenter;
  btnMoreInfo.Enabled := false;

  redUniDescription1.ReadOnly := true;
  redUniDescription2.ReadOnly := true;
  redUniDescription3.ReadOnly := true;
  redUniDescription4.ReadOnly := true;
  redUniDescription5.ReadOnly := true;
  redUniDescription6.ReadOnly := true;

  lblSelected.EllipsisPosition := epWordEllipsis;

end;

procedure TfrmUniversityBrowser.FormShow(Sender: TObject);
begin
  with dbmPAT2022 do
  begin
    tblUniversities.Open;
    tblUniversities.First;
  end;

  // Colour Scheme

  // Panels

  Panel1.Color := Primary;
  Panel2.Color := Primary;
  Panel3.Color := Primary;
  Panel4.Color := Secondary;
  ScrollBox1.Color := Secondary;
  pnlUni1.Color := Primary;
  pnlUni2.Color := Primary;
  pnlUni3.Color := Primary;
  pnlUni4.Color := Primary;
  pnlUni5.Color := Primary;
  pnlUni6.Color := Primary;

  // Labels

  Label1.Font.Color := Secondary;
  lblSelected.Font.Color := Secondary;
  lblPublic1.Font.Color := Secondary;

  lblUni1.Font.Color := Secondary;
  lblProvince1.Font.Color := Secondary;
  lblPublic1.Font.Color := Secondary;

  lblUni2.Font.Color := Secondary;
  lblProvince2.Font.Color := Secondary;
  lblPublic2.Font.Color := Secondary;

  lblUni3.Font.Color := Secondary;
  lblProvince3.Font.Color := Secondary;
  lblPublic3.Font.Color := Secondary;

  lblUni4.Font.Color := Secondary;
  lblProvince4.Font.Color := Secondary;
  lblPublic4.Font.Color := Secondary;

  lblUni5.Font.Color := Secondary;
  lblProvince5.Font.Color := Secondary;
  lblPublic5.Font.Color := Secondary;

  lblUni6.Font.Color := Secondary;
  lblProvince6.Font.Color := Secondary;
  lblPublic6.Font.Color := Secondary;

  // Other

  redUniDescription1.Color := PrimaryBrighter;
  redUniDescription1.Font.Color := Secondary;

  redUniDescription2.Color := PrimaryBrighter;
  redUniDescription2.Font.Color := Secondary;

  redUniDescription3.Color := PrimaryBrighter;
  redUniDescription3.Font.Color := Secondary;

  redUniDescription4.Color := PrimaryBrighter;
  redUniDescription4.Font.Color := Secondary;

  redUniDescription5.Color := PrimaryBrighter;
  redUniDescription5.Font.Color := Secondary;

  redUniDescription6.Color := PrimaryBrighter;
  redUniDescription6.Font.Color := Secondary;

  // Adding University info onto labels

  objFormatCalculations.UniBrowserInfo(lblUni1, lblProvince1, lblPublic1,
    redUniDescription1);
  imgUni1.Picture.LoadFromFile('Uni1.jpg');

  objFormatCalculations.UniBrowserInfo(lblUni2, lblProvince2, lblPublic2,
    redUniDescription2);
  imgUni2.Picture.LoadFromFile('Uni2.jpg');

  objFormatCalculations.UniBrowserInfo(lblUni3, lblProvince3, lblPublic3,
    redUniDescription3);
  imgUni3.Picture.LoadFromFile('Uni3.jpg');

  objFormatCalculations.UniBrowserInfo(lblUni4, lblProvince4, lblPublic4,
    redUniDescription4);
  imgUni4.Picture.LoadFromFile('Uni4.jpg');

  objFormatCalculations.UniBrowserInfo(lblUni5, lblProvince5, lblPublic5,
    redUniDescription5);
  imgUni5.Picture.LoadFromFile('Uni5.jpg');

  objFormatCalculations.UniBrowserInfo(lblUni6, lblProvince6, lblPublic6,
    redUniDescription6);
  imgUni6.Picture.LoadFromFile('Uni6.jpg');
end;

procedure TfrmUniversityBrowser.lblSelectedMouseEnter(Sender: TObject);
begin
  lblSelected.ShowHint := true;
  lblSelected.Hint := lblSelected.Caption;
end;

procedure TfrmUniversityBrowser.lblSelectedMouseLeave(Sender: TObject);
begin
  lblSelected.ShowHint := false;
end;

procedure TfrmUniversityBrowser.lblUni1Click(Sender: TObject);
begin

  lblSelected.Caption := lblUni1.Caption;
  btnMoreInfo.Enabled := true;

  lblUni2.Font.Style := [fsBold];
  lblUni3.Font.Style := [fsBold];
  lblUni4.Font.Style := [fsBold];
  lblUni5.Font.Style := [fsBold];
  lblUni6.Font.Style := [fsBold];

  sUniversityName := lblSelected.Caption;

end;

procedure TfrmUniversityBrowser.lblUni1MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUni1);
end;

procedure TfrmUniversityBrowser.lblUni1MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabelUni(lblUni1, lblSelected);
end;

procedure TfrmUniversityBrowser.lblUni2Click(Sender: TObject);
begin

  lblSelected.Caption := lblUni2.Caption;
  btnMoreInfo.Enabled := true;

  lblUni1.Font.Style := [fsBold];
  lblUni3.Font.Style := [fsBold];
  lblUni4.Font.Style := [fsBold];
  lblUni5.Font.Style := [fsBold];
  lblUni6.Font.Style := [fsBold];

  sUniversityName := lblSelected.Caption;

end;

procedure TfrmUniversityBrowser.lblUni2MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUni2);
end;

procedure TfrmUniversityBrowser.lblUni2MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabelUni(lblUni2, lblSelected);

end;

procedure TfrmUniversityBrowser.lblUni3Click(Sender: TObject);
begin

  lblSelected.Caption := lblUni3.Caption;
  btnMoreInfo.Enabled := true;

  lblUni1.Font.Style := [fsBold];
  lblUni2.Font.Style := [fsBold];
  lblUni4.Font.Style := [fsBold];
  lblUni5.Font.Style := [fsBold];
  lblUni6.Font.Style := [fsBold];

  sUniversityName := lblSelected.Caption;

end;

procedure TfrmUniversityBrowser.lblUni3MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUni3);
end;

procedure TfrmUniversityBrowser.lblUni3MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabelUni(lblUni3, lblSelected);
end;

procedure TfrmUniversityBrowser.lblUni4Click(Sender: TObject);
begin

  lblSelected.Caption := lblUni4.Caption;
  btnMoreInfo.Enabled := true;

  lblUni1.Font.Style := [fsBold];
  lblUni2.Font.Style := [fsBold];
  lblUni3.Font.Style := [fsBold];
  lblUni5.Font.Style := [fsBold];
  lblUni6.Font.Style := [fsBold];

  sUniversityName := lblSelected.Caption;

end;

procedure TfrmUniversityBrowser.lblUni4MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUni4);
end;

procedure TfrmUniversityBrowser.lblUni4MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabelUni(lblUni4, lblSelected);
end;

procedure TfrmUniversityBrowser.lblUni5Click(Sender: TObject);
begin

  lblSelected.Caption := lblUni5.Caption;
  btnMoreInfo.Enabled := true;

  lblUni1.Font.Style := [fsBold];
  lblUni2.Font.Style := [fsBold];
  lblUni3.Font.Style := [fsBold];
  lblUni4.Font.Style := [fsBold];
  lblUni6.Font.Style := [fsBold];

  sUniversityName := lblSelected.Caption;

end;

procedure TfrmUniversityBrowser.lblUni5MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUni5);
end;

procedure TfrmUniversityBrowser.lblUni5MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabelUni(lblUni5, lblSelected);
end;

procedure TfrmUniversityBrowser.lblUni6Click(Sender: TObject);
begin

  lblSelected.Caption := lblUni6.Caption;
  btnMoreInfo.Enabled := true;

  lblUni1.Font.Style := [fsBold];
  lblUni2.Font.Style := [fsBold];
  lblUni3.Font.Style := [fsBold];
  lblUni4.Font.Style := [fsBold];
  lblUni5.Font.Style := [fsBold];

  sUniversityName := lblSelected.Caption;

end;

procedure TfrmUniversityBrowser.lblUni6MouseEnter(Sender: TObject);
begin
  objFormatCalculations.MouseEnterLabel(lblUni6);
end;

procedure TfrmUniversityBrowser.lblUni6MouseLeave(Sender: TObject);
begin
  objFormatCalculations.MouseLeaveLabelUni(lblUni6, lblSelected);
end;

end.
