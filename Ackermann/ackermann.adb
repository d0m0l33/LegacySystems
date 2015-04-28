with Ada.Text_IO; use Ada.Text_IO;
with ada.Text_IO; use Ada.Text_IO;
with Ada.Text_IO.Text_Streams;  use Ada.Text_IO.Text_Streams;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;


procedure Hello is

    first : integer;
    second : integer;
    res : integer;
    option : integer;
    quit : integer;
    
begin

    declare
    
        function recursion(m : integer;n : integer) return integer is
            res: integer;
        begin
            if m = 0 then
                res := n + 1;
                return res;
            else if n = 0 then
                return recursion(m-1,1);
            else 
                return recursion(m-1,recursion(m,n-1));
            end if;
            end if;
        end recursion;
        
        function loops(m : integer; n : integer) return integer is
        
            res: integer;
            t : integer;
            d : integer;
            o : integer;
            p : integer;
            tsize : integer;
            stack: array (integer range 1..70001) of integer;
            
        begin

            d := 2;
            o := m;
            p := n;
    
            stack(1) := o;
            stack(2) := p;
  
    
            t := 2;
            tsize := 70000;
            
            while t /= 1 loop
            
                if stack(t-1) = 0 then
                    o :=  0;
                    t := t-1;
                    stack(t) := stack(t+1) + 1;
                else if stack(t) = 0  then
                    p := 0;
                    stack(t) := 1;
                    stack(t-1) := stack(t-1) - 1;
                else
                    stack(t+1) := stack(t) - 1;
                    stack(t) := stack(t-1);
                    stack(t-1) := stack(t-1) - 1;
                    t := t + 1;
                end if;
                end if;
                if(t>d) then
                    d := t;
                    if d  > tsize  then
                       put_line("failure, not enough memory");
                    end if;
                end if;
        
            end loop;
            
            res := stack(1);
            
            return res;
            
        end loops;
        
    begin
    
        quit := 1;
        
        while quit = 1 loop
        
			put_line("Welcome to Ackermann calculator");
			put_line("Enter first integer");
			get(first);
			put_line("Enter second integer");
			get(second);
			put_line("Enter 1 for recursion, 2 for iteration");
			get(option);
			
			if option = 1 then
				res := recursion(first,second);
				put_line("value : ");
				put(res);
			end if;
			if option = 2 then
				res := loops(first,second);
				put_line("value : ");
				put(res);
			end if;
			
			put_line("Choose 1 to continue, 0 to exit");
			get(quit);
        
        end loop;
        
        put_line("exiting ..");
        
    end;
    
end Hello;
