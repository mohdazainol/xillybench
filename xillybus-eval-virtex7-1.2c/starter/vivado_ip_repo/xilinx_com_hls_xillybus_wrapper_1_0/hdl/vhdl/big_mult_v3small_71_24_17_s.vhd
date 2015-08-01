-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2013.4
-- Copyright (C) 2013 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity big_mult_v3small_71_24_17_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    a_V : IN STD_LOGIC_VECTOR (70 downto 0);
    b_V : IN STD_LOGIC_VECTOR (23 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (94 downto 0) );
end;


architecture behav of big_mult_v3small_71_24_17_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (3 downto 0) := "0011";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (3 downto 0) := "0101";
    constant ap_ST_st7_fsm_6 : STD_LOGIC_VECTOR (3 downto 0) := "0110";
    constant ap_ST_st8_fsm_7 : STD_LOGIC_VECTOR (3 downto 0) := "0111";
    constant ap_ST_st9_fsm_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_ST_st10_fsm_9 : STD_LOGIC_VECTOR (3 downto 0) := "1001";
    constant ap_ST_st11_fsm_10 : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_ST_st12_fsm_11 : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_4 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000100";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv7_10 : STD_LOGIC_VECTOR (6 downto 0) := "0010000";
    constant ap_const_lv7_46 : STD_LOGIC_VECTOR (6 downto 0) := "1000110";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_44 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000100";
    constant ap_const_lv32_5E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011110";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal tmp_fu_192_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal tmp_reg_411 : STD_LOGIC_VECTOR (40 downto 0);
    signal i_4_fu_202_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal i_4_reg_419 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_14_fu_255_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal tmp_14_reg_424 : STD_LOGIC_VECTOR (40 downto 0);
    signal exitcond2_fu_196_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_259_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal tmp_5_reg_434 : STD_LOGIC_VECTOR (40 downto 0);
    signal tmp_6_fu_274_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_6_reg_442 : STD_LOGIC_VECTOR (63 downto 0);
    signal exitcond3_fu_268_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_3_fu_294_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal i_3_reg_457 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_1_fu_327_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_1_reg_465 : STD_LOGIC_VECTOR (2 downto 0);
    signal exitcond_fu_321_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_2_fu_378_p5 : STD_LOGIC_VECTOR (94 downto 0);
    signal pp_V_address0 : STD_LOGIC_VECTOR (2 downto 0);
    signal pp_V_ce0 : STD_LOGIC;
    signal pp_V_we0 : STD_LOGIC;
    signal pp_V_d0 : STD_LOGIC_VECTOR (40 downto 0);
    signal pp_V_q0 : STD_LOGIC_VECTOR (40 downto 0);
    signal pps_V_address0 : STD_LOGIC_VECTOR (2 downto 0);
    signal pps_V_ce0 : STD_LOGIC;
    signal pps_V_we0 : STD_LOGIC;
    signal pps_V_d0 : STD_LOGIC_VECTOR (40 downto 0);
    signal pps_V_q0 : STD_LOGIC_VECTOR (40 downto 0);
    signal i_reg_144 : STD_LOGIC_VECTOR (2 downto 0);
    signal i_1_reg_156 : STD_LOGIC_VECTOR (2 downto 0);
    signal p_Val2_s_reg_167 : STD_LOGIC_VECTOR (94 downto 0);
    signal i_2_reg_179 : STD_LOGIC_VECTOR (2 downto 0);
    signal tmp_3_fu_263_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_8_fu_289_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_4_fu_333_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_9_fu_314_p2 : STD_LOGIC_VECTOR (40 downto 0);
    signal Lo_assign_fu_214_p4 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_s_fu_208_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_228_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal Ui_1_fu_234_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_23_cast_fu_224_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Ui_2_cast_fu_242_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_3_fu_246_p4 : STD_LOGIC_VECTOR (70 downto 0);
    signal grp_fu_259_p0 : STD_LOGIC_VECTOR (40 downto 0);
    signal grp_fu_259_p1 : STD_LOGIC_VECTOR (23 downto 0);
    signal tmp_15_fu_279_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_7_fu_283_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal r_V_fu_300_p4 : STD_LOGIC_VECTOR (23 downto 0);
    signal r_V_1_fu_310_p1 : STD_LOGIC_VECTOR (40 downto 0);
    signal tmp_17_fu_338_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal Li_fu_342_p4 : STD_LOGIC_VECTOR (5 downto 0);
    signal Li_cast_fu_356_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal Ui_fu_360_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_18_fu_370_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal loc_V_fu_374_p1 : STD_LOGIC_VECTOR (94 downto 0);
    signal Li_cast2_fu_352_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal Hi_assign_cast_fu_366_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_16_fu_390_p1 : STD_LOGIC_VECTOR (26 downto 0);
    signal grp_fu_259_ce : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);

    component xillybus_wrapper_mul_41s_24ns_41_3 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (40 downto 0);
        din1 : IN STD_LOGIC_VECTOR (23 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (40 downto 0) );
    end component;


    component big_mult_v3small_71_24_17_s_pp_V IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (2 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (40 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (40 downto 0) );
    end component;



begin
    pp_V_U : component big_mult_v3small_71_24_17_s_pp_V
    generic map (
        DataWidth => 41,
        AddressRange => 5,
        AddressWidth => 3)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => pp_V_address0,
        ce0 => pp_V_ce0,
        we0 => pp_V_we0,
        d0 => pp_V_d0,
        q0 => pp_V_q0);

    pps_V_U : component big_mult_v3small_71_24_17_s_pp_V
    generic map (
        DataWidth => 41,
        AddressRange => 5,
        AddressWidth => 3)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => pps_V_address0,
        ce0 => pps_V_ce0,
        we0 => pps_V_we0,
        d0 => pps_V_d0,
        q0 => pps_V_q0);

    xillybus_wrapper_mul_41s_24ns_41_3_U6 : component xillybus_wrapper_mul_41s_24ns_41_3
    generic map (
        ID => 6,
        NUM_STAGE => 3,
        din0_WIDTH => 41,
        din1_WIDTH => 24,
        dout_WIDTH => 41)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_259_p0,
        din1 => grp_fu_259_p1,
        ce => grp_fu_259_ce,
        dout => grp_fu_259_p2);





    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- i_1_reg_156 assign process. --
    i_1_reg_156_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st9_fsm_8 = ap_CS_fsm)) then 
                i_1_reg_156 <= i_3_reg_457;
            elsif ((ap_ST_st7_fsm_6 = ap_CS_fsm)) then 
                i_1_reg_156 <= ap_const_lv3_1;
            end if; 
        end if;
    end process;

    -- i_2_reg_179 assign process. --
    i_2_reg_179_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st8_fsm_7 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond3_fu_268_p2)))) then 
                i_2_reg_179 <= ap_const_lv3_0;
            elsif ((ap_ST_st11_fsm_10 = ap_CS_fsm)) then 
                i_2_reg_179 <= tmp_1_reg_465;
            end if; 
        end if;
    end process;

    -- i_reg_144 assign process. --
    i_reg_144_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then 
                i_reg_144 <= ap_const_lv3_0;
            elsif ((ap_ST_st6_fsm_5 = ap_CS_fsm)) then 
                i_reg_144 <= i_4_reg_419;
            end if; 
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st8_fsm_7 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond3_fu_268_p2))) then
                i_3_reg_457 <= i_3_fu_294_p2;
                tmp_6_reg_442(0) <= tmp_6_fu_274_p1(0);
    tmp_6_reg_442(1) <= tmp_6_fu_274_p1(1);
    tmp_6_reg_442(2) <= tmp_6_fu_274_p1(2);
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then
                i_4_reg_419 <= i_4_fu_202_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st11_fsm_10 = ap_CS_fsm)) then
                p_Val2_s_reg_167 <= p_Result_2_fu_378_p5;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st2_fsm_1 = ap_CS_fsm) and (exitcond2_fu_196_p2 = ap_const_lv1_0))) then
                tmp_14_reg_424 <= tmp_14_fu_255_p1;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st10_fsm_9 = ap_CS_fsm)) then
                tmp_1_reg_465 <= tmp_1_fu_327_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_ST_st5_fsm_4 = ap_CS_fsm)) then
                tmp_5_reg_434 <= grp_fu_259_p2;
            end if;
        end if;
    end process;

    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_ST_st1_fsm_0 = ap_CS_fsm) and not((ap_start = ap_const_logic_0)))) then
                tmp_reg_411(0) <= tmp_fu_192_p1(0);
    tmp_reg_411(1) <= tmp_fu_192_p1(1);
    tmp_reg_411(2) <= tmp_fu_192_p1(2);
    tmp_reg_411(3) <= tmp_fu_192_p1(3);
    tmp_reg_411(4) <= tmp_fu_192_p1(4);
    tmp_reg_411(5) <= tmp_fu_192_p1(5);
    tmp_reg_411(6) <= tmp_fu_192_p1(6);
    tmp_reg_411(7) <= tmp_fu_192_p1(7);
    tmp_reg_411(8) <= tmp_fu_192_p1(8);
    tmp_reg_411(9) <= tmp_fu_192_p1(9);
    tmp_reg_411(10) <= tmp_fu_192_p1(10);
    tmp_reg_411(11) <= tmp_fu_192_p1(11);
    tmp_reg_411(12) <= tmp_fu_192_p1(12);
    tmp_reg_411(13) <= tmp_fu_192_p1(13);
    tmp_reg_411(14) <= tmp_fu_192_p1(14);
    tmp_reg_411(15) <= tmp_fu_192_p1(15);
    tmp_reg_411(16) <= tmp_fu_192_p1(16);
    tmp_reg_411(17) <= tmp_fu_192_p1(17);
    tmp_reg_411(18) <= tmp_fu_192_p1(18);
    tmp_reg_411(19) <= tmp_fu_192_p1(19);
    tmp_reg_411(20) <= tmp_fu_192_p1(20);
    tmp_reg_411(21) <= tmp_fu_192_p1(21);
    tmp_reg_411(22) <= tmp_fu_192_p1(22);
    tmp_reg_411(23) <= tmp_fu_192_p1(23);
            end if;
        end if;
    end process;
    tmp_reg_411(40 downto 24) <= "00000000000000000";
    tmp_6_reg_442(63 downto 3) <= "0000000000000000000000000000000000000000000000000000000000000";

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ap_start , ap_CS_fsm , exitcond2_fu_196_p2 , exitcond3_fu_268_p2 , exitcond_fu_321_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((exitcond2_fu_196_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st7_fsm_6;
                else
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                end if;
            when ap_ST_st3_fsm_2 => 
                ap_NS_fsm <= ap_ST_st4_fsm_3;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st5_fsm_4;
            when ap_ST_st5_fsm_4 => 
                ap_NS_fsm <= ap_ST_st6_fsm_5;
            when ap_ST_st6_fsm_5 => 
                ap_NS_fsm <= ap_ST_st2_fsm_1;
            when ap_ST_st7_fsm_6 => 
                ap_NS_fsm <= ap_ST_st8_fsm_7;
            when ap_ST_st8_fsm_7 => 
                if (not((ap_const_lv1_0 = exitcond3_fu_268_p2))) then
                    ap_NS_fsm <= ap_ST_st10_fsm_9;
                else
                    ap_NS_fsm <= ap_ST_st9_fsm_8;
                end if;
            when ap_ST_st9_fsm_8 => 
                ap_NS_fsm <= ap_ST_st8_fsm_7;
            when ap_ST_st10_fsm_9 => 
                if (not((ap_const_lv1_0 = exitcond_fu_321_p2))) then
                    ap_NS_fsm <= ap_ST_st12_fsm_11;
                else
                    ap_NS_fsm <= ap_ST_st11_fsm_10;
                end if;
            when ap_ST_st11_fsm_10 => 
                ap_NS_fsm <= ap_ST_st10_fsm_9;
            when ap_ST_st12_fsm_11 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    Hi_assign_cast_fu_366_p1 <= std_logic_vector(resize(unsigned(Ui_fu_360_p2),32));
    Li_cast2_fu_352_p1 <= std_logic_vector(resize(unsigned(Li_fu_342_p4),32));
    Li_cast_fu_356_p1 <= std_logic_vector(resize(unsigned(Li_fu_342_p4),7));
    Li_fu_342_p4 <= ((tmp_17_fu_338_p1 & ap_const_lv1_0) & i_2_reg_179);
    Lo_assign_fu_214_p4 <= ((i_reg_144 & ap_const_lv1_0) & i_reg_144);
    Ui_1_fu_234_p3 <= 
        ap_const_lv7_46 when (tmp_s_fu_208_p2(0) = '1') else 
        tmp_2_fu_228_p2;
    Ui_2_cast_fu_242_p1 <= std_logic_vector(resize(unsigned(Ui_1_fu_234_p3),32));
    Ui_fu_360_p2 <= std_logic_vector(unsigned(Li_cast_fu_356_p1) + unsigned(ap_const_lv7_10));

    -- ap_done assign process. --
    ap_done_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if (((not((ap_const_logic_1 = ap_start)) and (ap_ST_st1_fsm_0 = ap_CS_fsm)) or (ap_ST_st12_fsm_11 = ap_CS_fsm))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_idle assign process. --
    ap_idle_assign_proc : process(ap_start, ap_CS_fsm)
    begin
        if ((not((ap_const_logic_1 = ap_start)) and (ap_ST_st1_fsm_0 = ap_CS_fsm))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_ready assign process. --
    ap_ready_assign_proc : process(ap_CS_fsm)
    begin
        if ((ap_ST_st12_fsm_11 = ap_CS_fsm)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= (tmp_16_fu_390_p1 & p_Val2_s_reg_167(67 downto 0));
    exitcond2_fu_196_p2 <= "1" when (i_reg_144 = ap_const_lv3_5) else "0";
    exitcond3_fu_268_p2 <= "1" when (i_1_reg_156 = ap_const_lv3_5) else "0";
    exitcond_fu_321_p2 <= "1" when (i_2_reg_179 = ap_const_lv3_4) else "0";
    grp_fu_259_ce <= ap_const_logic_1;
    grp_fu_259_p0 <= tmp_14_reg_424;
    grp_fu_259_p1 <= tmp_reg_411(24 - 1 downto 0);
    i_3_fu_294_p2 <= std_logic_vector(unsigned(i_1_reg_156) + unsigned(ap_const_lv3_1));
    i_4_fu_202_p2 <= std_logic_vector(unsigned(i_reg_144) + unsigned(ap_const_lv3_1));
    loc_V_fu_374_p1 <= std_logic_vector(resize(unsigned(tmp_18_fu_370_p1),95));
    
    p_Result_2_fu_378_p5_proc : process(p_Val2_s_reg_167, loc_V_fu_374_p1, Li_cast2_fu_352_p1, Hi_assign_cast_fu_366_p1)
    variable vlo_cpy : STD_LOGIC_VECTOR(95+32-1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(95+32-1 downto 0);
    variable v1_shift : STD_LOGIC_VECTOR(95-1 downto 0);
    variable tmp : STD_LOGIC_VECTOR(95-1 downto 0);
    variable v1_reverse : boolean;
    variable v1_cpy : STD_LOGIC_VECTOR(95+95-1 downto 0);
    variable p_Result_2_fu_378_p5_i : integer;
    variable tmp_v1, tmp_mask_low, tmp_mask_hi : STD_LOGIC_VECTOR(95-1 downto 0);
    variable res_v1, res_mask, res_mask_low, res_mask_hi : STD_LOGIC_VECTOR(95- 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(7-1 downto 0) := Li_cast2_fu_352_p1(7-1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(7-1 downto 0) := Hi_assign_cast_fu_366_p1(7-1 downto 0);
        v1_shift := (others => '0');
        v1_shift(7-1 downto 0) := vlo_cpy(7-1 downto 0);
        v1_reverse := false;
        if (vlo_cpy > vhi_cpy) then
            v1_shift(7-1 downto 0) := std_logic_vector(95-1 -unsigned(vlo_cpy(7-1 downto 0)));
            v1_reverse := true;
            tmp := (others => '0');
            tmp(7- 1 downto 0) := vhi_cpy(7-1 downto 0);
            vhi_cpy(7-1 downto 0) := Li_cast2_fu_352_p1(7-1 downto 0);
            vlo_cpy(7-1 downto 0) := tmp(7-1 downto 0);
        end if;
        v1_cpy := (others => '0');
        v1_cpy(95-1 downto 0) := loc_V_fu_374_p1;
        tmp_mask_low := (others => '1');
        res_mask_low := std_logic_vector(shift_left(unsigned(tmp_mask_low),to_integer(unsigned('0' & vlo_cpy(31-1 downto 0)))));
        tmp_mask_hi := (others => '1');
        res_mask_hi := std_logic_vector(shift_left(unsigned(tmp_mask_hi),to_integer(unsigned('0' & vhi_cpy(31-1 downto 0)))));
        res_mask := (res_mask_hi(95-2 downto 0) & '0') or not res_mask_low;
        tmp_v1 := std_logic_vector(shift_left(unsigned(v1_cpy(95-1 downto 0)),to_integer(unsigned('0' & v1_shift(31-1 downto 0)))));
        if v1_reverse then
            for p_Result_2_fu_378_p5_i in 0 to 95-1 loop
                res_v1(p_Result_2_fu_378_p5_i) := tmp_v1(95-1-p_Result_2_fu_378_p5_i);
            end loop;
        else
            res_v1 := tmp_v1;
        end if;
        p_Result_2_fu_378_p5 <= ((p_Val2_s_reg_167 and res_mask) or (res_v1 and not res_mask));
    end process;

    
    p_Result_3_fu_246_p4_proc : process(a_V, tmp_23_cast_fu_224_p1, Ui_2_cast_fu_242_p1)
    variable vlo_cpy : STD_LOGIC_VECTOR(71+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(71+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(71 - 1 downto 0);
    variable p_Result_3_fu_246_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(71 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(71 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(71 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(7 - 1 downto 0) := tmp_23_cast_fu_224_p1(7 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(7 - 1 downto 0) := Ui_2_cast_fu_242_p1(7 - 1 downto 0);
        v0_cpy := a_V;
        if (vlo_cpy(7 - 1 downto 0) > vhi_cpy(7 - 1 downto 0)) then
            vhi_cpy(7-1 downto 0) := std_logic_vector(71-1-unsigned(Ui_2_cast_fu_242_p1(7-1 downto 0)));
            vlo_cpy(7-1 downto 0) := std_logic_vector(71-1-unsigned(tmp_23_cast_fu_224_p1(7-1 downto 0)));
            for p_Result_3_fu_246_p4_i in 0 to 71-1 loop
                v0_cpy(p_Result_3_fu_246_p4_i) := a_V(71-1-p_Result_3_fu_246_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy),to_integer(unsigned('0' & vlo_cpy(7-1 downto 0)))));

        section := (others=>'0');
        section(7-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(7-1 downto 0)) - unsigned(vlo_cpy(7-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(71-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        p_Result_3_fu_246_p4 <= resvalue(71-1 downto 0);
    end process;


    -- pp_V_address0 assign process. --
    pp_V_address0_assign_proc : process(ap_CS_fsm, tmp_6_fu_274_p1, tmp_3_fu_263_p1)
    begin
        if ((ap_ST_st6_fsm_5 = ap_CS_fsm)) then 
            pp_V_address0 <= tmp_3_fu_263_p1(3 - 1 downto 0);
        elsif ((ap_ST_st8_fsm_7 = ap_CS_fsm)) then 
            pp_V_address0 <= tmp_6_fu_274_p1(3 - 1 downto 0);
        elsif ((ap_ST_st2_fsm_1 = ap_CS_fsm)) then 
            pp_V_address0 <= ap_const_lv64_0(3 - 1 downto 0);
        else 
            pp_V_address0 <= "XXX";
        end if; 
    end process;


    -- pp_V_ce0 assign process. --
    pp_V_ce0_assign_proc : process(ap_CS_fsm)
    begin
        if (((ap_ST_st2_fsm_1 = ap_CS_fsm) or (ap_ST_st8_fsm_7 = ap_CS_fsm) or (ap_ST_st6_fsm_5 = ap_CS_fsm))) then 
            pp_V_ce0 <= ap_const_logic_1;
        else 
            pp_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    pp_V_d0 <= tmp_5_reg_434;

    -- pp_V_we0 assign process. --
    pp_V_we0_assign_proc : process(ap_CS_fsm)
    begin
        if (((ap_ST_st6_fsm_5 = ap_CS_fsm))) then 
            pp_V_we0 <= ap_const_logic_1;
        else 
            pp_V_we0 <= ap_const_logic_0;
        end if; 
    end process;


    -- pps_V_address0 assign process. --
    pps_V_address0_assign_proc : process(ap_CS_fsm, tmp_6_reg_442, exitcond_fu_321_p2, tmp_8_fu_289_p1, tmp_4_fu_333_p1)
    begin
        if ((ap_ST_st9_fsm_8 = ap_CS_fsm)) then 
            pps_V_address0 <= tmp_6_reg_442(3 - 1 downto 0);
        elsif ((ap_ST_st7_fsm_6 = ap_CS_fsm)) then 
            pps_V_address0 <= ap_const_lv64_0(3 - 1 downto 0);
        elsif (((ap_ST_st10_fsm_9 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond_fu_321_p2)))) then 
            pps_V_address0 <= ap_const_lv64_4(3 - 1 downto 0);
        elsif (((ap_ST_st10_fsm_9 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond_fu_321_p2))) then 
            pps_V_address0 <= tmp_4_fu_333_p1(3 - 1 downto 0);
        elsif ((ap_ST_st8_fsm_7 = ap_CS_fsm)) then 
            pps_V_address0 <= tmp_8_fu_289_p1(3 - 1 downto 0);
        else 
            pps_V_address0 <= "XXX";
        end if; 
    end process;


    -- pps_V_ce0 assign process. --
    pps_V_ce0_assign_proc : process(ap_CS_fsm, exitcond_fu_321_p2)
    begin
        if (((ap_ST_st8_fsm_7 = ap_CS_fsm) or ((ap_ST_st10_fsm_9 = ap_CS_fsm) and (ap_const_lv1_0 = exitcond_fu_321_p2)) or ((ap_ST_st10_fsm_9 = ap_CS_fsm) and not((ap_const_lv1_0 = exitcond_fu_321_p2))) or (ap_ST_st7_fsm_6 = ap_CS_fsm) or (ap_ST_st9_fsm_8 = ap_CS_fsm))) then 
            pps_V_ce0 <= ap_const_logic_1;
        else 
            pps_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    -- pps_V_d0 assign process. --
    pps_V_d0_assign_proc : process(ap_CS_fsm, pp_V_q0, tmp_9_fu_314_p2)
    begin
        if ((ap_ST_st9_fsm_8 = ap_CS_fsm)) then 
            pps_V_d0 <= tmp_9_fu_314_p2;
        elsif ((ap_ST_st7_fsm_6 = ap_CS_fsm)) then 
            pps_V_d0 <= pp_V_q0;
        else 
            pps_V_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    -- pps_V_we0 assign process. --
    pps_V_we0_assign_proc : process(ap_CS_fsm)
    begin
        if (((ap_ST_st7_fsm_6 = ap_CS_fsm) or (ap_ST_st9_fsm_8 = ap_CS_fsm))) then 
            pps_V_we0 <= ap_const_logic_1;
        else 
            pps_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    r_V_1_fu_310_p1 <= std_logic_vector(resize(unsigned(r_V_fu_300_p4),41));
    r_V_fu_300_p4 <= pps_V_q0(40 downto 17);
    tmp_14_fu_255_p1 <= p_Result_3_fu_246_p4(41 - 1 downto 0);
    tmp_15_fu_279_p1 <= i_1_reg_156(2 - 1 downto 0);
    tmp_16_fu_390_p1 <= pps_V_q0(27 - 1 downto 0);
    tmp_17_fu_338_p1 <= i_2_reg_179(2 - 1 downto 0);
    tmp_18_fu_370_p1 <= pps_V_q0(17 - 1 downto 0);
    tmp_1_fu_327_p2 <= std_logic_vector(unsigned(i_2_reg_179) + unsigned(ap_const_lv3_1));
    tmp_23_cast_fu_224_p1 <= std_logic_vector(resize(unsigned(Lo_assign_fu_214_p4),32));
    tmp_2_fu_228_p2 <= std_logic_vector(unsigned(Lo_assign_fu_214_p4) + unsigned(ap_const_lv7_10));
    tmp_3_fu_263_p1 <= std_logic_vector(resize(unsigned(i_reg_144),64));
    tmp_4_fu_333_p1 <= std_logic_vector(resize(unsigned(i_2_reg_179),64));
    tmp_6_fu_274_p1 <= std_logic_vector(resize(unsigned(i_1_reg_156),64));
    tmp_7_fu_283_p2 <= std_logic_vector(unsigned(tmp_15_fu_279_p1) + unsigned(ap_const_lv2_3));
    tmp_8_fu_289_p1 <= std_logic_vector(resize(unsigned(tmp_7_fu_283_p2),64));
    tmp_9_fu_314_p2 <= std_logic_vector(unsigned(r_V_1_fu_310_p1) + unsigned(pp_V_q0));
    tmp_fu_192_p1 <= std_logic_vector(resize(unsigned(b_V),41));
    tmp_s_fu_208_p2 <= "1" when (i_reg_144 = ap_const_lv3_4) else "0";
end behav;