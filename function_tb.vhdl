-- LIke a procedure, but:
-- - has a return value
-- - cannot have wait

entity function_tb is
end function_tb;

architecture behav of function_tb is
    signal s0 : integer;

    function inc(x : integer)
        return integer is
    begin
        return x + 1;
    end inc;

    function wait_test(x : integer)
        return integer is
    begin
        -- Not allowed in function.
        --wait for 1 ns;
    end wait_test;

    -- Must have at least one argument.
    -- Cannot have side effects (TODO pure functions?), so this would be just as useful as a constant.
    --function no_args()
    --    return integer is
    --begin
    --end no_args;

    -- # pure function

        -- TODO: how to make impure functions?

        -- Pure functions have some language defined properties,
        -- e.g. only pure functions can resolve types.

begin
    process is
        function proc_is(x : integer)
            return integer is
        begin
            return x + 1;
        end proc_is;
    begin
        assert inc(1) = 2;
        -- Function definitions can go inside `process is` as well.
        assert proc_is(1) = 2;
        wait;
    end process;
end behav;
