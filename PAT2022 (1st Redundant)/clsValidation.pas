unit clsValidation;

interface

uses
  Windows, Messages, Dialogs, SysUtils, Variants, Classes, Controls, Forms,
  ADODB, DB;

type
  TValidation = class(Tobject)
  private
    { private declarations }

  public
    function IsValidEmail(Value: string): Boolean;
    function CheckAllowed(s: string): Boolean;
    function ValidateIDNEW(ID: String): Boolean;
    function IsPasswordCrazy(const s: AnsiString): Boolean;
    function TextValidation(sample: string): Boolean;
    function IsPhoneNumber(sPhoneNumber: string): Boolean;
  end;

implementation

function TValidation.IsPasswordCrazy(const s: AnsiString): Boolean;
const
  C_Upcase = 1;
  C_Locase = 2;
  C_Digit = 4;
  C_SpecSym = 8;
  C_All = C_Upcase or C_Locase or C_Digit or C_SpecSym;
var
  i, keys: integer;
begin

  if Length(s) < 9 then
  begin
    result := False;
    Exit;
  end;

  keys := 0;
  for i := 1 to Length(s) do
    case s[i] of
      'A' .. 'Z':
        keys := keys or C_Upcase;
      'a' .. 'z':
        keys := keys or C_Locase;
      '0' .. '9':
        keys := keys or C_Digit;
      '!', '#', '%', '&', '*', '@':
        keys := keys or C_SpecSym;
    end;

  result := keys = C_All;
end;

function TValidation.IsPhoneNumber(sPhoneNumber: string): Boolean;
var
  i: integer;
begin
  for i := 1 to Length(sPhoneNumber) do
  begin
    if NOT(Length(sPhoneNumber) = 10) OR NOT(sPhoneNumber[1] = '0') OR
      ((sPhoneNumber[i] < '0') OR (sPhoneNumber[i] > '9')) then
    begin
      result := False;
    end
    else
    begin
      result := true;
    end;
  end;
end;

function TValidation.ValidateIDNEW(ID: String): Boolean;
var
  oddValue, evenValue, i, CheckDigit: integer;
  evenString: String;
begin
  ValidateIDNEW := true;
  If Length(ID) = 13 then
  begin
    try
      i := 1;
      oddValue := 0;
      while i < 13 do
      begin
        // 1. Add all the digits in the odd positions (excluding last digit).
        oddValue := oddValue + StrtoInt(copy(ID, i, 1));
        i := i + 2;
      end;
      i := 2;
      evenString := '';
      while i < 13 do
      begin
        // 2. Move the even positions into a field and multiply the number by 2.
        evenString := evenString + copy(ID, i, 1);
        i := i + 2;
      end;
      evenString := InttoStr(StrtoInt(evenString) * 2);

      evenValue := 0;
      for i := 1 to Length(evenString) do
      begin
        // 3. Add the digits of the result in 2.
        evenValue := evenValue + StrtoInt(copy(evenString, i, 1));
      end;

      // 4. Add the answer in 1. to the answer in 3.
      i := oddValue + evenValue;

      // 5. Subtract the second digit in 4. from 10.
      CheckDigit := 10 - StrtoInt(copy(InttoStr(i), 2, 1));
      If CheckDigit > 9 then
        CheckDigit := 0;
      If copy(ID, 13, 1) <> InttoStr(CheckDigit) then
        ValidateIDNEW := False;
    except
      ValidateIDNEW := False;
    end;
  end
  else
    ValidateIDNEW := False;
end;

function TValidation.CheckAllowed(s: string): Boolean;
var
  i: integer;
begin
  result := False;
  for i := 1 to Length(s) do
  begin
    // illegal char - no valid address
    if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.', '+'])
    then
      Exit;
  end;
  result := true;
end;

function TValidation.IsValidEmail(Value: string): Boolean;
var
  i: integer;
  namePart, serverPart: string;
begin
  result := False;

  i := Pos('@', Value);
  if (i = 0) then
    Exit;

  if (Pos('..', Value) > 0) or (Pos('@@', Value) > 0) or (Pos('.@', Value) > 0)
  then
    Exit;

  if (Pos('.', Value) = 1) or (Pos('@', Value) = 1) then
    Exit;

  namePart := copy(Value, 1, i - 1);
  serverPart := copy(Value, i + 1, Length(Value));
  if (Length(namePart) = 0) or (Length(serverPart) < 5) then
    Exit; // too short

  i := Pos('.', serverPart);
  // must have dot and at least 3 places from end
  if (i = 0) or (i > (Length(serverPart) - 2)) then
    Exit;

  result := CheckAllowed(namePart) and CheckAllowed(serverPart);
end;

function TValidation.TextValidation(sample: string): Boolean;
var
  bFlag: Boolean;
  i: integer;
begin
  if Length(sample) <> 0 then
  begin
    i := 1;
    bFlag := true;
    while (i <= Length(sample)) AND (bFlag = true) do
    begin
      if not(upcase(sample[i]) in ['A' .. 'Z', ' ']) then
      begin
        bFlag := False;
      end;
      inc(i);
    end;
  end;
  result := bFlag;
end;

end.

