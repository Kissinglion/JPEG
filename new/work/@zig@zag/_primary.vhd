library verilog;
use verilog.vl_types.all;
entity ZigZag is
    generic(
        BW              : integer := 10
    );
    port(
        i_data          : in     vl_logic_vector;
        i_enable        : in     vl_logic;
        i_clk           : in     vl_logic;
        i_Reset         : in     vl_logic;
        o_data          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BW : constant is 1;
end ZigZag;
