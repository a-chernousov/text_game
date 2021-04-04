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
  all_money : integer;
begin
  all_money := Round((p.time -  GBank.storage_time) * GBank.contribution * GBank.bet ); 
  GBank.contribution := round(all_money);     
end;

procedure began_bank(p : TPlayer);
begin
  if GBank.bank_is_open = 0 then
    write('0')
  else 
   count_bank(p);
   writeln(GBank.contribution);
end;
 
procedure init_bank();
begin
  GBank.bank_is_open := 1;
  GBank.bet := 0.15;
  GBank.contribution := 0 ;
  GBank.storage_time := 0;
end;

procedure invest(p : TPlayer);
  begin
    write('Введить сумму которую хотите вложить :  ' );
    readln(GBank.contribution);
    if GBank.contribution > p.money then
      begin
        writeln('У вам нет такой суммы введите другую');
        invest(p);
      end
      else
        begin
          writeln('Спасибо что проинвестировали деньги в банк "Зелёная миля"');
          GBank.storage_time := p.time;
          p.money := p.money - GBank.contribution;
        end;
  end;
  
procedure pick_up (p : TPlayer);
  begin
    writeln('Вам выдано ', Gbank.contribution ,' спасибо что пришли'); 
    p.money := p.money + GBank.contribution;
  end;

procedure start_bank (p : TPlayer);
  begin
    if GBank.bank_is_open = 0 then
      writeln('Что бы открыть банк вам нужно 600 золотых (у вас : ',p.money,')')
    else
      writeln('Вы вошли в банк ');
  end;
procedure bank (var p : TPlayer);
  var
    choice : char;
    choice2 : integer;
begin
  start_bank (p);
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
           writeln('Деньги выводятся из банка ВСЕ');
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
  end;   

end. 
