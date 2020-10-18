program game;
uses type_unit, text_unit, market_unit, quest_unit;

var
  player : TPlayer;
  
BEGIN
  print_hello();
  
  init_player(player);
  
  print_market_hello();
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
