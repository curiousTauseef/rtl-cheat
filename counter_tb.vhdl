library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;

entity counter_tb is
end counter_tb;

architecture behav of counter_tb is
    constant clk_period : time := 1 ns;
    constant nperiods : integer := 13;
    constant width : natural := 2;
    signal rst, load : std_logic := '0';
    signal clk : std_logic := '1';
    signal data : std_logic_vector(width-1 downto 0);
    signal q    : std_logic_vector(width-1 downto 0);
begin
    counter_0: entity work.counter port map (rst, clk, load, data, q);
    process
    begin
        rst <= '1';
        wait for clk_period / 4;
        rst <= '0';
        wait;
    end process;

    process
    begin
        wait until falling_edge(clk);
        assert q = B"00";
        wait until falling_edge(clk);
        assert q = B"01";
        wait until falling_edge(clk);
        assert q = B"10";
        wait until falling_edge(clk);
        assert q = B"11";
        wait;
    end process;

    process
    begin
        for i in 1 to nperiods loop
            wait for clk_period / 2;
            clk <= not clk;
        end loop;
        wait;
    end process;

end behav;
