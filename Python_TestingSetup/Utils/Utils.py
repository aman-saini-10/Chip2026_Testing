import sys
sys.path.append(r"..\Python_Notebook\Communiaction")
import TCP_IP_UTILS
import pandas as pd
import numpy as np

def pack_bits_to_u8(bit_array):
    # Pad with zeros if length is not a multiple of 32 ->Requirement of AXI DMA
    padding = (32 - len(bit_array) % 32) % 32
    padded_array = bit_array + [0] * padding

    u8_array = []
    for i in range(0, len(padded_array), 8):
        byte = 0
        for bit_index in range(8):
            byte |= (padded_array[i + bit_index] & 1) << (bit_index)
        u8_array.append(byte)

    return np.array(u8_array, dtype=np.uint8)

#Common Signals to be used
DIG_IN_SIGNAL_LEN = 40
WL_EN = 31
BANK_EN_0 = 30
BANK_EN_1 = 29
BANK_EN_2 = 28
BANK_EN_3 = 27
InputEN_DAC = 26
READ_EN = 25
BL_PCHG = 24
CLK_SA = 23
WRITE_EN = 22
SCN_SEL_0 = 21
SCN_SEL_1 = 20
SCN_SEL_2 = 19
CS_0 = 18
CS_1 = 17
BL_SEL_0 = 16
BL_SEL_1 = 15
SA_EN = 14
CALIB_EN = 13
BANK_SEL = 12
DEL_RST = 11
PRECHARGE = 10
ENTIME = 9
ENCHG = 8
VDAC_CTRL = 7
VTC_EN = 6
TDC_EN = 5
TDC_RST = 4
DFF_RST = 3
TDC_COMPUTE = 2
IN = 1
CTRL_EN = 0
#Next AXI BUS
CTRL_AIN = 39
CTRL_VBN = 38
CTRL_VBP = 37
CTRL_VB = 36
CLK_A = 35
CLK_B = 34
IN_EN = 33
SCN_IN = 32

#OUTPUT AXI
IMC_DONE = 1
SCN_OUT = 0

signal_array = list(range(0,DIG_IN_SIGNAL_LEN))
default_value_array = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1]


#MODE IO SIGNALS -> These set verilog parameters.
MODE_SIGNAL_LEN = 23

VERILOG_C_SCAN = 0
RESET_V = 1
SCAN_SEL_0_V = 2
SCAN_SEL_1_V = 3
SCAN_SEL_2_V = 4
SCAN_IN_RECV_V = 5
SCAN_IN_SEND_V = 6
SCAN_IN_EN_V = 7
SCAN_OUT_EN_V = 8
Test_DMA_V = 9
NCLK_0_V = 10 #LSB
NCLK_1_V = 11
NCLK_2_V = 12
NCLK_3_V = 13
NCLK_4_V = 14
NCLK_5_V = 15
NCLK_6_V = 16
NCLK_7_V = 17 #MSB
TOPS_EN_V = 18
TOPS_STOP_V = 19
WRITE_SRAM_EN_V = 20
FAST_IMC_EN_V = 21
SEND_IMC_DATA_V = 22
mode_signal_array = list(range(0,MODE_SIGNAL_LEN))
mode_default_value_array = [0]*MODE_SIGNAL_LEN

calib_wl_idx = [0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135,
   144, 153, 162, 171, 180, 189, 198, 207, 216, 225, 234, 243, 252, 261, 270, 279, 288,
   289, 298, 307, 316, 325, 334, 343, 352, 361, 370, 379, 388, 397, 406, 415, 424,
   433, 442, 451, 460, 469, 478, 487, 496, 505, 514, 523, 532, 541, 550, 559, 568, 577,
   578, 587, 596, 605, 614, 623, 632, 641, 650, 659, 668, 677, 686, 695, 704, 713,
   722, 731, 740, 749, 758, 767, 776, 785, 794, 803, 812, 821, 830, 839, 848, 857, 866,
   867, 876, 885, 894, 903, 912, 921, 930, 939, 948, 957, 966, 975, 984, 993, 1002,
  1011, 1020, 1029, 1038, 1047, 1056, 1065, 1074, 1083, 1092, 1101, 1110, 1119, 1128, 1137, 1146, 1155
]
osc_calib_wl_idx = [288, 289, 866, 867]

#Scan Chians values [SCN_SEL_2,SCN_SEL_1,SCN_SEL_0]
CONTROL_LOGIC_SC = {"id":7, "value" : [1,1,1], "len":162}
WRITE_DATA_SC = {"id":6, "value" : [1,1,0], "len":296}
SA_OUT_SC = {"id":5, "value" : [1,0,1], "len":296}
WL_SC = {"id":4, "value" : [1,0,0], "len":1156}
DL_EN_SC_RM = {"id":3, "value" : [0,1,1], "len":72}
DL_EN_SC_LM = {"id":2, "value" : [0,1,0], "len":72}
TDC_OUT_SC_RM = {"id":1, "value" : [0,0,1], "len":640}
TDC_OUT_SC_LM = {"id":0, "value" : [0,0,0], "len":640}


