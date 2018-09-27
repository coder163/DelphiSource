unit uExtends;

interface

type
    {定义一个类}
    TAnimal = class
    private
        FTiZhong: Integer;
    protected
        FName: string;
    public
        {定义一个构造方法}
        constructor Create(FTiZhong: Integer);

        {定义属性}
        property TiZhong: Integer read FTiZhong write FTiZhong;

        {声明一个虚方法}
        procedure GetName(); virtual;
    end;

    {定义一个派生类}
    TDog = class(TAnimal)
    public
        constructor Create();
        {重写、覆盖父类中的虚方法}
        procedure GetName(); override;
    end;

implementation

{ TAnimal }

constructor TAnimal.Create(FTiZhong: Integer);
begin
    Self.FTiZhong := FTiZhong;
end;

procedure TAnimal.GetName;
begin
    Writeln('动物类的方法');
end;

{ TDog }

constructor TDog.Create;
begin

    Writeln('狗类');
    //直接调用父类 方法
    inherited Create(1001);
end;

procedure TDog.GetName;
begin
    inherited;
    Writeln('TDog.GetName的方法');

end;

end.

