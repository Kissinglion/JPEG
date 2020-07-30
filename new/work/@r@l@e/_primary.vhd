library verilog;
use verilog.vl_types.all;
entity RLE is
    port(
        \in\            : in     vl_logic_vector(79 downto 0);
        \out\           : out    vl_logic_vector(9 downto 0);
        \next\          : out    vl_logic_vector(3 downto 0);
        run             : out    vl_logic_vector(5 downto 0);
        cnt             : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end RLE;
