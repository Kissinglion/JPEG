library verilog;
use verilog.vl_types.all;
entity round2 is
    port(
        out_temp        : in     vl_logic_vector(16 downto 0);
        \out\           : out    vl_logic_vector(9 downto 0)
    );
end round2;
