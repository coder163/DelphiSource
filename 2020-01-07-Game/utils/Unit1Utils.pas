unit Unit1Utils;

interface

type
  TPublicUtil = class
    class function GetNumberWithRound(Min, Max: Integer): Integer;
  end;

implementation

{ TPublicUtil }

{*------------------------------------------------------------------------------

  在指定范围获取一个随机数

  @param Min 范围起始值

  @param Max  范围的结束值

  @return 返回的随机数
-------------------------------------------------------------------------------}
class function TPublicUtil.GetNumberWithRound(Min, Max: Integer): Integer;
begin
  //初始化随机种子
  Randomize;

  Result := Random(Max) mod (Max - Min + 1) + Min;

end;

end.

