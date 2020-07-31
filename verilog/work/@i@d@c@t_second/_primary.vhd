library verilog;
use verilog.vl_types.all;
entity IDCT_second is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(71 downto 0)
    );
end IDCT_second;
