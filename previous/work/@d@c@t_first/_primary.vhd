library verilog;
use verilog.vl_types.all;
entity DCT_first is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0)
    );
end DCT_first;
