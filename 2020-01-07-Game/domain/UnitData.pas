unit UnitData;

{*------------------------------------------------------------------------------
  @author  侯叶飞
  @version 2020/01/29 1.0 Initial revision.
  @comment 存储图形数据的结构

  每一种图形有4个方格组成

    数组(长度应该是4)   你可以自己定义数组，也可以使用系统(Delphi)自带的

    array 0...3 of TPoint       TArray<T>           array  of T

    使用TList<T>

  每一种图形由4对坐标组成
        我们使用TPoint来表示坐标，这个结构体本身就有两个字段是X,Y

        4对坐标需要存储到一个容器，TList<T>

  TList<TList<TPoint>>
-------------------------------------------------------------------------------}
interface

uses
  System.Types, System.Generics.Collections;

type
  TGameData = class
  private
    ActList: TList<TList<TPoint>>;  //图形列表

    Points: Tlist<Tpoint>;   //我们每一种图形的数据
  public

    //该函数因为是类函数，所以不需要通过该类对象进行调用
    function GetActByIndex(ActIndex: Integer): TList<TPoint>;
    constructor Create(); overload;
  end;

type
  //该数据类型表示存储已经到达边界的方格的地图数据
  TGameMap = array[0..17] of array[0..17] of Boolean;

implementation





{ TGameData }

{*------------------------------------------------------------------------------
  根据编号(索引)返回对应的图形数据

  @param ActIndex  图形编号，取值范围0---6
  @return  指定的图形数据
-------------------------------------------------------------------------------}

constructor TGameData.Create;
begin
  //创建列表对象
  ActList := TList<TList<TPoint>>.Create;
  //创建图形数据
  Points := TList<TPoint>.Create();
  //一字型
  Points.Add(TPoint.create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(8, 0));
  Points.Add(TPoint.Create(9, 0));
  //将该图形的数据存入列表
  ActList.Add(Points);
  Points := TList<TPoint>.Create();
  //T字型
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(8, 0));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
  //L字型
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(5, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(5, 1));
  ActList.Add(Points);
  //Z字型
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(5, 1));
  Points.Add(TPoint.Create(6, 1));
  ActList.Add(Points);
  //反Z字型
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(5, 0));
  Points.Add(TPoint.Create(6, 1));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
  // 丁 字型
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(5, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
  //田字型
  Points := TList<TPoint>.Create();
  Points.Add(TPoint.Create(6, 0));
  Points.Add(TPoint.Create(7, 0));
  Points.Add(TPoint.Create(6, 1));
  Points.Add(TPoint.Create(7, 1));
  ActList.Add(Points);
end;

function TGameData.GetActByIndex(ActIndex: Integer): TList<TPoint>;
begin

  Result := ActList.Items[ActIndex];
end;

initialization


end.

