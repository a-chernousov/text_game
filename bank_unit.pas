unit bank_unit;

interface
uses player_unit;
 
type Tbank = record
  bet : real;
  bank_is_open : integer;
  storage_time : integer;
end;

procedure init_bank(var h : TBank);

procedure bank (var p : TPlayer);

implementation

procedure init_bank(var h : TBank);
begin
  h.bank_is_open := 1;
  h.bet := 0.15;
end;

procedure invest(p : TPlayer);
  var
    choice1 : integer;
  begin
    write('Введить сумму которую хотите вложить :  ' );
    readln(choice1);
    writeln('Спасибо что проинвестировали деньги в банк "Зелёная миля"');
    h.storage_time := p.time;
  end;
  
procedure pick_up (p : TPlayer);
  var
    a : real;
    all_money : integer;
  begin
    a := Round((p.time -  p.storage_time) * p.contribution * h.bet ); 
    all_money := round(a);
    writeln('Деньги выданы вам, спасибо что пришли');
  end;

procedure bank (var p : TPlayer);
  var
    money1 : integer;
    choice : char;
    money2 : integer;
    choice2 : integer;
begin
  writeln('Что бы открыть банк вам нужно 600 золотых (у вас : ',p.money,')'); 
  if p.money >= 600 then
    begin
      
      writeln('Добро пожаловать в банк "Зелёная миля" ');
      writeln('Ваше вложение сейчас составляют ', p.contribution);
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
