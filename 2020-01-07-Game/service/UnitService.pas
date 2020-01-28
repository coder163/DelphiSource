unit UnitService;
{*------------------------------------------------------------------------------
  @author  侯叶飞
  @version 2020/01/28 1.0 Initial revision.
  @comment  游戏的业务控制
-------------------------------------------------------------------------------}

interface

uses
  System.IOUtils, Winapi.Windows, Winapi.GDIPOBJ, Winapi.GDIPAPI;

type
  TGameSevice = class
  private
   //定义属性
    FHdc: HDC;
    //表示图片的编号
    FImageIndex: Integer;
  public
    //绘制图片
    procedure DrawImage(FileName: string; Width, Hegiht: Integer);
    //绘制背景
    procedure DrawBackGround(Width, Hegiht: Integer);

    //绘制窗口
    procedure DrawWindow(x, y, w, h: Integer);

    //构造方法，方法名相同，参数列表不同称为重载
    constructor Create(hdc: HDC); overload;
    constructor Create(); overload;
    //定义字段
    property GameHandle: HDC read FHdc write FHdc;
    property ImageIndex: Integer read FImageIndex write FImageIndex;
  end;

implementation

uses
  UnitConst;
{ TGameSevice }

constructor TGameSevice.Create(hdc: hdc);
begin
  GameHandle := hdc;
end;

constructor TGameSevice.Create;
begin
  inherited;
end;

procedure TGameSevice.DrawBackGround(Width, Hegiht: Integer);
var
  ImageList: TArray<string>;
begin
  //获取图片列表
  ImageList := TDirectory.GetFiles(UnitConst.BACK_GROUND_IMAGE);

  if ImageIndex >= Length(ImageList) then begin
    ImageIndex := 0;
  end;

  //选取图片列表中的某一个图片，展示在窗口
  DrawImage(ImageList[ImageIndex], Width, Hegiht);
end;

procedure TGameSevice.DrawImage(FileName: string; Width, Hegiht: Integer);
var
  //画笔
  Graphics: TGPGraphics;
  Image: TGPImage;
begin
  //载入我们的图片文件
  Image := TGPImage.Create(FileName);
  //将载入的图片绘制到指定的组件上(TImage)
  Graphics := TGPGraphics.Create(GameHandle);
  //绘制图片
  Graphics.DrawImage(Image, MakeRect(0, 0, Width, Hegiht));
  Graphics.Free;
  Image.Free;
end;

{*------------------------------------------------------------------------------
  绘制游戏窗口

  @param x 游戏窗口的X坐标
  @param y 游戏窗口的Y坐标
  @param w 游戏窗口的宽度
  @param h 游戏窗口的高度
-------------------------------------------------------------------------------}
procedure TGameSevice.DrawWindow(x, y, w, h: Integer);
var
  //画笔
  Graphics: TGPGraphics;
  img: TGPImage;
begin
  //载入我们的图片文件
  img := TGPImage.Create(UnitConst.GAME_WINDOW);
  //将载入的图片绘制到指定的组件上(TImage)
  Graphics := TGPGraphics.Create(GameHandle);
  //绘制图片
    // 左上角
  Graphics.DrawImage(img, MakeRect(x, y, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH), 0, 0, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitPixel);

    // 左侧竖线
  Graphics.DrawImage(img, MakeRect(x, y + UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, h - UnitConst.GAME_WINDOW_BORDER_WIDTH), 0, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth - (img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH), img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitPixel);

    // 左下角
  Graphics.DrawImage(img, MakeRect(x, y + h, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight), 0, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight, UnitPixel);

    // 底部中线
  Graphics.DrawImage(img, MakeRect(x + UnitConst.GAME_WINDOW_BORDER_WIDTH, y + h, w - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight), UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, img.GetHeight, UnitPixel);

    // 右下角
  Graphics.DrawImage(img, MakeRect(x + w, y + h, img.GetWidth, img.GetHeight), img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth, img.GetHeight, UnitPixel);
    // 右侧竖线
  Graphics.DrawImage(img, MakeRect(x + w, y + UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth, h - UnitConst.GAME_WINDOW_BORDER_WIDTH), img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitPixel);

    // 右上角
  Graphics.DrawImage(img, MakeRect(x + w, y, img.GetHeight, UnitConst.GAME_WINDOW_BORDER_WIDTH), img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH, 0, img.GetHeight, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitPixel);
    // 顶部中线
  Graphics.DrawImage(img, MakeRect(x + UnitConst.GAME_WINDOW_BORDER_WIDTH, y, w - UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH), UnitConst.GAME_WINDOW_BORDER_WIDTH, 0, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitPixel);

    // 中间
  Graphics.DrawImage(img, MakeRect(x + UnitConst.GAME_WINDOW_BORDER_WIDTH, y + UnitConst.GAME_WINDOW_BORDER_WIDTH, w - UnitConst.GAME_WINDOW_BORDER_WIDTH, h - UnitConst.GAME_WINDOW_BORDER_WIDTH), UnitConst.GAME_WINDOW_BORDER_WIDTH, UnitConst.GAME_WINDOW_BORDER_WIDTH, img.GetWidth - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, img.GetHeight - UnitConst.GAME_WINDOW_BORDER_WIDTH * 2, UnitPixel);
  Graphics.Free;
  img.Free;

end;

end.

