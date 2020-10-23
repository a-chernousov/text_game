unit player_unit;

interface
const
  DEFAULT_DAY_NUM = 5;
  
type TPlayer = record
  hp : integer; {default: 100 hp}
  ammo : integer; 
  food : integer;
  money : integer;{default: 1000$}
  time : integer;{default : 30} 
  reputation : integer;{default : 0} 
end;

procedure init_player(var p : TPlayer);
function player_is_alive (p : TPlayer) : boolean;
function player_time_is_over (p : TPlayer) : boolean;
procedure print_status(p : TPlayer);
procedure player_print_day (p : TPlayer); 
procedure player_day_is_over (var p : TPlayer);    
procedure player_print_score (p : TPlayer);
          
implementation

procedure init_player(var p : TPlayer);
begin  
  p.hp := 100;
  p.ammo := 0;
  p.food := 0;
  p.money := 1000;
  p.time := DEFAULT_DAY_NUM;
  p.reputation := 0;
  print_status(p);
end;

procedure print_status(p : TPlayer);
begin
  writeln('Игрок:', 
          ' Здоровье=', p.hp,
          ' Патроны=', p.ammo,
          ' Еда=', p.food,
          ' Деньги=',p.money,
          ' Репутация=', p.reputation);
end;

function player_is_alive (p : TPlayer) : boolean;
begin
  if p.hp > 0 then
  begin
    player_is_alive := true;
  end
  else 
  begin
    player_is_alive := false;
  end;
end;

function player_time_is_over (p : TPlayer) : boolean;
begin
  if p.time > 0 then
  begin
    player_time_is_over := false;
  end
  else
  begin
    player_time_is_over := true;
  end;
end;

procedure player_print_day (p : TPlayer); 
begin
  writeln('День ',DEFAULT_DAY_NUM - p.time + 1 );
end;

procedure player_day_is_over(var p : TPlayer); 
begin
  if p.food > 0 then
  begin  
    p.food := p.food - 1;
    writeln('День подошёл к концу, ваша еда уменьшилась (-1)');
  end
  else
  begin
    p.hp := p.hp -15;
    writeln('День подошёл к концу, вам нечего есть, ваше здоровье уменьшилось (-15)');
  end;
  
  p.time := p.time -1;
 
  print_status(p);
end;

procedure player_print_score (p : TPlayer);
var 
  score : integer;
begin
  score := p.ammo * 50 + p.food * 10 + p.money * 10 + p.reputation * 20;
  writeln('Ваши счёт составляет ', score);
end;

end.