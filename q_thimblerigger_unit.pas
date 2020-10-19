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

var
  answer : char;
  number_thimble : integer;
  thimble : integer;
  
procedure thimblerigger_game(var p : TPlayer);
begin
    
end;

procedure thimblerigger_start (var p : TPlayer); 
begin
  writeln('Вы попали в небольшой городок и на площади сидит старик.');
  writeln('Он зовёт вас поиграть в напёрстки, одна игра стоит 50 золота,'); 
  writeln('если выйграете, то получита 100 золота, хотите сыграть (ваши деньги ', p.money,')? (y/n) ');
  thimblerigger_rule(p);
  readln(answer);
  if (answer = 'y') then
    begin
      writeln ('Ставки приняты, ставок больше нет');
      thimble := random (3) + 1;
      writeln ('Старик поменял напёрстки местами, выбирете один из напёрстков');
      writeln('Напёрстки пронумерованны от 1 до 3, введите цифру напёрстка');
      readln(number_thimble);
      if number_thimble = thimble then
        begin
          writeln('Вы выйграли, дед отдал 100'); 
          p.money := p.money + 100;
        end
      else
        begin  
          if p.money >= 50 then
            begin  
              writeln('Вы проиграли ');
              p.money := p.money - 50
            end
          else
            begin
              writeln('Дед оказался мастером карате и избил вас ');
              writeln('Ваше здоровье уменьшилось на 20');
              p.hp := p.hp - 20;
            end;
        end;
    end
   else 
     begin
       writeln('Ваша репутация упала в глазах людей (-5) ');  
       p.reputation := p.reputation - 5;
     end;
  
end;   

procedure thimblerigger_init(var quest : TQuest);
begin
  quest.name := 'Напёрстки';
  quest.start_point := thimblerigger_start;
end;

end.

