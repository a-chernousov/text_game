unit text_unit;

interface
uses type_unit;

const 
  hello_string = 
  'Привет путник ты зашёл в текстовую игру ';
   
  market_hello_string =
  'Добро пожаловать на рынок ';
  
procedure print_hello();
procedure print_market_hello();

implementation
procedure print_hello();
begin
  writeln(hello_string);
end;

procedure print_market_hello();
begin
  writeln(market_hello_string);
end;
end.