library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all; -- unsigned

entity counter_tb is
end counter_tb;

architecture behav of counter_tb is
    constant width : natural := 2;
    constant clk_period : time := 1 ns;
    component counter
        port (
            rst, clk, load : in std_logic;
            data : in std_logic_vector(width-1 downto 0);
            q    : out std_logic_vector(width-1 downto 0)
        );
    end component;
    for counter_0: counter use entity work.counter;
    signal rst, clk, load : std_logic := '0';
    signal data : std_logic_vector(width-1 downto 0);
    signal q    : std_logic_vector(width-1 downto 0);
begin
    counter_0: counter port map (
        rst => rst,
        clk => clk,
        load => load,
        data => data,
        q => q
    );

    process
    begin
        rst <= '1';
        wait for 0.5 ns;
        rst <= '0';
        wait for 0.5 ns;
        wait;
    end process;

    process
    begin
        wait until clk='1';
        --TODO
        --assert q = B"01";
        wait;
    end process;

    process
    begin
        for i in 13 downto 0 loop
            clk <= not clk;
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

end behav;
