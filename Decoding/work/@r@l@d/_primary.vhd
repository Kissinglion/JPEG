library verilog;
use verilog.vl_types.all;
entity RLD is
    port(
        \in\            : in     vl_logic_vector(111 downto 0);
        in_next         : in     vl_logic_vector(5 downto 0);
        out_next        : out    vl_logic_vector(5 downto 0);
        previous        : in     vl_logic_vector(5 downto 0);
        sram_en         : out    vl_logic;
        run1            : out    vl_logic_vector(5 downto 0);
        run2            : out    vl_logic_vector(5 downto 0);
        run3            : out    vl_logic_vector(5 downto 0);
        run4            : out    vl_logic_vector(5 downto 0);
        run5            : out    vl_logic_vector(5 downto 0);
        run6            : out    vl_logic_vector(5 downto 0);
        run7            : out    vl_logic_vector(5 downto 0);
        run8            : out    vl_logic_vector(5 downto 0)
    );
end RLD;
