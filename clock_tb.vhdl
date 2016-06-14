-- http://stackoverflow.com/questions/17904514/vhdl-how-should-i-create-a-clock-in-a-testbench
-- A clock is not synthesizable in VHDL:
-- It is physically implemented as a magic quartz crystal vibration phenomenon.

library ieee;
use ieee.std_logic_1164.all;

entity clock_tb is
end;

architecture behave of clock_tb is
    signal clk: std_logic := '0';
begin
    clk <= not clk after 1 ns;
end;
