unit glavnaya;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, Vcl.OleCtrls, SHDocVw, System.StrUtils,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.MPlayer, System.Generics.Collections, Vcl.Menus, shellAPI;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    panel1: TPanel;
    ComboBox1: TComboBox;
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    Button2: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Button4: TButton;
    Image2: TImage;
    Image3: TImage;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    Panel3: TPanel;
    WebBrowser2: TWebBrowser;
    Image4: TImage;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    Button5: TButton;
    Button6: TButton;
    MediaPlayer1: TMediaPlayer;
    Image5: TImage;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure RadioGroup5Click(Sender: TObject);
    procedure RadioGroup6Click(Sender: TObject);
    procedure RadioGroup7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  f: TextFile;
  s: string;
  Nvern, ball, totalQuestions, Flags: integer;

implementation

{$R *.dfm}
uses zastavka;

procedure TForm1.Button1Click(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/A_Nikolaev_Samouchitel_igry_na_shestistrunnoy_gi_1.html');
    1: webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/S_Popov_-_Muzykalnoe_i_applikaturnoe_myshlenie.html');
    2: webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/Shkola_igry_na_shestistrunnoy_gitare_Ivanov-Krams.html')
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  speedbutton1.Visible := true;
  speedbutton3.Visible := true;
  speedbutton2.Visible := true;
  panel1.Visible := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  percent: Double;
begin
  //Если выбран вариант ответа и не достигнут конец файла
  if (RadioGroup2.ItemIndex > -1) and (not Eof(f)) then
  begin
    if RadioGroup2.ItemIndex = Nvern-1 then ball := ball + 1; //Если выбранный вариант соответствует
    RadioGroup2.Items.Clear; //номеру верного ответа то балл прибавляется
    Repeat //и очищается поле для следующего вопроса
      if (s[1] = '-') then
      begin
        Delete(s, 1, 1);
        RadioGroup2.Caption := s;
        Inc(totalQuestions); // Увеличиваем общее количество вопросов
      end
      else if s[1] = '*' then
      begin
        Delete(s, 1, 1);
        Nvern := StrToInt(s);
      end
      else
        RadioGroup2.Items.Add(s);
      Readln(f, s);
      Label1.Caption := s;
    until (s[1] = '-') or (Eof(f));
  end
  //Если конец файла достигнут, значит вопросы закончились
  else if Eof(f) then
  begin
    Delete(s, 1, 1);
    Nvern := StrToInt(s);
    if RadioGroup2.ItemIndex = Nvern-1 then ball := ball + 1;
    percent := (ball / totalQuestions) * 100;
    radiogroup2.Enabled := false;
    Button2.Enabled := true;
    label2.Visible := true;
    Label2.Caption := Format('Правильных ответов: %.2f%%', [percent]); // Вывод процента правильных ответов
    CloseFile(f);
    label2.Visible := true;
    Button3.Enabled := False; //кнопка становится недоступной в завершении проекта
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  panel2.Visible := false;
  speedbutton1.Visible := true;
  speedbutton3.Visible := true;
  speedbutton2.Visible := true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 radiogroup3.Visible:=true;
 radiogroup4.Visible:=false;
 radiogroup5.Visible:=false;
 radiogroup6.Visible:=false;
 radiogroup7.Visible:=false;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  panel3.Visible := false;
  speedbutton1.Visible := true;
  speedbutton3.Visible := true;
  speedbutton2.Visible := true;
  MediaPlayer1.enabled:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/S_Popov_-_Muzykalnoe_i_applikaturnoe_myshlenie.html');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  form2.ShowModal;
  webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/S_Popov_-_Muzykalnoe_i_applikaturnoe_myshlenie.html');
  Label3.Caption := 'Используйте кнопки чтобы' + #13#10 + '     управлять музыкой';
end;


procedure TForm1.N10Click(Sender: TObject);
begin

webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/A_Nikolaev_Samouchitel_igry_na_shestistrunnoy_gi_1.html');
end;

procedure TForm1.N11Click(Sender: TObject);
begin

webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/S_Popov_-_Muzykalnoe_i_applikaturnoe_myshlenie.html');
end;

procedure TForm1.N12Click(Sender: TObject);
begin

webbrowser1.Navigate(extractFilePath(paramstr(0))+'теория/Shkola_igry_na_shestistrunnoy_gitare_Ivanov-Krams.html')
end;

procedure TForm1.N2Click(Sender: TObject);
begin
ShellExecute(0,Pchar('Open'),PChar('help.chm'),nil,nil,SW_SHOW);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel1.Visible := true;
  panel2.Visible := false;
  panel3.Visible := false;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel2.Visible := true;
  panel1.Visible :=false;
  panel3.visible:= false;
  radiogroup1.itemindex := -1;
  radiogroup2.itemindex := -1;
  radiogroup1.enabled := true;
  radiogroup2.enabled := true;
  radiogroup2.items.Clear;
  button3.Enabled := true;
  label2.visible := false;
  radiogroup2.caption := 'Ответьте на вопросы:';
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel3.Visible := true;
  panel2.Visible :=false;
  panel1.Visible := false;
  webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\Добро пожаловать в Guitar Master.htm');
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel2.Visible := true;
  radiogroup1.itemindex := -1;
  radiogroup2.itemindex := -1;
  radiogroup1.enabled := true;
  radiogroup2.enabled := true;
  radiogroup2.items.Clear;
  button3.Enabled := true;
  label2.visible := false;
  radiogroup2.caption := 'Ответьте на вопросы:';
  AssignFile(f, 'easy.txt'); // связывается с разными файлами
    Reset(f);         // Открываем файл для чтения
  Readln(f, s);     // Считываем первую строку из файла
  ball := 0;        // изначально количество баллов 0
  totalQuestions := 0; // изначально количество вопросов 0
  RadioGroup2.Items.Clear; // Очищаем предыдущие элементы
  radiogroup1.Itemindex:= 0;
  radiogroup1.Enabled :=false;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel2.Visible := true;
  radiogroup1.itemindex := -1;
  radiogroup2.itemindex := -1;
  radiogroup1.enabled := true;
  radiogroup2.enabled := true;
  radiogroup2.items.Clear;
  button3.Enabled := true;
  label2.visible := false;
  radiogroup2.caption := 'Ответьте на вопросы:';
  AssignFile(f, 'easy.txt'); // связывается с разными файлами
    Reset(f);         // Открываем файл для чтения
  Readln(f, s);     // Считываем первую строку из файла
  ball := 0;        // изначально количество баллов 0
  totalQuestions := 0; // изначально количество вопросов 0
  RadioGroup2.Items.Clear; // Очищаем предыдущие элементы
  radiogroup1.Itemindex:= 1;
  radiogroup1.Enabled :=false;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel2.Visible := true;
  radiogroup1.itemindex := -1;
  radiogroup2.itemindex := -1;
  radiogroup1.enabled := true;
  radiogroup2.enabled := true;
  radiogroup2.items.Clear;
  button3.Enabled := true;
  label2.visible := false;
  radiogroup2.caption := 'Ответьте на вопросы:';
  AssignFile(f, 'easy.txt'); // связывается с разными файлами
    Reset(f);         // Открываем файл для чтения
  Readln(f, s);     // Считываем первую строку из файла
  ball := 0;        // изначально количество баллов 0
  totalQuestions := 0; // изначально количество вопросов 0
  RadioGroup2.Items.Clear; // Очищаем предыдущие элементы
  radiogroup1.Itemindex:= 2;
  radiogroup1.Enabled :=false;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel2.Visible := true;
  radiogroup1.itemindex := -1;
  radiogroup2.itemindex := -1;
  radiogroup1.enabled := true;
  radiogroup2.enabled := true;
  radiogroup2.items.Clear;
  button3.Enabled := true;
  label2.visible := false;
  radiogroup2.caption := 'Ответьте на вопросы:';
  AssignFile(f, 'easy.txt'); // связывается с разными файлами
    Reset(f);         // Открываем файл для чтения
  Readln(f, s);     // Считываем первую строку из файла
  ball := 0;        // изначально количество баллов 0
  totalQuestions := 0; // изначально количество вопросов 0
  RadioGroup2.Items.Clear; // Очищаем предыдущие элементы
  radiogroup1.Itemindex:= 3;
  radiogroup1.Enabled :=false;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  RadioGroup1.Enabled := False; // Выбор варианта становится недоступен
  RadioGroup2.Enabled := True;  // Доступным становится поле с вопросом
  Button1.Enabled := True;      // Кнопка Далее

  case RadioGroup1.ItemIndex of // В зависимости от выбранного варианта переменная f
    0: AssignFile(f, 'easy.txt'); // связывается с разными файлами
    1: AssignFile(f, 'middle.txt');
    2: AssignFile(f, 'hard.txt');
    3: AssignFile(f, 'nevozmojno.txt');
  end;

  Reset(f);         // Открываем файл для чтения
  Readln(f, s);     // Считываем первую строку из файла
  ball := 0;        // изначально количество баллов 0
  totalQuestions := 0; // изначально количество вопросов 0

  RadioGroup2.Items.Clear; // Очищаем предыдущие элементы

  repeat
    if AnsiStartsStr('-', s) then
    begin
      Delete(s, 1, 1);
      RadioGroup2.Caption := s;
      Inc(totalQuestions); // Увеличиваем общее количество вопросов
    end
    else if AnsiStartsStr('*', s) then
    begin
      Delete(s, 1, 1);
      Nvern := StrToInt(s);
    end
    else
      RadioGroup2.Items.Add(s); // Иначе это вариант ответа

    Readln(f, s); // Считываем следующую строку из файла
  until AnsiStartsStr('-', s) or Eof(f); // Считывание и отправление вариантов ответов в RadiGroup до тех пор
                                        // пока не достигнут следующий вопрос или конец файла
end;

procedure TForm1.RadioGroup3Click(Sender: TObject);
begin

  case RadioGroup3.ItemIndex of // В зависимости от выбранного варианта переменная f
    0:begin
    radiogroup3.Visible:=false;
    radiogroup4.Visible:=true;
    radiogroup5.Visible:=false;
    radiogroup6.Visible:=false;
    radiogroup7.Visible:=false;
    end;
    1:begin
    radiogroup3.Visible:=false;
    radiogroup4.Visible:=false;
    radiogroup5.Visible:=true;
    radiogroup6.Visible:=false;
    radiogroup7.Visible:=false;
    end;
    2:begin
    radiogroup3.Visible:=false;
    radiogroup4.Visible:=false;
    radiogroup5.Visible:=false;
    radiogroup6.Visible:=true;
    radiogroup7.Visible:=false;
    end;
    3:begin
    radiogroup3.Visible:=false;
    radiogroup4.Visible:=false;
    radiogroup5.Visible:=false;
    radiogroup6.Visible:=false;
    radiogroup7.Visible:=true;
    end;
  end;


end;

procedure TForm1.RadioGroup4Click(Sender: TObject);
begin
MediaPlayer1.enabled:=true;
case RadioGroup4.ItemIndex of
0:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\student\Let-It-Go-.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Let-It-Go-.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Frozen-150x150.jpeg');
end;
1:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\student\M.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Metallica_nothing_else_matters.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\artworks-000332927889-8tjrwe-t500x500.jpg');
end;
2:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\student\Mission-Impossible.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Mission-Impossible.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\MissionImpossiblePoster-202x300.jpg');
end;
3:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\student\Pirates-of-the-Carribean-(Simple).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Pirates-of-the-Carribean-Simple.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\pirates-of-the-caribbean-206x300.jpg');
end;
4:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\student\Sponge-bob-_Easy_.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Sponge-bob-Easy.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Sponge-Bob.jpg');
end;
end;
MediaPlayer1.Open;
end;

procedure TForm1.RadioGroup5Click(Sender: TObject);
begin
MediaPlayer1.enabled:=true;
case RadioGroup5.ItemIndex of
0:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\beginner\Eye-of-the-tiger.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Eye-of-the-tiger.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Eye-of-the-tiger-300x225.jpg');
end;
1:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\beginner\Kacheli.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Kacheli.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Приключения_электроника_постер-66x66.jpg');
end;
2:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\beginner\Kakoe-nebo-goluboe.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Kakoe-nebo-goluboe.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\kakoe-nebo-300x225.jpg');
end;
3:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\beginner\Pink-Panter.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Pink-Panter.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Pink-Panther-200x257.jpg');
end;
4:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\beginner\Titanic-(Easy).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Titanic-Easy.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Titanic.jpg');
end;
end;
MediaPlayer1.Open;
end;

procedure TForm1.RadioGroup6Click(Sender: TObject);
begin
MediaPlayer1.enabled:=true;
case RadioGroup6.ItemIndex of
0:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\upmiddle\Bohemian-Rhapsody-(fingerstyle-cover).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Bohemian-Rhapsody-fingerstyle-cover.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Queen-300x300.jpg');
end;
1:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\upmiddle\Family-Guy.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Family-Guy.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\family-guy-206x300.jpg');
end;
2:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\upmiddle\Moonlight-Sonata-(Beethoven).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Moonlight-Sonata-Beethoven.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Bethoveen.jpg');
end;
3:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\upmiddle\Super-Mario-(In-D).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Super-Mario-In-D.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Mario-300x168.jpg');
end;
4:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\upmiddle\The-Games-of-Thrones-(PickStyle).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\The-Games-of-Thrones-PickStyle.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Game-of-thrones.jpg');
end;
end;
MediaPlayer1.Open;
end;

procedure TForm1.RadioGroup7Click(Sender: TObject);
begin
case RadioGroup7.ItemIndex of
0:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\hard\Hotel-California.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Eagles-Hotel-California.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Eagles.jpg');
end;
1:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\hard\Let-Her-Go-(fingerstyle).html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Let-Her-Go-fingerstyle.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\passenger-15676.jpg');
end;
2:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\hard\river-flows-in-you-_Easy-Fingerstyle_.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\river-flows-in-you-Easy-Fingerstyle.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Yurima-300x300.jpg');
end;
3:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\hard\See-you-again.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\See-you-again.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\see u again.jpg');
end;
4:
begin
webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\hard\Under_the_bridge.html');
MediaPlayer1.FileName := (extractFilePath(paramstr(0)) + 'songs\music\Under_the_bridge.mp3');
Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Red-Hot-300x225.jpg');
end;
   end;
MediaPlayer1.Open;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel1.Visible := true;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel2.Visible := true;
  radiogroup1.itemindex := -1;
  radiogroup2.itemindex := -1;
  radiogroup1.enabled := true;
  radiogroup2.enabled := true;
  radiogroup2.items.Clear;
  button3.Enabled := true;
  label2.visible := false;
  radiogroup2.caption := 'Ответьте на вопросы:';
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  speedbutton1.Visible := false;
  speedbutton3.Visible := false;
  speedbutton2.Visible := false;
  panel3.Visible := true;
  Image5.Picture.LoadFromFile(extractFilePath(paramstr(0)) + 'songs\img\Virtual-Guitar-Online-Virtual-Piano.png');
  webbrowser2.Navigate(extractFilePath(paramstr(0))+'songs\Добро пожаловать в Guitar Master.htm');
end;
end.

