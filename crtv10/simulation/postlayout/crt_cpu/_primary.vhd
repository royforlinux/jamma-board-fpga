library verilog;
use verilog.vl_types.all;
entity crt_cpu is
    port(
        a_c             : in     vl_logic_vector(3 downto 0);
        b_c             : in     vl_logic_vector(3 downto 0);
        page            : out    vl_logic_vector(6 downto 0);
        md_in           : in     vl_logic_vector(7 downto 0);
        dse             : out    vl_logic_vector(1 downto 0);
        ase             : out    vl_logic_vector(1 downto 0);
        reg_select_0    : out    vl_logic_vector(1 downto 0);
        db_in           : in     vl_logic_vector(7 downto 0);
        cpu_address     : out    vl_logic_vector(19 downto 0);
        \addr_reg[20]\  : out    vl_logic;
        reg_select_0_d0 : out    vl_logic;
        dboreg_7        : out    vl_logic;
        dboreg_6        : out    vl_logic;
        dboreg_5        : out    vl_logic;
        dboreg_1        : out    vl_logic;
        dboreg_0        : out    vl_logic;
        hris_n          : out    vl_logic;
        a               : in     vl_logic;
        vsync_in_c      : in     vl_logic;
        extnoice        : in     vl_logic;
        onemks          : in     vl_logic;
        onemks_0        : in     vl_logic;
        onemks_1        : in     vl_logic;
        y_92            : in     vl_logic;
        mem_hold        : out    vl_logic;
        y_93            : in     vl_logic;
        y_94            : in     vl_logic;
        y_95            : in     vl_logic;
        y_96            : in     vl_logic;
        y_97            : in     vl_logic;
        y_98            : in     vl_logic;
        y_99            : in     vl_logic;
        y_100           : in     vl_logic;
        y_101           : in     vl_logic;
        y_102           : in     vl_logic;
        y_103           : in     vl_logic;
        y_104           : in     vl_logic;
        y_105           : in     vl_logic;
        y_106           : in     vl_logic;
        y_112           : out    vl_logic;
        y_115           : out    vl_logic;
        as_c            : in     vl_logic;
        y_110           : out    vl_logic;
        ds_c            : in     vl_logic;
        y_111           : out    vl_logic;
        ds_c_0          : in     vl_logic;
        y_107           : in     vl_logic;
        n_295_n         : in     vl_logic;
        n_300_n         : in     vl_logic;
        \_reset_c\      : in     vl_logic;
        clk_c           : in     vl_logic;
        \_wr_c\         : in     vl_logic;
        y_116           : out    vl_logic
    );
end crt_cpu;
