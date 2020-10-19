unit q_nomad_unit;

interface
uses player_unit, quest_unit, market_unit;

procedure nomad_start (var p : TPlayer); 
procedure nomad_init(var quest : TQuest);

implementation
var
  answer : char;
  hit : integer;
  run : integer;
procedure nomad_bandit(var p : TPlayer);
begin 
  write ('Бандит видет вас и направляется к вам. Вы хотите выстрелить в него (ваши патроны: ', p.ammo,')? (y/n): ');
  readln (answer);
  if answer = 'y' then
    begin
    if p.ammo > 0 then
    begin
     p.ammo := p.ammo - 1;
     hit := random (100) + 1;
     case hit of
      1..30 : 
        begin
         writeln('Вы попали в голову бандита, он умер');
         writeln('Вы нашли немного золота и патронов ');
         p.ammo := p.ammo + 3;
         p.money := p.money + 400; 
        end;
      31..90 : 
        begin
          writeln('Вы ранили бандита и он сбежал');
        end;
      91..100 : 
        begin
          writeln('Бандит выстрелил в вас первый, вы умерли' );
          p.hp := -1 ;
        end;
      end;
    end
    else 
     begin
       writeln('Бандит вас ограбил, избил и скрылся');
       writeln('Вы пролежали без сознания 1 день');
       p.ammo := 0;
       p.food := 0;
       p.money := 0;
       p.hp := p.hp - 15 ;
       p.time := p.time - 1;
     end 
  end
  else
  begin
    writeln('Бандит стреляет в вас, ваше здоровье уменьшилось (-15)');
    p.hp := p.hp - 15;
    run := random(100) + 1 ;
    write('Вы хотит попытаться убежать ? (y/n) : ' );
    readln(answer); 
    if (answer = 'y') or (answer = 'н') then
    begin
      case run of
        1..25 :
         begin
           writeln('Вы убежали от бандита ');
         end;
        26..94 :
         begin
           writeln('Вы убежали от бандита, но он вас ранил (-15)');
           p.hp := p.hp - 15;
         end
        else
         begin
           writeln('Вас пристрелили на месте ');
           p.hp := -1 ;
         end;
      end;
    end
    else 
      begin
        {ДОПИСАТЬ KEKW}  
      end;
  end;
end;

procedure nomad_trader(var p : TPlayer);
begin
  write('Хотите купить у него что нибудь ? (y/n): ');
  readln(answer);
  if answer = 'y' then 
  begin  
    market(p);
  end
  else
  begin
   writeln('Вы идёте дальше'); 
  end;
end;

procedure nomad_houseless (var p : TPlayer);
var
  nomad_gold : integer;
begin
  writeln('Вы видете что у нищего немного есть монет, он просит милостыню ');
  write('Вы хотите дать ему денег или нет? (y/n): ');
  readln(answer);
  if answer = 'y' then
    begin
      write('Сколько вы хотите дать ему золота: ');
      readln(nomad_gold);
      if (p.money > nomad_gold) and (nomad_gold > 0) then
        begin
          writeln('У вас уменьшилось золота, но увеличилась репутация (5);');
          p.reputation := p.reputation + 5;
          p.money :=  p.money - nomad_gold;
        end
        else 
        begin
          writeln('У вас нет столько денег');
        end;
    end; 
end;

procedure nomad_start (var p : TPlayer); 
var
  nomad_type : integer;
begin
  writeln('По дороге вам встретился путник, ');
  nomad_type := random (3) + 1;
  case nomad_type of
    1 : 
      begin
        writeln('Вы встретили бандита, вам придётся защищаться');
        nomad_bandit(p);
      end;
    2 : 
      begin
        writeln('Вы встретили торговца');
        nomad_trader(p);
      end;
    3 :
      begin
        writeln('Вы встретили нищего');
        nomad_houseless(p);  
      end;
  end;
end;  

procedure nomad_init(var quest : TQuest);
begin
  quest.name := 'Встреча';
  quest.start_point := nomad_start;
end;







end.