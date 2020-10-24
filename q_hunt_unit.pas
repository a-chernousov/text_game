unit q_hunt_unit;

interface
uses player_unit, quest_unit;

procedure hunting_start(var p : TPlayer); 
procedure hunting_init(var quest : TQuest);
  
implementation

procedure hunting_start(var p : TPlayer);
var
  hit : integer;
  answer : char;
begin
  write('Вы нашли кабана. Хотите поохотиться (ваши патроны: ', p.ammo,')? (y/n): ');
  readln (answer);
  if answer = 'y' then
   begin
     hit := random(100) + 1;
     if p.ammo > 0 then
     begin
       p.ammo := p.ammo - 1;
       case hit of
         36..100 : 
           begin
            writeln('Вы попали!!!');
            writeln('Вы получили немного мяса (+5)');
            p.food := p.food + 5;
           end;
         9..35 :
           begin
             writeln('Вы промазали');
             writeln('Кабан вас ранил и убежал (-7 hp)');
             p.hp := p.hp - 7;
           end;
         1..8 :
           begin
             writeln('Вы промазали');
             writeln('К несчастью это был матёрый кабан, он откусил вам голову');
             p.hp := -1;
           end;
       end;
     end
     else 
     begin
       case hit of
       80..100 : 
         begin
           writeln('Вы задушили кабана');
           writeln('Вы получили немного мяса (+5)');
           p.food := p.food + 5;
         end;
       8..79 :
         begin
           writeln('Вы хотели убить кабана голыми руками, СЕРЬЁЗНО!!! (-50 hp)');
           p.hp := p.hp - 50 ; 
         end
       else
         begin
           writeln('К несчастью это был матёрый кабан, он откусил вам голову');
           p.hp := 0;
         end;
       end;  
     end;
   end
end;

procedure hunting_init(var quest : TQuest);
begin
  quest.name := 'Охота';
  quest.start_point := hunting_start;
end;

end.