library verilog;
use verilog.vl_types.all;
entity SRAM is
    generic(
        ADDRESSSIZE     : integer := 15;
        ADDRESSBITSIZE  : integer := 32768;
        WORDSIZE        : integer := 64
    );
    port(
        iClk            : in     vl_logic;
        D               : in     vl_logic_vector(63 downto 0);
        A               : in     vl_logic_vector;
        WEN             : in     vl_logic;
        CSN             : in     vl_logic;
        Q               : out    vl_logic_vector(63 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDRESSSIZE : constant is 1;
    attribute mti_svvh_generic_type of ADDRESSBITSIZE : constant is 1;
    attribute mti_svvh_generic_type of WORDSIZE : constant is 1;
end SRAM;
