library verilog;
use verilog.vl_types.all;
entity TPcontrol is
    port(
        count           : in     vl_logic_vector(3 downto 0);
        en1             : out    vl_logic;
        en3             : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end TPcontrol;
