library verilog;
use verilog.vl_types.all;
entity round is
    port(
        out_temp        : in     vl_logic_vector(17 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end round;
