library verilog;
use verilog.vl_types.all;
entity fextractor_2 is
    port(
        \a_c[1]\        : in     vl_logic;
        \_reset_c\      : in     vl_logic;
        clk_c           : in     vl_logic;
        onemks_1        : in     vl_logic;
        risea           : out    vl_logic
    );
end fextractor_2;
