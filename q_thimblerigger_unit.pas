unit q_thimblerigger_unit;

interface
uses player_unit, quest_unit, market_unit;

procedure thimblerigger_start (var p : TPlayer); 
procedure thimblerigger_init(var quest : TQuest);

implementation
procedure thimblerigger_rule(p : TPlayer);
begin
  writeln('Правила: ');
  writeln('участвуют два человека: ведущий и игрок. У ведущего имеется три ');
  writeln('одинаковых непрозрачных напёрстка, под один из которых он прячет');
  writeln('маленький шарик, после чего быстро меняет напёрстки местами.');
  writeln('Затем игроку предлагается угадать, под каким из напёрстков находится шарик.');
end;

procedure thimblerigger_game(var p : TPlayer);
begin
    
end;

var
  answer : char;
  thimble : integer;
procedure thimblerigger_start (var p : TPlayer); 
begin
  writeln('Вы попали в небольшой городок и на площади сидит старик.');
  writeln('Он зовёт вас поиграть в напёрстки, хотите сыграть (ваши деньги ', p.money,')? (y/n): ');
  thimblerigger_rule(p);
  writeln('Одна игра стоит 50 золота, если выйграете, то получита 100 золота');
  readln(answer);
  if (answer = 'y') and (p.money >= 50) then
    begin
      p.money := p.money -50;
      writeln ('Ставки приняты, ставок больше нет');
      thimble := random (3) + 1;
      writeln ('Старик поменял напёрстки местами, выбирете один из напёрстков');
      writeln('Напёрстки пронумерованны от 1 до 3, введите цифру напёрстка');
      {!******************ДОПИСАТЬ***********************!}
    end;
  
end;   

procedure thimblerigger_init(var quest : TQuest);
begin
  quest.name := 'Напёрстки';
  quest.start_point := thimblerigger_start;
end;

end.

