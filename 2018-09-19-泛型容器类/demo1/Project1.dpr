program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Generics.Collections,
  System.SysUtils;

{

泛型的参考书籍：Delphi2010语法手册

1、什么是泛型
    广泛数据类型

2、为什么使用泛型
      1、为了避免在程序中的数据类型强制转换

      2、在容器中我们使用数据类型更为灵活

3、怎么使用泛型
    <T>

4、泛型的使用场景

    1、泛型容器



  }

type
  TStringArr = array of string;

  TNumberArr = array of Integer;

  TArrayss<A> = array of A;

  TPerson = class
  end;

  TStudent<T> = class
  end;

var
  StringArr: TStringArr;
  NumberArr: TNumberArr;
  Arrayss: TArrayss<Integer>;

var
  I: Integer;
  Ss: TArray<string>;

begin
  StringArr := ['aa', 'bb'];
  NumberArr := [11, 22, 33];
  Arrayss := [66, 77, 88];

  for I := Low(Arrayss) to High(Arrayss) do
    writeln(Arrayss[i]);

  TStudent<TPerson>.Create;
  TStudent<TPerson>.Create;


  Readln;
end.

