unit bank_unit;

interface
uses player_unit, q_home_castle_unit;

procedure bank (var p : TPlayer);

implementation

procedure bank (var p : TPlayer);
  var
    money1 : integer;
    choice : real;
    money2 : integer;
begin
  writeln('Что бы открыто банк вам нужно 600 золотых (у вас : )',p.money); 
  if p.money >= 600 then
    begin
      writeln('Добро пожаловать в банк "Зелёная миля" ');
      writeln('Ваше вложение сейчас составляют ', p.contribution);
      write('Хотите ли вы вложить деньги под процент (y/n): ');
      readln(choice); 
       if choice = 'y' then
         begin
           writeln('Правило таковы :');
           writeln('За каждый день сумма возрастает на %15');
           writeln('Вы можете забрать деньги в любой момент после внисение денег на счёт');
           writeln('Если вы введёте 0 то вы ничего не внесёте ');
           writeln('Введите сумму денег которую вы бы хотели внестина ваш счёт');
           readln(money2);
           if money2 >= p.money  then
             begin
               writeln('Спасибо за внесение денег, забрать деньги вы можете когда вам угодно'); 
             
             end
           else
             begin
               writeln('У вас недостаточно денег, внесите другую сумму');                   
             end;
         end;
    end
  else 
    begin
      writeln ('Вам не хватает ', 600 - p.money ,' монет' );
      writeln ('Приходите в следующия раз, когда раздобудите немного монет');
    end;
  end;   

end. 
