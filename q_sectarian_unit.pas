unit q_sectarian_unit;

interface
uses player_unit, quest_unit, market_unit;

procedure sectarian_start (var p : TPlayer); 
procedure sectarian_init(var quest : TQuest);

implementation
  
  
  
  
  
procedure sectarian_init(var quest : TQuest);
begin
  quest.name := 'Сектанты';
  quest.start_point := sectarian_start;
end;

end.