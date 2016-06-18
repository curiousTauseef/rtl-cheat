library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

entity tmp_tb is
end tmp_tb;

architecture behav of tmp_tb is
    signal s0 : std_logic;
    signal s1 : bit;
begin
    s0 <= '0';
    s0 <= '1';
    s1 <= '0';
    --s1 <= '1';
    process
    begin
        wait for 1 ns;
        assert s0 = 'X';
        wait;
    end process;
end behav;
