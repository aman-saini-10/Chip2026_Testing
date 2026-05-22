`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.05.2026 11:17:02
// Design Name: 
// Module Name: TO_FMC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TO_FMC(

    input [3:0] BANK_EN,

    input       WL_EN,
    input       SA_EN,
    input       BL_PCHG,
    input       CLK_SA,
    input       WRITE_EN,
    input  [1:0] CS,

    input  [3:0] SCN_SEL,
    input       CLK_A,
    input       CLK_B,
    input       IN_EN,
    input       SCN_IN,

    input       InputEN_DAC,
    input       CALIB_EN,
    input       BANK_SEL,
    input       CHG_EN,
    input       RST_CAP_B,
    input       VDAC_CTRL,
    input       VTC_EN,
    input       TDC_EN,
    input       TDC_RST,
    input       TDC_COMPUTE,
    input       DFF_RST,
    input       CTRL_EN,

    // PCB TMUX control signals
    input       CTRL_VB,
    input       CTRL_VBP,
    input       CTRL_VBN,
    
    output FMC_L21,
    output FMC_L22,
    output FMC_R19,
    output FMC_T19,
    output FMC_K19,
    output FMC_K20,
    output FMC_D20,
    output FMC_C20,
    output FMC_E21,
    output FMC_D21,
    output FMC_N19,
    output FMC_N20,
    output FMC_J18,
    output FMC_K18,
    output FMC_R20,
    output FMC_R21,
    output FMC_L17,
    output FMC_M17,
    output FMC_B19,
    output FMC_B20,
    output FMC_E15,
    output FMC_D15,
    output FMC_F18,
    output FMC_E18,
    output FMC_M19,
    output FMC_M20,
    output FMC_N22,
    output FMC_P22,
    output FMC_J21,
    output FMC_J22,
    output FMC_G20,
    output FMC_G21,
    output FMC_G19,
    output FMC_F19,
    output FMC_D22,
    output FMC_C22,
    output FMC_B16,
    output FMC_B17,
    output FMC_B21,
    output FMC_B22,
    
    input FMC_C17, //IMC DONE
    input FMC_C18, //SCN OUT
    
    output[1:0] DIG_AXI_OUT_0,
    output[31:0] DIG_DEBUG_AXI_OUT_0,
    output[3:0] DIG_DEBUG_AXI_OUT_1
    );
    
    //Update FMC INPUT PINS
    assign DIG_AXI_OUT_0 = {FMC_C17,FMC_C18}; //IMC_DONE,SCN_OUT
    
    //Update FMC OUTPUT PINS
    assign FMC_L21 = WL_EN;
    assign FMC_L22 = BANK_EN_0;
    assign FMC_R19 = BANK_EN_1;
    assign FMC_T19 = BANK_EN_3;
    assign FMC_K19 = BANK_EN_2;
    assign FMC_K20 = InputEN_DAC;
    assign FMC_D20 = READ_EN;
    assign FMC_C20 = BL_PCHG;
    assign FMC_E21 = CLK_SA;
    assign FMC_D21 = WRITE_EN;
    assign FMC_N19 = SCN_SEL_0;
    assign FMC_N20 = SCN_SEL_1;
    assign FMC_J18 = SCN_SEL_2;
    assign FMC_K18 = CS_0;
    assign FMC_R20 = CS_1;
    assign FMC_R21 = BL_SEL_0;
    assign FMC_L17 = BL_SEL_1;
    assign FMC_M17 = SA_EN;
    assign FMC_B19 = CALIB_EN;
    assign FMC_B20 = BANK_SEL;
    assign FMC_E15 = DEL_RST;
    assign FMC_D15 = PRECHARGE;
    assign FMC_F18 = ENTIME;
    assign FMC_E18 = ENCHG;
    assign FMC_M19 = VDAC_CTRL;
    assign FMC_M20 = VTC_EN;
    assign FMC_N22 = TDC_EN;
    assign FMC_P22 = TDC_RST;
    assign FMC_J21 = DFF_RST;
    assign FMC_J22 = TDC_COMPUTE;
    assign FMC_G20 = IN;
    assign FMC_G21 = CTRL_EN;
    assign FMC_G19 = CLK_A;
    assign FMC_F19 = CLK_B;
    assign FMC_D22 = IN_EN;
    assign FMC_C22 = SCN_IN;
    assign FMC_B16 = CTRL_VB;
    assign FMC_B17 = CTRL_VBP;
    assign FMC_B21 = CTRL_VBN;
    assign FMC_B22 = CTRL_AIN;
    
    //Update DEBUG AXI PINS 
    assign DIG_DEBUG_AXI_OUT_0[0]  = BANK_EN[0];
    assign DIG_DEBUG_AXI_OUT_0[1]  = BANK_EN[1];
    assign DIG_DEBUG_AXI_OUT_0[2]  = BANK_EN[2];
    assign DIG_DEBUG_AXI_OUT_0[3]  = BANK_EN[3];
    assign DIG_DEBUG_AXI_OUT_0[4]  = WL_EN;
    assign DIG_DEBUG_AXI_OUT_0[5]  = SA_EN;
    assign DIG_DEBUG_AXI_OUT_0[6]  = BL_PCHG;
    assign DIG_DEBUG_AXI_OUT_0[7]  = CLK_SA;
    assign DIG_DEBUG_AXI_OUT_0[8]  = WRITE_EN;
    assign DIG_DEBUG_AXI_OUT_0[9]  = CS[0];
    assign DIG_DEBUG_AXI_OUT_0[10] = CS[1];
    assign DIG_DEBUG_AXI_OUT_0[11] = SCN_SEL[0];
    assign DIG_DEBUG_AXI_OUT_0[12] = SCN_SEL[1];
    assign DIG_DEBUG_AXI_OUT_0[13] = SCN_SEL[2];
    assign DIG_DEBUG_AXI_OUT_0[14] = SCN_SEL[3];
    assign DIG_DEBUG_AXI_OUT_0[15] = InputEN_DAC;
    assign DIG_DEBUG_AXI_OUT_0[16] = CALIB_EN;
    assign DIG_DEBUG_AXI_OUT_0[17] = BANK_SEL;
    assign DIG_DEBUG_AXI_OUT_0[18] = CHG_EN;
    assign DIG_DEBUG_AXI_OUT_0[19] = RST_CAP_B;
    assign DIG_DEBUG_AXI_OUT_0[20] = VDAC_CTRL;
    assign DIG_DEBUG_AXI_OUT_0[21] = VTC_EN;
    assign DIG_DEBUG_AXI_OUT_0[22] = TDC_EN;
    assign DIG_DEBUG_AXI_OUT_0[23] = TDC_RST;
    assign DIG_DEBUG_AXI_OUT_0[24] = TDC_COMPUTE;
    assign DIG_DEBUG_AXI_OUT_0[25] = DFF_RST;
    assign DIG_DEBUG_AXI_OUT_0[26] = CTRL_EN;
    assign DIG_DEBUG_AXI_OUT_0[27] = CLK_A;
    assign DIG_DEBUG_AXI_OUT_0[28] = CLK_B;
    assign DIG_DEBUG_AXI_OUT_0[29] = IN_EN;
    assign DIG_DEBUG_AXI_OUT_0[30] = SCN_IN;
    assign DIG_DEBUG_AXI_OUT_0[31] = CTRL_VB;
    assign DIG_DEBUG_AXI_OUT_1[1]  = CTRL_VBP;
    assign DIG_DEBUG_AXI_OUT_1[0]  = CTRL_VBN; 
     
endmodule