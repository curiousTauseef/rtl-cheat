-- VHDL 2008 9.2 Operators

entity operators_tb is
end operators_tb;

architecture behav of operators_tb is
begin
    process
        constant err : REAL := 1.0E-6;
    begin
        assert 1 + 1 = 2;
        assert 2 * 2 = 4;

        assert 2 ** 3 = 8;

        assert abs(-1) = 1;
        assert abs(-1.0) = 1.0;

        assert 3 / 2 = 1;
        assert abs((3.0 / 2.0) - 1.5) < err;
        wait;
    end process;
end behav;
