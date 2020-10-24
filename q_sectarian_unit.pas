unit q_sectarian_unit;

interface 

uses player_unit, quest_unit, market_unit;

procedure sectarian_start (var p : TPlayer); 
procedure sectarian_init(var quest : TQuest);

type TSectarian_ctx = record
  numMeeting : integer;
end;

var 
  sect_ctx : TSectarian_ctx;



implementation
  
procedure sectarian_start (var p : TPlayer);
begin


  
end;  
    
procedure sectarian_init(var quest : TQuest);
begin
  quest.name := 'Сектанты';
  quest.start_point := sectarian_start;
  
  sect_ctx.numMeeting := 0;
  
end;

end.