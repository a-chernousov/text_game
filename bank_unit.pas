unit bank_unit;

interface
uses player_unit;
 
type TBank = record
  bet : real;
  bank_is_open : integer;
  storage_time : integer;
  contribution : integer;
end;

var
  gbank : TBank;
procedure init_bank();

procedure bank (var p : TPlayer);

implementation
 
procedure count_bank (var p : TPlayer);
var
  i : integer;
begin
  for i := 1 to (GBank.storage_time - p.time) do
  begin  
    GBank.contribution := round(GBank.contribution * GBank.bet);
  end;
end;

procedure began_bank(var p : TPlayer);
begin
  if GBank.bank_is_open = 0 then
    write('0')
  else 
    begin
    count_bank(p);
    writeln(GBank.contribution);
    end;
end;
 
procedure init_bank();
begin
  GBank.bank_is_open := 0;
  GBank.bet := 1.15;
  GBank.contribution := 0 ;
  GBank.storage_time := 0;
end;

procedure invest(var p : TPlayer);
  var
    a : integer;
  begin
    write('Введить сумму которую хотите вложить :  ' );
    readln(a);
    if a > p.money then
      begin
        writeln('У вам нет такой суммы введите другую');
        invest(p);
      end
      else
        begin
          GBank.contribution := GBank.contribution + a;
          writeln('Спасибо что проинвестировали деньги в банк "Зелёная миля"');
          GBank.storage_time := p.time;
          p.money := p.money - GBank.contribution;
        end;
  end;
  
procedure pick_up (var p : TPlayer);
  begin
    writeln('Вам выдано ', Gbank.contribution ,' спасибо что пришли'); 
    p.money := p.money + GBank.contribution;
  end;

procedure bank (var p : TPlayer);
  var
    choice : char;
    choice2 : integer;
  begin
    if GBank.bank_is_open = 0 then
    begin
      writeln('Что бы открыть банк вам нужно 600 золотых (у вас : ',p.money,')');
      if p.money >= 600 then
      begin
        GBank.bank_is_open := 1;
        writeln('Добро пожаловать в банк "Зелёная миля" ');
        write('Ваше вложение сейчас составляют ' );
        began_bank(p);
        writeln();
        write('Хотите ли вы вложить или забрать деньги под процент (y/n): ');
        readln(choice); 
         if choice = 'y' then
           begin
             writeln('Вы хотите вложить деньги или забрать накопившуюся сумму? ');
             writeln('1 - вложить, 2 - забрать');
             write ('Введите цифру : ');
             readln(choice2);
               if choice2 = 1 then
                 invest(p);
               if choice2 = 2 then
                 pick_up(p)
           end;
      end
      else 
      begin
        writeln ('Вам не хватает ', 600 - p.money ,' монет' );
        writeln ('Приходите в следующия раз, когда раздобудите немного монет');
      end;
    end 
    else
      begin
      GBank.bank_is_open := 1;
      writeln('Добро пожаловать в банк "Зелёная миля" ');
      write('Ваше вложение сейчас составляют ' );
      began_bank(p);
      writeln();
      write('Хотите ли вы вложить или забрать деньги под процент (y/n): ');
      readln(choice); 
       if choice = 'y' then
         begin
           writeln('Вы хотите вложить деньги или забрать накопившуюся сумму? ');
           writeln('Деньги выводятся из банка ВСЕ');
           writeln('1 - вложить, 2 - забрать');
           write ('Введите цифру : ');
           readln(choice2);
             if choice2 = 1 then
               invest(p);
             if choice2 = 2 then
               pick_up(p)
         end;
      end;
  end;
end.

