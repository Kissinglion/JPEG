library verilog;
use verilog.vl_types.all;
entity round1 is
    port(
        out_temp        : in     vl_logic_vector(17 downto 0);
        \out\           : out    vl_logic_vector(8 downto 0)
    );
end round1;
