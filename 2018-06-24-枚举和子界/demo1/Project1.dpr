program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{
  常量
    我们在一开始就定义好的一些值，以后在程序的运行过程中不允许改变，例如：圆周率

  枚举：常量集
    type
      枚举名=(标识符1,标识符2...)

}
uses
    System.TypInfo,
    System.SysUtils;

const
    YuanZhouLv: Double = 3.15;
    {常量的定义方式，可以不进行类型声明,编译器会根据具体值来决定常量的类型}
    YuanZhouLv2 = 3;

type
    {正常情况下枚举类型的索引是从0开始}
    EColors = (RED, GREEN, BLUE);

type
    EWeek = (SUN = 1, MON = 2, TUE = 3, WED = 4, THU = 5, FRI = 6, SAT = 7);

var
    {声明一个枚举类型的变量}
    Color: EColors;
    Week: EWeek;
    Eindex: Integer;
    Ename: string;
    Evalue: Integer;

{*------------------------------------------------------------------------------
  获取枚举中的单个元素

-------------------------------------------------------------------------------}
procedure Demo1();
begin
    Color := EColors.RED;
    Week := EWeek.MON;
    Writeln(Ord(Color), ',', Ord(Week));

end;

{*------------------------------------------------------------------------------

 使用循环遍历(挨个获取)枚举元素
-------------------------------------------------------------------------------}
procedure Demo2();
begin
    Eindex := 0;
    {遍历枚举}
    for Color := Low(EColors) to High(EColors) do begin

        Ename := GetEnumName(TypeInfo(EColors), Eindex);

        Evalue := GetEnumValue(TypeInfo(EColors), Ename);

        Writeln(Ename, ',', Evalue);

//        Eindex := Eindex + 1;
        //据说Delphi做过优化
        Inc(Eindex);
    end;
end;

begin
    Writeln(ord(EWeek.SUN));
    Readln;

end.

