unit UForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SgMatr: TStringGrid;
    BtGenerate: TButton;
    SeRazm: TSpinEdit;
    Label1: TLabel;
    Panel3: TPanel;
    SgTras: TStringGrid;
    Rgsedlo: TRadioGroup;
    btIter: TButton;
    LeDk: TLabeledEdit;
    SeNati: TSpinEdit;
    Label2: TLabel;
    Panel4: TPanel;
    SgStrat: TStringGrid;
    procedure SeRazmChange(Sender: TObject);
    procedure BtGenerateClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btIterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  zz =15;

implementation

{$R *.dfm}


procedure TForm1.SeRazmChange(Sender: TObject);
var
  i:byte;
begin
  SgMatr.ColCount:=SeRazm.Value+1;
  SgMatr.RowCount:=SeRazm.Value+1;
  SeNatI.MaxValue:=SeRazm.Value+1;
  SgStrat.RowCount:=SeRazm.Value+1;
  For i:=1 to SgMatr.ColCount do
    begin
    sgmatr.Cells[i,0]:=IntToStr(i);
    sgmatr.Cells[0,i]:=IntToStr(i);
    sgstrat.Cells[0,i]:=IntToStr(i);
    end;
end;

procedure TForm1.BtGenerateClick(Sender: TObject);
var
  i,j,k,l:byte;
  a:word;
begin
  k:=random(SeRazm.Value)+1;
  l:=random(SeRazm.Value)+1;
  a:=random(zz);
  sgmatr.Cells[k,l]:=IntToStr(a);
  For i:=1 to SgMatr.ColCount do
    begin
    If RgSedlo.ItemIndex=0 then
      begin
      if i<>l then
        sgmatr.Cells[k,i]:=IntToStr(random(a-1)+1);
      if i<>k then
        sgmatr.Cells[i,l]:=IntToStr(random(zz-a)+1+a);
      end
    else
      begin
      if i<>l then
        sgmatr.Cells[k,i]:=IntToStr(random(zz-a)+1+a);
      if i<>k then
        sgmatr.Cells[i,l]:=IntToStr(random(a-1)+1);
      end;
    end;
  For i:=1 to SgMatr.ColCount do
      For j:=1 to SgMatr.RowCount do
        If (i<>k) and (j<>l) then
          sgmatr.Cells[i,j]:=IntToStr(random(zz));

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
randomize;
end;

procedure TForm1.btIterClick(Sender: TObject);
var
i,j:byte;
ib,jb,kb:longint;
sb,k:longint;
dk,mb,ga1,ga2:double;
st:string;
begin
SgTras.ColCount:=SgMatr.ColCount*2+4+2;
SgTras.Cells[0,0]:='k';
SgTras.Cells[1,0]:='i(k)';
SgTras.Cells[SgMatr.ColCount+1,0]:='ga2(k)';
SgTras.Cells[SgMatr.ColCount+2,0]:='min(ga2(k))';
SgTras.Cells[SgMatr.ColCount+3,0]:='j(k)';
SgTras.Cells[SgMatr.ColCount*2+3,0]:='ga1(k)';
SgTras.Cells[SgMatr.ColCount*2+4,0]:='min(ga1(k))';
SgTras.Cells[SgMatr.ColCount*2+5,0]:='delt(k)';
For i:=1 to SgMatr.ColCount-1 do
  begin
  SgTras.Cells[i+1,0]:='mu(k) '+IntToStr(i);
  SgTras.Cells[i+SgMatr.ColCount+3,0]:='nu(k) '+IntToStr(i);
  end;
dk:=1000;
k:=0;
While (dk>StrToFloat(LeDk.Text)) do
  begin
  inc(k);
  SgTras.RowCount:=k+1;
  SgTras.Cells[0,k]:=IntToStr(k);
  If k=1 then
    i:=SeNatI.Value;
  SgTras.Cells[1,k]:=IntToStr(i);
  mb:=200000;
  For ib:=1 to SgMatr.ColCount-1 do
    begin
    if k<>1 then
    sb:=StrToint(SgTras.Cells[1+ib,k-1])
    else
    sb:=0;
    SgTras.Cells[1+ib,k]:=IntToStr(StrToInt(sgmatr.Cells[ib,i])+sb);
    if mb>=strtofloat(SgTras.Cells[1+ib,k]) then
       begin
       j:=ib;
       mb:=strtofloat(SgTras.Cells[1+ib,k]);
       end;
    end;
  ga2:=mb/k;
  str(ga2:8:4,st);
  SgTras.Cells[1+SgMatr.ColCount,k]:=FloatToStr(ga2);
  For ib:=1 to k-1 do
    if ga2<=StrToFloat(SgTras.Cells[1+SgMatr.ColCount,ib]) then
      ga2:=StrToFloat(SgTras.Cells[1+SgMatr.ColCount,ib]);
  str(ga2:8:4,st);
  SgTras.Cells[2+SgMatr.ColCount,k]:=st;
  SgTras.Cells[3+SgMatr.ColCount,k]:=IntToStr(j);
  mb:=0;
  For ib:=1 to SgMatr.RowCount-1 do
    begin
    if k<>1 then
    sb:=StrToint(SgTras.Cells[3+SgMatr.ColCount+ib,k-1])
    else
    sb:=0;
    SgTras.Cells[3+SgMatr.ColCount+ib,k]:=IntToStr(StrToInt(sgmatr.Cells[j,ib])+sb);;
    if mb<=strtofloat(SgTras.Cells[3+SgMatr.ColCount+ib,k]) then
       begin
       i:=ib;
       mb:=strtofloat(SgTras.Cells[3+SgMatr.ColCount+ib,k]);
       end;
    end;
  ga1:=mb/k;
  str(ga1:8:4,st);
  SgTras.Cells[SgMatr.ColCount*2+3,k]:=FloatToStr(ga1);
  For ib:=1 to k-1 do
    if ga1>=StrToFloat(SgTras.Cells[SgMatr.ColCount*2+3,ib]) then
      ga1:=StrToFloat(SgTras.Cells[SgMatr.ColCount*2+3,ib]);
  str(ga1:8:4,st);
  SgTras.Cells[SgMatr.ColCount*2+4,k]:=st;
  dk:=abs(ga2-ga1);
  Str(dk:8:4,st);
  SgTras.Cells[SgMatr.ColCount*2+5,k]:=st;

  end;
  for jb:=1 to SgMatr.RowCount-1 do
    begin
    kb:=0;
    For ib:=1 to k do
      if jb=StrToInt(SgTras.Cells[1,ib]) then
        inc(kb);
    dk:=kb/k;
    str(dk:8:4,st);
    sgstrat.Cells[1,jb]:=st;
    end;
  for jb:=1 to SgMatr.RowCount-1 do
    begin
    kb:=0;
    For ib:=1 to k do
      if jb=StrToInt(SgTras.Cells[3+SgMatr.ColCount,ib]) then
        inc(kb);
    dk:=kb/k;
    str(dk:8:4,st);
    sgstrat.Cells[2,jb]:=st;
    end;
end;

end.
