library verilog;
use verilog.vl_types.all;
entity RLE_top is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(111 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end RLE_top;
