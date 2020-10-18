program game;
uses player_unit, market_unit, quest_unit;

const 
  hello_string = 
  'Привет путник ты зашёл в текстовую игру ';
   
  market_hello_string =
  'Добро пожаловать на рынок ';
  
var
  player : TPlayer;

BEGIN
  writeln(hello_string);
  
  init_player(player);
  
  writeln(market_hello_string);
  market(player);
  writeln('Вы покидаете рынок'); 
  
  quest_init();
  
  while (player_is_alive(player)) and not(player_time_is_over(player)) do
  begin
    writeln();
    player_print_day(player);
    quest_random_start(player);
    player_day_is_over(player);
    readln();
  end;
  
  if not player_is_alive(player) then
  begin
    writeln('Вы проиграли');
  end
  else
  begin
    writeln('Поздравляю, вы остальсь живы');
    player_print_score(player);
    
  end;
END.
