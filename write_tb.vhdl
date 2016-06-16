-- write and company: writing to stdout.

library STD;
use STD.textio.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all; -- hwrite

entity write_tb is
end entity write_tb;

architecture behav of write_tb is
    signal std_logic_vector_32 : std_logic_vector(31 downto 0) := x"00000004";
    signal counter : integer := 1;
    alias swrite is write [line, string, side, width];
begin
    process is
        variable my_line : line;
    begin
        -- # write
        -- Write string to a line variable.
        -- # writeline
        -- Write line to stdout.
        write(my_line, string'("hello world"));
        writeline(output, my_line);

        -- # swrite
        -- More practical than write for strings, dispenses the type.

        swrite(my_line, "counter = ");
        write(my_line, counter);
        writeline(output, my_line);

        -- How stuff prints under write.

            -- Numeric literals.

            swrite(my_line, "1 = ");
            write(my_line, 1);
            writeline(output, my_line);

            swrite(my_line, "1_1 = ");
            write(my_line, 1_1);
            writeline(output, my_line);

            swrite(my_line, "1E1 = ");
            write(my_line, 1E1);
            writeline(output, my_line);

            swrite(my_line, "1.1 = ");
            write(my_line, 1.1);
            writeline(output, my_line);

            -- Time.

            swrite(my_line, "1 ns = ");
            write(my_line, 1 ns);
            writeline(output, my_line);

            swrite(my_line, "1 ms = ");
            write(my_line, 1 ms);
            writeline(output, my_line);

        -- # hwrite

            -- Formats std_logic_vector as hex. Synopsys extension.

            swrite(my_line, "std_logic_vector_32 = ");
            hwrite(my_line, std_logic_vector_32);
            writeline(output, my_line);

        wait;
    end process;
end architecture behav;
