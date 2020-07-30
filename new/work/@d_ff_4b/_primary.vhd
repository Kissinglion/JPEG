library verilog;
use verilog.vl_types.all;
entity D_ff_4b is
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end D_ff_4b;
