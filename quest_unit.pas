unit quest_unit;

interface

uses player_unit;

const ARRAY_MAX_NUM = 100;

type TQuestStart = procedure(var p: TPlayer);

type TQuest = record
  name : string;
  start_point : TQuestStart;
end;

type TQuestArray = array [1..ARRAY_MAX_NUM] of TQuest;

type TQuestBank = record
  qbank : TQuestArray;
  quest_num : integer;
end;

var 
  quest_bank : TQuestBank;
  
procedure quest_init();  
procedure quest_random_start(var p : TPlayer);

implementation

uses q_hunt_unit, 
     q_nomad_unit, 
     q_thimblerigger_unit;
     {!Дописывать квесты СЮДААА!}

procedure  quest_random_start(var p : TPlayer);
var
  rnd : integer;
begin
  rnd := random(quest_bank.quest_num) + 1;
  writeln('*****************************************');
  writeln(quest_bank.qbank[rnd].name);
  quest_bank.qbank[rnd].start_point(p);
  writeln('*****************************************');
end;

procedure quest_init();
begin
  randomize();
  
  quest_bank.quest_num := 1;
  hunting_init(quest_bank.qbank[quest_bank.quest_num]);
  
  quest_bank.quest_num := quest_bank.quest_num + 1;
  nomad_init(quest_bank.qbank[quest_bank.quest_num]);
  
  quest_bank.quest_num := quest_bank.quest_num + 1;
  thimblerigger_init(quest_bank.qbank[quest_bank.quest_num]);
  
end;
  
end.