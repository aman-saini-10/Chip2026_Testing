-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed Jun 24 10:52:25 2026
-- Host        : aman-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Chip2026_Testing/CHIP2026_TestingSetup/CHIP2026_TestingSetup.srcs/sources_1/bd/design_1/ip/design_1_Unbundle_AXI_Bus_0_0/design_1_Unbundle_AXI_Bus_0_0_sim_netlist.vhdl
-- Design      : design_1_Unbundle_AXI_Bus_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_Unbundle_AXI_Bus_0_0 is
  port (
    DIG_AXI_IN_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DIG_AXI_IN_1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    BANK_EN_C : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WL_EN_C : out STD_LOGIC;
    SA_EN_C : out STD_LOGIC;
    BL_PCHG_C : out STD_LOGIC;
    CLK_SA_C : out STD_LOGIC;
    WRITE_EN_C : out STD_LOGIC;
    CS_C : out STD_LOGIC_VECTOR ( 1 downto 0 );
    SCN_SEL_C : out STD_LOGIC_VECTOR ( 3 downto 0 );
    CLK_A_C : out STD_LOGIC;
    CLK_B_C : out STD_LOGIC;
    IN_EN_C : out STD_LOGIC;
    SCN_IN_C : out STD_LOGIC;
    InputEN_DAC_C : out STD_LOGIC;
    CALIB_EN_C : out STD_LOGIC;
    BANK_SEL_C : out STD_LOGIC;
    CHG_EN_C : out STD_LOGIC;
    RST_CAP_B_C : out STD_LOGIC;
    VDAC_CTRL_C : out STD_LOGIC;
    VTC_EN_C : out STD_LOGIC;
    TDC_EN_C : out STD_LOGIC;
    TDC_RST_C : out STD_LOGIC;
    TDC_COMPUTE_C : out STD_LOGIC;
    DFF_RST_C : out STD_LOGIC;
    CTRL_EN_C : out STD_LOGIC;
    CTRL_VB_C : out STD_LOGIC;
    CTRL_VBP_C : out STD_LOGIC;
    CTRL_VBN_C : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_Unbundle_AXI_Bus_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_Unbundle_AXI_Bus_0_0 : entity is "design_1_Unbundle_AXI_Bus_0_0,Unbundle_AXI_Bus,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_Unbundle_AXI_Bus_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_Unbundle_AXI_Bus_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_Unbundle_AXI_Bus_0_0 : entity is "Unbundle_AXI_Bus,Vivado 2018.3";
end design_1_Unbundle_AXI_Bus_0_0;

architecture STRUCTURE of design_1_Unbundle_AXI_Bus_0_0 is
  signal \^dig_axi_in_0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^dig_axi_in_1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
begin
  BANK_EN_C(3 downto 0) <= \^dig_axi_in_0\(3 downto 0);
  BANK_SEL_C <= \^dig_axi_in_0\(17);
  BL_PCHG_C <= \^dig_axi_in_0\(6);
  CALIB_EN_C <= \^dig_axi_in_0\(16);
  CHG_EN_C <= \^dig_axi_in_0\(18);
  CLK_A_C <= \^dig_axi_in_0\(27);
  CLK_B_C <= \^dig_axi_in_0\(28);
  CLK_SA_C <= \^dig_axi_in_0\(7);
  CS_C(1 downto 0) <= \^dig_axi_in_0\(10 downto 9);
  CTRL_EN_C <= \^dig_axi_in_0\(26);
  CTRL_VBN_C <= \^dig_axi_in_1\(1);
  CTRL_VBP_C <= \^dig_axi_in_1\(0);
  CTRL_VB_C <= \^dig_axi_in_0\(31);
  DFF_RST_C <= \^dig_axi_in_0\(25);
  IN_EN_C <= \^dig_axi_in_0\(29);
  InputEN_DAC_C <= \^dig_axi_in_0\(15);
  RST_CAP_B_C <= \^dig_axi_in_0\(19);
  SA_EN_C <= \^dig_axi_in_0\(5);
  SCN_IN_C <= \^dig_axi_in_0\(30);
  SCN_SEL_C(3 downto 0) <= \^dig_axi_in_0\(14 downto 11);
  TDC_COMPUTE_C <= \^dig_axi_in_0\(24);
  TDC_EN_C <= \^dig_axi_in_0\(22);
  TDC_RST_C <= \^dig_axi_in_0\(23);
  VDAC_CTRL_C <= \^dig_axi_in_0\(20);
  VTC_EN_C <= \^dig_axi_in_0\(21);
  WL_EN_C <= \^dig_axi_in_0\(4);
  WRITE_EN_C <= \^dig_axi_in_0\(8);
  \^dig_axi_in_0\(31 downto 0) <= DIG_AXI_IN_0(31 downto 0);
  \^dig_axi_in_1\(1 downto 0) <= DIG_AXI_IN_1(1 downto 0);
end STRUCTURE;
