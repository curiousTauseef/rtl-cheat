-- VHDL 2008 16.3 Package STANDARD
-- TODO: package is always available.
-- Contains the definition of the types of most / all literals.

entity standard_package_tb is
end standard_package_tb;

architecture behav of standard_package_tb is
begin
    process is
        variable my_char : CHARACTER := 'a';
    begin
        wait;
    end process;
end behav;
