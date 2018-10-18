unit uUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  Dm_TLB, ComObj, ActiveX, ToolWin, ComCtrls;

  //讲DLL信息添加/删除到注册表
function OLERegister(sOleFileName: string; OleAction: Byte): Boolean;

//创建com对象(大漠对象)
function CreateComObjectFromDll(CLSID: TGUID; DllHandle: THandle): IUnknown;

implementation

function OLERegister(sOleFileName: string; OleAction: Byte): Boolean;
const
  RegisterOle = 1; //注册
  UnRegisterOle = 0; //卸载
type
  TOleRegisterFunction = function: HResult; //注册或卸载函数原型
var
  hLibraryHandle: THandle; //由LoadLibray返回的DLL或OCX句柄
  hFunctionAddress: TFarProc; //DLL或OCX中的函数句柄，由GetProAddress返回
  RegFunction: TOleRegisterFunction; //注册或卸载函数指针
begin
  Result := False;

  //打开文件，返回DLL或OCX句柄
  hLibraryHandle := LoadLibrary(PChar(sOleFileName));
  if (hLibraryHandle > 0) then //DLLakg OCX句柄正确
  try
    //返回注册或卸载函数指针
    if (OleAction = RegisterOle) then  //返回注册函数指针
    begin

      hFunctionAddress := GetProcAddress(hLibraryHandle, PAnsiChar('DllRegisterServer'))

    end
    else //返回卸载函数指针
      hFunctionAddress := GetProcAddress(hLibraryHandle, PAnsiChar('DllUnRegisterServer'));

    if (hFunctionAddress <> nil) then //判断注册或卸载函数是否存在
    begin

      RegFunction := TOleRegisterFunction(hFunctionAddress); //获取操作函数的指针

      if RegFunction >= 0 then  //执行注册或卸载操作，返回值>=0表示执行成功
      begin

        Result := True;
      end;

    end;
  finally
    FreeLibrary(hLibraryHandle); //关闭已打开的文件
  end;
end;

function CreateComObjectFromDll(CLSID: TGUID; DllHandle: THandle): IUnknown;
var
  Factory: IClassFactory;
  hr: HRESULT;
  DllGetClassObject: function(const CLSID, IID: TGUID; var Obj): HResult; stdcall;
begin
  DllGetClassObject := GetProcAddress(DllHandle, 'DllGetClassObject');
  if Assigned(DllGetClassObject) then begin
    hr := DllGetClassObject(CLSID, IClassFactory, Factory);
    if hr = S_OK then begin
      Factory.CreateInstance(nil, IUnknown, Result);
      //Factory._Release;
    end;
  end;
end;

end.

