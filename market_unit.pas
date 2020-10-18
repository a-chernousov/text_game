unit market_unit;

interface 
uses type_unit, text_unit;

const
  FOOD_PRICE = 20;
  AMMO_PRICE = 100;
  
procedure buy_ammo (var p : TPlayer);
procedure market (var p : TPlayer);

implementation 

procedure buy_ammo (var p : TPlayer);
var
  answer : char;
  ammo_num : integer;
begin
   write('Вы хотите купить патроны, стоимость 1шт = ', AMMO_PRICE,' (y/n)? : ');
   readln(answer);
   if answer = 'y' then
    begin
      repeat
        writeln('У тебя ', p.ammo, ' патронов и ', p.money,' денег');
        write('Сколько хочешь купить ammo (0 - чтобы выйти)? : ');
        readln(ammo_num);
        if (ammo_num > 0) and ((ammo_num * AMMO_PRICE) <= p.money) then
        begin
          p.money := p.money - ammo_num * AMMO_PRICE; 
          p.ammo := p.ammo + ammo_num;
        end
        else
        if (ammo_num <> 0) then
        begin
          writeln('Некорректное значение');
        end;
      until (ammo_num = 0);
    end;    
end;

procedure buy_food (var p : TPlayer);
var
  answer : char;
  food_num : integer;
begin
  write('Вы хотите купить еды, стоимость 1шт = ', FOOD_PRICE,' (y/n)? : ');
  readln(answer);
  if answer = 'y' then
  repeat
   begin
      writeln('У тебя ',p.food,' еды и ', p.money, ' денег');
      write('Сколько хочешь купить еды (0 - чтобы выйти)? : ');
      readln(food_num);
      if (food_num > 0) and ((food_num * FOOD_PRICE) <= p.money) then
      begin
        p.money := p.money -  food_num * FOOD_PRICE;
        p.food := p.food + food_num;
      end
      else
      begin
        if (food_num <> 0) then
         begin
           writeln('Некорректное значение');
         end; 
      end;
    end
  until food_num = 0 ;
end; 

procedure market (var p : TPlayer);
begin 
  buy_ammo(p);  
  buy_food(p);
  print_status(p);
end;

end.