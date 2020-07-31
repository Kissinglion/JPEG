library verilog;
use verilog.vl_types.all;
entity Decoding is
    port(
        \in\            : in     vl_logic_vector(111 downto 0);
        \out\           : out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end Decoding;
