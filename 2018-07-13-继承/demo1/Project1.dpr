program Project1;

{$APPTYPE CONSOLE}

{$R *.res}
{*------------------------------------------------------------------------------

 派生(继承)：
        派生指类和类之间的关系，继承更多的是指对象和对象之间的关系

 特点
        1、提高代码的复用  TForm

        2、一旦产生派生关系之后，他们就具备了多态的特性

        3、Delphi中是单继承，但是可以是多层继承

 继承中的构造方法
        1、定义

 重写

 继承中的访问权限




-------------------------------------------------------------------------------}
uses
    System.SysUtils,
    uExtends in 'uExtends.pas';

var
    Dog: TDog;

begin

    Dog := TDog.Create();

    Dog.GetName;
    Readln;
end.