#Correction Data to be loaded
# TD_CORRECTION = np.load(r'd:\Chip2025\Chip2025_Testing\Python_Notebook\Utils\DL_Correction_Data\TD_DL_CORRECTION.npy')

#Common Functions to be used
def Set_Chip_IO(client_socket,signal_array,value_array,debug):
    data = [len(signal_array)] + signal_array + value_array
    #print(data)
    fn_id = 1; #set_ChipIO
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data 

def Set_Mode_IO(client_socket,signal_array,value_array,debug):
    data = [len(signal_array)] + signal_array + value_array
    #print(data)
    fn_id = 11; #set_ModeIO
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data 

def Set_ChipIO_to_Default(client_socket): 
    ret_data = Set_Chip_IO(client_socket,signal_array,default_value_array,0)
    print("Default Signals Set")
    return ret_data

def Set_ModeIO_to_Default(client_socket): 
    ret_data = Set_Mode_IO(client_socket,mode_signal_array,mode_default_value_array,0)
    print("Default Signals Set")
    return ret_data

def ScanIN_Data(client_socket,scan_id,scan_len,scan_data,debug):
    scn_len_bytes =  list(scan_len.to_bytes(2, "little"))
    if debug : print(scn_len_bytes)
    data = [scan_id] + scn_len_bytes + list(pack_bits_to_u8(scan_data))
    fn_id = 3; #scanin
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def ScanOUT_Data(client_socket,scan_id,scan_len,debug):
    scn_len_bytes =  list(scan_len.to_bytes(2, "little"))
    if debug : print(scn_len_bytes)
    data = [scan_id] + scn_len_bytes
    fn_id = 4; #scanout
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Write_SRAM(client_socket,write_data,debug):
    fn_id = 6; #writesram
    data = list(pack_bits_to_u8(write_data))
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Write_SRAM_Masked(client_socket,write_data,debug):
    fn_id = 10; #writesrammasked
    data = list(pack_bits_to_u8(write_data))
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Read_SRAM(client_socket,debug):
    fn_id = 5; #readsram
    data = [128] #send dummy data. function data with 0 length is not handled
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Marching_SRAM(client_socket,debug):
    fn_id = 9; #marchingsram
    data = [128] #send dummy data. function data with 0 length is not handled
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Fast_Calib(client_socket,data,debug):
    fn_id = 12; #fastcalib
    data = [data] #send DL to enable
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Fast_IMC(client_socket,TIME_CHARGE,debug):
    fn_id = 13; #marchingsram
    data = [TIME_CHARGE] # 1 for TD, 0 for CD
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def Send_CorrectionData(client_socket,Corr_Data,debug):
    fn_id = 14; #marchingsram
    data = Corr_Data.tobytes() # Flattened array.
    ret_data = TCP_IP_UTILS.call_fpga_fn(client_socket,fn_id,len(data),data,debug)
    return ret_data

def get_Default_Write_Data(path):
    rows = 296 
    padded_rows = 320 #To make multiple of 4 bytes
    column = 1156

    # Global SRAM array: 296 cells per WL, 1156 WLs total
    arr = np.zeros((padded_rows, column), dtype=np.uint8)

    # Calibration WLs per bank (32 blocks + extra one in block 31)
    calib_wls = [i * 9 for i in range(32)] + [288]  # 33 WLs

    # Bank metadata
    bank_offsets = [867, 578, 289, 0]
    bank_reversed = [True, False, True, False]

    # Simulated calibration data per bank (replace with your actual data)
    # Each bank has 33 calibration WLs, each with 296 cells
    bank_data = []
    df = pd.read_excel(path, sheet_name="BANK0")
    bank_data.append(df.iloc[:,1:34].to_numpy(dtype=np.uint8))
    df = pd.read_excel(path, sheet_name="BANK1")
    bank_data.append(df.iloc[:,1:34].to_numpy(dtype=np.uint8))
    df = pd.read_excel(path, sheet_name="BANK2")
    bank_data.append(df.iloc[:,1:34].to_numpy(dtype=np.uint8))
    df = pd.read_excel(path, sheet_name="BANK3")
    bank_data.append(df.iloc[:,1:34].to_numpy(dtype=np.uint8))
    # Fill the array
    for bank_id in range(4):
        offset = bank_offsets[bank_id]
        reversed_order = bank_reversed[bank_id]
        calib_data = bank_data[bank_id]  # shape: (33, 296)
        for i, wl_in_bank in enumerate(calib_wls):
            physical_wl = offset + (288 - wl_in_bank if reversed_order else wl_in_bank)
            arr[:rows, physical_wl] = calib_data[::-1,i]
    return arr.flatten(order='F') #Faltten Across Columns
