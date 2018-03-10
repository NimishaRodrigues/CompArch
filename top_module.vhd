----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 10:02:09 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
--library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--declaration

entity top_module is
    Port ( clk : in STD_LOGIC;
           switch : in STD_LOGIC_VECTOR (15 downto 0);
           buttons : in STD_LOGIC;
        each_output : out STD_LOGIC_VECTOR (15 downto 0);
           seven_seg : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end top_module;

architecture Behavioral of top_module is

--instantiating the SevenSegment module from top module

component SevenSegment Port ( clk : in STD_LOGIC;
           bcdinput : in STD_LOGIC_VECTOR (3 downto 0);
           ssoutput : out STD_LOGIC_VECTOR (6 downto 0));
end component;
--declaration

signal LED_BCD : STD_LOGIC_VECTOR(3 downto 0);
signal Lit_up_led : STD_LOGIC_VECTOR(1 downto 0); --"to light up LED"
signal refresh : STD_LOGIC_VECTOR(20 downto 0);


begin

process(clk)
begin
if (rising_edge(clk)) then            --everytime the clock goes from 0 to 1, refresh 
refresh <= refresh + 1;
end if;
end process;

Lit_up_led <= refresh(20 downto 19); --these signals are used for the triggering of the anodes 

--the following process is to trigger the corresponding anodes

process(Lit_up_led)
begin

case Lit_up_led is

when "00" => anode<= "0111"; --switching on the leftmost seven segment display
LED_BCD <=  switch(15 downto 12);

when "01" => anode<= "1011";
LED_BCD <=  switch(11 downto 8);



when "10" => anode<= "1101";
LED_BCD <=  switch(7 downto 4);

when "11" => anode<= "1110"; ---switching on the rightmost seven segment display
LED_BCD <=  switch(3 downto 0);

end case;
end process;

--"to light up each LED corresponding the switch"

each_output(0)<= '1' when switch(0) = '1' else '0';
each_output(1)<= '1' when switch(1) = '1' else '0';
each_output(2)<= '1' when switch(2) = '1' else '0';
each_output(3)<= '1' when switch(3) = '1' else '0';
each_output(4)<= '1' when switch(4) = '1' else '0';
each_output(5)<= '1' when switch(5) = '1' else '0';
each_output(6)<= '1' when switch(6) = '1' else '0';
each_output(7)<= '1' when switch(7) = '1' else '0';
each_output(8)<= '1' when switch(8) = '1' else '0';
each_output(9)<= '1' when switch(9) = '1' else '0';
each_output(10)<= '1' when switch(10) = '1' else '0';
each_output(11)<= '1' when switch(11) = '1' else '0';
each_output(12)<= '1' when switch(12) = '1' else '0';
each_output(13)<= '1' when switch(13) = '1' else '0';
each_output(14)<= '1' when switch(14) = '1' else '0';
each_output(15)<= '1' when switch(15) = '1' else '0';


--"to call lower level module" 

A : SevenSegment port map (clk => clk, bcdinput => LED_BCD, ssoutput => seven_seg);


end Behavioral;
