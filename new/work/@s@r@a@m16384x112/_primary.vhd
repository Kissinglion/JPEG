library verilog;
use verilog.vl_types.all;
entity SRAM16384x112 is
    generic(
        ADDRESSSIZE     : integer := 14;
        ADDRESSBITSIZE  : integer := 16384;
        WORDSIZE        : integer := 112
    );
    port(
        NWRT            : in     vl_logic;
        DIN             : in     vl_logic_vector;
        RA              : in     vl_logic_vector(13 downto 0);
        NCE             : in     vl_logic;
        CK              : in     vl_logic;
        DO              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDRESSSIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDRESSBITSIZE : constant is 1;
    attribute mti_svvh_generic_type of WORDSIZE : constant is 1;
end SRAM16384x112;
