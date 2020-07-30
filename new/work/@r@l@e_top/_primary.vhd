library verilog;
use verilog.vl_types.all;
entity RLE_top is
    port(
        \in\            : in     vl_logic_vector(79 downto 0);
        finish          : out    vl_logic_vector(319 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end RLE_top;
