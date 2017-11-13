library verilog;
use verilog.vl_types.all;
entity mux_16_6 is
    port(
        datainput       : out    vl_logic_vector(6 downto 0);
        ballcnt3q       : in     vl_logic_vector(6 downto 0);
        bcounter        : in     vl_logic_vector(3 downto 0);
        ballcnt1q       : in     vl_logic_vector(6 downto 0);
        ballcnt2q       : in     vl_logic_vector(6 downto 0);
        ballcnt0q       : in     vl_logic_vector(6 downto 0);
        bcounter_0      : in     vl_logic_vector(3 downto 0);
        p_c_19          : in     vl_logic;
        p_c_18          : in     vl_logic;
        p_c_17          : in     vl_logic;
        p_c_9           : in     vl_logic;
        p_c_28          : in     vl_logic;
        p_c_27          : in     vl_logic;
        p_c_14          : in     vl_logic;
        p_c_13          : in     vl_logic;
        p_c_12          : in     vl_logic;
        p_c_16          : in     vl_logic;
        p_c_26          : in     vl_logic;
        p_c_15          : in     vl_logic;
        p_c_10          : in     vl_logic;
        p_c_24          : in     vl_logic;
        p_c_23          : in     vl_logic;
        p_c_22          : in     vl_logic;
        p_c_11          : in     vl_logic;
        p_c_21          : in     vl_logic;
        p_c_25          : in     vl_logic;
        p_c_20          : in     vl_logic;
        p_c_5           : in     vl_logic;
        p_c_0           : in     vl_logic;
        n_861           : in     vl_logic;
        n_882           : in     vl_logic;
        o1              : in     vl_logic;
        n_903           : in     vl_logic;
        n_1069          : in     vl_logic;
        n_1083          : in     vl_logic;
        n_1097          : in     vl_logic
    );
end mux_16_6;
