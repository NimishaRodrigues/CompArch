----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2018 08:22:19 PM
-- Design Name: 
-- Module Name: SevenSegment - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSegment is
    Port ( clk : in STD_LOGIC;
           bcdinput : in STD_LOGIC_VECTOR (3 downto 0);
           ssoutput : out STD_LOGIC_VECTOR (6 downto 0));
end SevenSegment;

architecture Behavioral of SevenSegment is
begin
process(bcdinput)

begin
case bcdinput is

when "0000"=> ssoutput <= "1000000";  --"to display 0"
when "0001"=> ssoutput <= "1111001"; --"to display 1"
when "0010"=> ssoutput <= "0100100"; --"to display 2"
when "0011"=> ssoutput <= "0110000"; --"to display 3"
when "0100"=> ssoutput <= "0011001"; --"to display 4"
when "0101"=> ssoutput <= "0010010"; --"to dispaly 5"
when "0110"=> ssoutput <= "0000010"; --"to display 6"
when "0111"=> ssoutput <= "1111000"; --"to display 7"
when "1000"=> ssoutput <= "0000000"; --"to display 8"
when "1001"=> ssoutput <= "0010000"; --to display 9"
when "1010"=> ssoutput <= "0100000"; --"to display A"
when "1011"=> ssoutput <= "0000011"; --"to display B"
when "1100"=> ssoutput <= "1000110"; --"to display C"
when "1101"=> ssoutput <= "1000010"; --"to display D"
when "1110"=> ssoutput <= "0000110"; --"to display E"
when "1111"=> ssoutput <= "0001110"; -- "to display F"
when others => ssoutput<= "0000000"; --"any other input than the above"

end case;
end process;
end Behavioral;
