-- Like C struct: named fields of arbitrary types.

library ieee;
use ieee.numeric_std.all; -- signed

entity record_tb is
end record_tb;

architecture behav of record_tb is
    type record0 is record
        abit : bit;
        anint : integer;
        areal : real;
    end record;
    constant arecord0 : record0 := ('1', 1, 1.0);
    constant arecord1 : record0 := ('1', 1, 1.0);
begin
    process is
    begin
        -- Field access.
        assert arecord0.abit = '1';
        assert arecord0.anint = 1;
        assert arecord0.areal = 1.0;

        -- = operator.
        assert arecord0 = arecord1;

        wait;
    end process;
end behav;
