library verilog;
use verilog.vl_types.all;
entity spsram_hd_32768x80m16 is
    generic(
        ADDRESSSIZE     : integer := 14;
        ADDRESSBITSIZE  : integer := 16384;
        WORDSIZE        : integer := 112
    );
    port(
        CK              : in     vl_logic;
        CSN             : in     vl_logic;
        WEN             : in     vl_logic;
        OEN             : in     vl_logic;
        A               : in     vl_logic_vector;
        DI              : in     vl_logic_vector;
        DOUT            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDRESSSIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDRESSBITSIZE : constant is 1;
    attribute mti_svvh_generic_type of WORDSIZE : constant is 1;
end spsram_hd_32768x80m16;
