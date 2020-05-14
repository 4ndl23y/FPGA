
library ieee;
use ieee.std_logic_1164.all;

entity t_trigger is
	port(
			clk : in std_logic;
			t : in std_logic;
			q : out std_logic := '0'
	);
end t_trigger;

architecture main of t_trigger is
begin
	process (clk)
	
	variable m : std_logic;
	
	begin
		if(rising_edge(clk) and t = '1') then
			m := not m;
			q <= m;
		end if;
	end process;	
end main;

