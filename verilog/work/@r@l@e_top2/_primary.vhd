library verilog;
use verilog.vl_types.all;
entity RLE_top2 is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        out_temp        : out    vl_logic_vector(95 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end RLE_top2;
