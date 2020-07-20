library verilog;
use verilog.vl_types.all;
entity counter3 is
    port(
        count1          : in     vl_logic_vector(15 downto 0);
        count2          : out    vl_logic_vector(14 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end counter3;
