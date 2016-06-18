entity adder_tb is
end adder_tb;

architecture behav of adder_tb is
    signal i0, i1, ci, s, co : bit;
begin
    adder_0: entity work.adder port map (
        i0 => i0,
        i1 => i1,
        ci => ci,
        s => s,
        co => co
    );
    process
        type pattern_type is record
            i0, i1, ci, s, co : bit;
        end record;
        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns : pattern_array := (
            ('0', '0', '0', '0', '0'),
            ('0', '0', '1', '1', '0'),
            ('0', '1', '0', '1', '0'),
            ('0', '1', '1', '0', '1'),
            ('1', '0', '0', '1', '0'),
            ('1', '0', '1', '0', '1'),
            ('1', '1', '0', '0', '1'),
            ('1', '1', '1', '1', '1')
        );
    begin
        for i in patterns'range loop
            i0 <= patterns(i).i0;
            i1 <= patterns(i).i1;
            ci <= patterns(i).ci;
            wait for 1 ns;
            assert s = patterns(i).s;
            assert co = patterns(i).co;
        end loop;
        wait;
    end process;
end behav;
