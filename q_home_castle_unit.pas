unit q_home_castle_unit;

interface
uses player_unit, quest_unit, market_unit, bank_unit;

procedure home_castle_start (var p : TPlayer); 
procedure home_castle_init (var quest : TQuest);

implementation
  var
    choice : integer;
  procedure home_castle_story (p : TPlayer);
    begin
      writeln('Добро пожалочать в замок Хэйлскордж');
      writeln('Это ваша старт лока');
      //writeln('');                      ДОПИСАТЬ ОПИСАНИЕ ГОРОДА!!!
    end;
    
  procedure bank_check (p : TPlayer);
    begin
      if GBank.bank_is_open = 0 then
        writeln('4● Казна (Закрыто)')
      else 
        writeln('4● Казна');
    end;
      
    
  procedure home_castle_began (p : TPlayer);
    begin
      writeln('Цифра = месту куда вы хотите отправиться');
      writeln('1● Магазин продовольствий');
      writeln('2● Таверна '); // Все квесты, награда больше 
      writeln('3● Гильдии '); // Оперделённые квесты, награда меньше, но современем награда может стать больше чем в Таверне  
      bank_check(p);
      writeln('5● Площадь(Закрыто)');
      writeln('6● Магазин оружейник(Закрыто)');
      write('Введите цифру :');
      readln (choice);
    end;
    
  procedure home_castle_guild (p : TPlayer);
    begin
      writeln('Добро пожаловать в разде гильдии');
      writeln('Введите цифру гильдии');
      writeln('1● Кузнецов');
      writeln('2● Убийц');
      writeln('3● Торговцев');
    end;
     
  procedure home_castle_start (var p : TPlayer); 
    begin
      home_castle_story (p);
      
      home_castle_began (p);
   
      case choice of 
      1 : market(p);
     // 2 : tavern(p);
     // 3 : guild(p);
      4 : bank(p);
     // 5 : square(p);
     // 6 : gunsmith(p);
      end;
      
  {    case choice of 
        1 : procedure guild_blacksmith(p);
        2 : procedure guild_assassins(p);
        3 : procedure guild_vendor(p);
      end;
  }
    end;
  
  procedure home_castle_init(var quest : TQuest);
  begin
    init_bank();
    quest.name := 'Мейн(Тест)';
    quest.start_point := home_castle_start;
  end;
  
end.

