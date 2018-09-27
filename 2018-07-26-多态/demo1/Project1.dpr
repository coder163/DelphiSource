program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{*------------------------------------------------------------------------------


什么是多态
        封装、继承、多态

        一类事物以多种形态存在，例如：动物类和狗类、猫类的关系

        前提：两个类具备继承(派生)和实现这两种关系的一种

        具体体现：父类接收或指向其子类对象

有什么用
      提高代码的复用性,方便我们对代码进行解耦(类和类之间不要出现直接的依赖关系)



怎么使用

-------------------------------------------------------------------------------}
uses
    System.SysUtils,
    Unit1 in 'Unit1.pas';

//向上转型：把子类对象的类型转换成了父类的数据类型
procedure ShowAimalRun(Aimal: TAimal);
var
    Dog: TDog;
begin
    //运行时的数据类型
    Aimal.Run;
    //向下转型：把父类对象的类型转换成子类的数据类型
    if Assigned(Dog) then begin
        Writeln('是空值');
    end;

    if Aimal.ClassName = 'TDog' then begin
        //强制类型转换
        Dog := TDog(Aimal);
        Dog.LookDoor;
    end;

    //判断一个对象是否和一个类型兼容
    if Aimal is TDog then begin
        Dog := Aimal as TDog;

        Dog.LookDoor;
    end;

end;

begin

    ShowAimalRun(TCat.Create);
    Readln;
end.

