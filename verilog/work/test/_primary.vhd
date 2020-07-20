library verilog;
use verilog.vl_types.all;
entity test is
    port(
        \in\            : in     vl_logic_vector(9 downto 0);
        \out\           : out    vl_logic_vector(39 downto 0);
        a1              : in     vl_logic_vector(2 downto 0);
        a2              : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end test;
