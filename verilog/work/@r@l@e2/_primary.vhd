library verilog;
use verilog.vl_types.all;
entity RLE2 is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        in_next         : in     vl_logic_vector(3 downto 0);
        out_next        : out    vl_logic_vector(3 downto 0);
        count           : out    vl_logic_vector(3 downto 0);
        en1             : out    vl_logic;
        en2             : out    vl_logic;
        en3             : out    vl_logic;
        en4             : out    vl_logic;
        en5             : out    vl_logic;
        en6             : out    vl_logic;
        en7             : out    vl_logic;
        en8             : out    vl_logic;
        run1            : out    vl_logic_vector(3 downto 0);
        run2            : out    vl_logic_vector(3 downto 0);
        run3            : out    vl_logic_vector(3 downto 0);
        run4            : out    vl_logic_vector(3 downto 0);
        run5            : out    vl_logic_vector(3 downto 0);
        run6            : out    vl_logic_vector(3 downto 0);
        run7            : out    vl_logic_vector(3 downto 0);
        run8            : out    vl_logic_vector(3 downto 0)
    );
end RLE2;
