unit TipoTelefone;

interface

uses
  System.SysUtils,
  TypInfo;

type
  TTipoTelefone = (COMERCIAL, RESIDENCIAL, CELULAR);

  TTipoTelefoneHelper = record helper for TTipoTelefone
    function ToString : String;
  end;

implementation

{ TTipoTelefoneHelper }

function TTipoTelefoneHelper.ToString: String;
begin
  Result := GetEnumName(TypeInfo(TTipoTelefone), Integer(Self));
end;

end.
