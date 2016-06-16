-- Adapted from.
-- Input: 8-bit unsigned
-- Output: 4-bit unsigned int sqrt(x)

library IEEE;
use IEEE.std_logic_1164.all;

-- Subtractor Multiplexor
entity Sm is
    port (
        x  : in  std_logic;
        y  : in  std_logic;
        b  : in  std_logic;
        u  : in  std_logic;
        d  : out std_logic;
        bo : out std_logic
    );
end Sm;

architecture rtl of Sm is
    signal t011, t111, t010, t001, t100, td : std_logic;
begin
    t011 <= (not x) and y and b;
    t111 <= x and y and b;
    t010 <= (not x) and y and (not b);
    t001 <= (not x) and (not y) and b;
    t100 <= x and (not y) and (not b);
    bo   <= t011 or t111 or t010 or t001;
    td   <= t100 or t001 or t010 or t111;
    d    <= td when u='1' else x;
end architecture rtl;

library IEEE;
use IEEE.std_logic_1164.all;

entity sqrt8 is
    port (
        P : in  std_logic_vector(7 downto 0);
        U : out std_logic_vector(3 downto 0)
    );
end sqrt8;

architecture rtl of sqrt8 is
    signal zer : std_logic := '0';
    signal one : std_logic := '1';
    signal x00, x01, x02, x03, x04, x05, u_0 : std_logic;
    signal b00, b01, b02, b03, b04, b05 : std_logic;
    signal x12, x13, x14, x15, x16, u_1 : std_logic;
    signal b12, b13, b14, b15, b16 : std_logic;
    signal x24, x25, x26, x27, u_2 : std_logic;
    signal b24, b25, b26, b27 : std_logic;
    signal x36, x37, u_3 : std_logic;
    signal b36, b37 : std_logic;
begin
    --                           x     y    b    u    d    bo
    s36: entity work.Sm port map(P(6), one, zer, u_3, x36, b36);
    s37: entity work.Sm port map(P(7), zer, b36, u_3, x37, b37);

    s24: entity work.Sm port map(P(4), one, zer, u_2, x24, b24);
    s25: entity work.Sm port map(P(5), zer, b24, u_2, x25, b25);
    s26: entity work.Sm port map(x36 , u_3, b25, u_2, x26, b26);
    s27: entity work.Sm port map(x37 , zer, b26, zer, x27, b27);

    s12: entity work.Sm port map(P(2), one, zer, u_1, x12, b12);
    s13: entity work.Sm port map(P(3), zer, b12, u_1, x13, b13);
    s14: entity work.Sm port map(x24 , u_2, b13, u_1, x14, b14);
    s15: entity work.Sm port map(x25 , u_3, b14, u_1, x15, b15);
    s16: entity work.Sm port map(x26 , zer, b15, zer, x16, b16);

    s00: entity work.Sm port map(P(0), one, zer, zer, x00, b00);
    s01: entity work.Sm port map(P(1), zer, b00, zer, x01, b01);
    s02: entity work.Sm port map(x12 , u_1, b01, zer, x02, b02);
    s03: entity work.Sm port map(x13 , u_2, b02, zer, x03, b03);
    s04: entity work.Sm port map(x14 , u_3, b03, zer, x04, b04);
    s05: entity work.Sm port map(x15 , zer, b04, zer, x05, b05);
    u_0  <= not b05;
    u_1  <= not b16;
    u_2  <= not b27;
    u_3  <= not b37;
    U(0) <= u_0;
    U(1) <= u_1;
    U(2) <= u_2;
    U(3) <= u_3;
end architecture rtl;

library STD;
use STD.textio.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;

entity sqrt8_tb is
end sqrt8_tb;

architecture behav of sqrt8_tb is
    signal P : std_logic_vector(7 downto 0);
    signal U : std_logic_vector(3 downto 0);
    procedure print(
        P : std_logic_vector(7 downto 0);
        U : std_logic_vector(3 downto 0)
    ) is
        variable my_line : line;
        alias swrite is write [line, string, side, width] ;
    begin
        write(my_line, P);
        swrite(my_line, " = ");
        write(my_line, U);
        writeline(output, my_line);
    end print;
begin
    s1: entity work.sqrt8 port map(P, U);
    process
    begin
        for I in 0 to 255 loop
            P <= std_logic_vector(to_unsigned(I, 8));
            wait for 2 ns;
            print(P, U);
        end loop;
        wait;
    end process;
end architecture behav;
