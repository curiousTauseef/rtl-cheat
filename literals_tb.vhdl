-- VHDL 2008 15. Lexical elements - Several sections.

entity literals_tb is
end literals_tb;

architecture behav of literals_tb is
    signal my_integer : integer;
begin
    process
        -- Character.
        constant my_character : CHARACTER := 'a';
        -- String..
        constant my_string : STRING := "abc";
    begin
        -- Numeric

            --my_integer <= 1;
            --assert (my_integer = 1);

            -- Single underscores can be used as you please inside numbers.
            assert 1_1 = 11;

            -- Exponent integer.
            assert 1E1 = 10;

            -- Based literal.
            assert 2#10# = 2;
            assert 3#10# = 3;
            assert 16#10# = 16;

        -- Bit-string literal.

            -- TODO
            --assert B"11" = X"3";

        -- Boolean.

            assert true;
            assert not false;

        wait;
    end process;
end behav;
