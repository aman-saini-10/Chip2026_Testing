//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Jun 17 17:49:57 2026
//Host        : aman-PC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    FMC_B16,
    FMC_B17,
    FMC_B19,
    FMC_B20,
    FMC_B21,
    FMC_B22,
    FMC_C17,
    FMC_C18,
    FMC_C20,
    FMC_C22,
    FMC_D15,
    FMC_D20,
    FMC_D21,
    FMC_D22,
    FMC_E15,
    FMC_E18,
    FMC_E21,
    FMC_F18,
    FMC_F19,
    FMC_G19,
    FMC_G20,
    FMC_G21,
    FMC_J18,
    FMC_J21,
    FMC_J22,
    FMC_K18,
    FMC_K19,
    FMC_K20,
    FMC_L17,
    FMC_L21,
    FMC_L22,
    FMC_M17,
    FMC_M19,
    FMC_M20,
    FMC_N19,
    FMC_N20,
    FMC_N22,
    FMC_P22,
    FMC_R19,
    FMC_R20,
    FMC_R21,
    FMC_T19);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output FMC_B16;
  output FMC_B17;
  output FMC_B19;
  output FMC_B20;
  output FMC_B21;
  output FMC_B22;
  input FMC_C17;
  input FMC_C18;
  output FMC_C20;
  output FMC_C22;
  output FMC_D15;
  output FMC_D20;
  output FMC_D21;
  output FMC_D22;
  output FMC_E15;
  output FMC_E18;
  output FMC_E21;
  output FMC_F18;
  output FMC_F19;
  output FMC_G19;
  output FMC_G20;
  output FMC_G21;
  output FMC_J18;
  output FMC_J21;
  output FMC_J22;
  output FMC_K18;
  output FMC_K19;
  output FMC_K20;
  output FMC_L17;
  output FMC_L21;
  output FMC_L22;
  output FMC_M17;
  output FMC_M19;
  output FMC_M20;
  output FMC_N19;
  output FMC_N20;
  output FMC_N22;
  output FMC_P22;
  output FMC_R19;
  output FMC_R20;
  output FMC_R21;
  output FMC_T19;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire FMC_B16;
  wire FMC_B17;
  wire FMC_B19;
  wire FMC_B20;
  wire FMC_B21;
  wire FMC_B22;
  wire FMC_C17;
  wire FMC_C18;
  wire FMC_C20;
  wire FMC_C22;
  wire FMC_D15;
  wire FMC_D20;
  wire FMC_D21;
  wire FMC_D22;
  wire FMC_E15;
  wire FMC_E18;
  wire FMC_E21;
  wire FMC_F18;
  wire FMC_F19;
  wire FMC_G19;
  wire FMC_G20;
  wire FMC_G21;
  wire FMC_J18;
  wire FMC_J21;
  wire FMC_J22;
  wire FMC_K18;
  wire FMC_K19;
  wire FMC_K20;
  wire FMC_L17;
  wire FMC_L21;
  wire FMC_L22;
  wire FMC_M17;
  wire FMC_M19;
  wire FMC_M20;
  wire FMC_N19;
  wire FMC_N20;
  wire FMC_N22;
  wire FMC_P22;
  wire FMC_R19;
  wire FMC_R20;
  wire FMC_R21;
  wire FMC_T19;

  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .FMC_B16(FMC_B16),
        .FMC_B17(FMC_B17),
        .FMC_B19(FMC_B19),
        .FMC_B20(FMC_B20),
        .FMC_B21(FMC_B21),
        .FMC_B22(FMC_B22),
        .FMC_C17(FMC_C17),
        .FMC_C18(FMC_C18),
        .FMC_C20(FMC_C20),
        .FMC_C22(FMC_C22),
        .FMC_D15(FMC_D15),
        .FMC_D20(FMC_D20),
        .FMC_D21(FMC_D21),
        .FMC_D22(FMC_D22),
        .FMC_E15(FMC_E15),
        .FMC_E18(FMC_E18),
        .FMC_E21(FMC_E21),
        .FMC_F18(FMC_F18),
        .FMC_F19(FMC_F19),
        .FMC_G19(FMC_G19),
        .FMC_G20(FMC_G20),
        .FMC_G21(FMC_G21),
        .FMC_J18(FMC_J18),
        .FMC_J21(FMC_J21),
        .FMC_J22(FMC_J22),
        .FMC_K18(FMC_K18),
        .FMC_K19(FMC_K19),
        .FMC_K20(FMC_K20),
        .FMC_L17(FMC_L17),
        .FMC_L21(FMC_L21),
        .FMC_L22(FMC_L22),
        .FMC_M17(FMC_M17),
        .FMC_M19(FMC_M19),
        .FMC_M20(FMC_M20),
        .FMC_N19(FMC_N19),
        .FMC_N20(FMC_N20),
        .FMC_N22(FMC_N22),
        .FMC_P22(FMC_P22),
        .FMC_R19(FMC_R19),
        .FMC_R20(FMC_R20),
        .FMC_R21(FMC_R21),
        .FMC_T19(FMC_T19));
endmodule
