library verilog;
use verilog.vl_types.all;
entity RLE_88 is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(127 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end RLE_88;
