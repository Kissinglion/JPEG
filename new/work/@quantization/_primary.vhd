library verilog;
use verilog.vl_types.all;
entity Quantization is
    generic(
        q11             : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        q12             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi1);
        q13             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0);
        q14             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        q15             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        q16             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        q17             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q18             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q21             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi0);
        q22             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1, Hi0);
        q23             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        q24             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0);
        q25             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        q26             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q27             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q28             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q31             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        q32             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        q33             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        q34             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        q35             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        q36             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q37             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q38             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q41             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        q42             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1);
        q43             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        q44             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        q45             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q46             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q47             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q48             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q51             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1);
        q52             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        q53             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        q54             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q55             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q56             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q57             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q58             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q61             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        q62             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        q63             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q64             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q65             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q66             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q67             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q68             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q71             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q72             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        q73             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q74             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q75             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q76             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q77             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q78             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q81             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q82             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q83             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q84             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q85             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q86             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q87             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        q88             : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        \in\            : in     vl_logic_vector(79 downto 0);
        \out\           : out    vl_logic_vector(79 downto 0);
        count           : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of q11 : constant is 1;
    attribute mti_svvh_generic_type of q12 : constant is 1;
    attribute mti_svvh_generic_type of q13 : constant is 1;
    attribute mti_svvh_generic_type of q14 : constant is 1;
    attribute mti_svvh_generic_type of q15 : constant is 1;
    attribute mti_svvh_generic_type of q16 : constant is 1;
    attribute mti_svvh_generic_type of q17 : constant is 1;
    attribute mti_svvh_generic_type of q18 : constant is 1;
    attribute mti_svvh_generic_type of q21 : constant is 1;
    attribute mti_svvh_generic_type of q22 : constant is 1;
    attribute mti_svvh_generic_type of q23 : constant is 1;
    attribute mti_svvh_generic_type of q24 : constant is 1;
    attribute mti_svvh_generic_type of q25 : constant is 1;
    attribute mti_svvh_generic_type of q26 : constant is 1;
    attribute mti_svvh_generic_type of q27 : constant is 1;
    attribute mti_svvh_generic_type of q28 : constant is 1;
    attribute mti_svvh_generic_type of q31 : constant is 1;
    attribute mti_svvh_generic_type of q32 : constant is 1;
    attribute mti_svvh_generic_type of q33 : constant is 1;
    attribute mti_svvh_generic_type of q34 : constant is 1;
    attribute mti_svvh_generic_type of q35 : constant is 1;
    attribute mti_svvh_generic_type of q36 : constant is 1;
    attribute mti_svvh_generic_type of q37 : constant is 1;
    attribute mti_svvh_generic_type of q38 : constant is 1;
    attribute mti_svvh_generic_type of q41 : constant is 1;
    attribute mti_svvh_generic_type of q42 : constant is 1;
    attribute mti_svvh_generic_type of q43 : constant is 1;
    attribute mti_svvh_generic_type of q44 : constant is 1;
    attribute mti_svvh_generic_type of q45 : constant is 1;
    attribute mti_svvh_generic_type of q46 : constant is 1;
    attribute mti_svvh_generic_type of q47 : constant is 1;
    attribute mti_svvh_generic_type of q48 : constant is 1;
    attribute mti_svvh_generic_type of q51 : constant is 1;
    attribute mti_svvh_generic_type of q52 : constant is 1;
    attribute mti_svvh_generic_type of q53 : constant is 1;
    attribute mti_svvh_generic_type of q54 : constant is 1;
    attribute mti_svvh_generic_type of q55 : constant is 1;
    attribute mti_svvh_generic_type of q56 : constant is 1;
    attribute mti_svvh_generic_type of q57 : constant is 1;
    attribute mti_svvh_generic_type of q58 : constant is 1;
    attribute mti_svvh_generic_type of q61 : constant is 1;
    attribute mti_svvh_generic_type of q62 : constant is 1;
    attribute mti_svvh_generic_type of q63 : constant is 1;
    attribute mti_svvh_generic_type of q64 : constant is 1;
    attribute mti_svvh_generic_type of q65 : constant is 1;
    attribute mti_svvh_generic_type of q66 : constant is 1;
    attribute mti_svvh_generic_type of q67 : constant is 1;
    attribute mti_svvh_generic_type of q68 : constant is 1;
    attribute mti_svvh_generic_type of q71 : constant is 1;
    attribute mti_svvh_generic_type of q72 : constant is 1;
    attribute mti_svvh_generic_type of q73 : constant is 1;
    attribute mti_svvh_generic_type of q74 : constant is 1;
    attribute mti_svvh_generic_type of q75 : constant is 1;
    attribute mti_svvh_generic_type of q76 : constant is 1;
    attribute mti_svvh_generic_type of q77 : constant is 1;
    attribute mti_svvh_generic_type of q78 : constant is 1;
    attribute mti_svvh_generic_type of q81 : constant is 1;
    attribute mti_svvh_generic_type of q82 : constant is 1;
    attribute mti_svvh_generic_type of q83 : constant is 1;
    attribute mti_svvh_generic_type of q84 : constant is 1;
    attribute mti_svvh_generic_type of q85 : constant is 1;
    attribute mti_svvh_generic_type of q86 : constant is 1;
    attribute mti_svvh_generic_type of q87 : constant is 1;
    attribute mti_svvh_generic_type of q88 : constant is 1;
end Quantization;