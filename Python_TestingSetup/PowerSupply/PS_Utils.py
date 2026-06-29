import pyvisa
import time
import numpy as np
##Fns for B2902B
#device = "USB0::0x2A8D::0x9201::MY61391394/5::0::INSTR"
def connect_B2902B(device):
    rm = pyvisa.ResourceManager()
    instrument = rm.open_resource(device)  # Replace with your device address
    print("Connected to:", instrument.query("*IDN?").strip())
    # Make sure nothing is blocking the UI
    instrument.write(":DISP:WIND:TEXT:CLE")
    return instrument

#Disconnect the device. Please call disconnect channel before this
def disconnect_B2902B(instrument):
     instrument.close()
     return 0


#set the voltage with current limit Hardcode voltage/current to be not more than 1 volt/amp and less than 0 volt/amp in any case
def set_voltage_B2902B(instrument,channel,voltage,current_limit):
    if(voltage<0 or voltage>1):
        kill_channel_B2902B(instrument,channel)
        print("Trying to set damaging voltage. channel killed")
        return 1

    if(current_limit<0 or current_limit>1):
        kill_channel_B2902B(instrument,channel)
        print("Trying to set damaging current_limit. channel killed")
        return 1

    # Configure output
    instrument.write(f"SOUR{channel}:FUNC VOLT")
    instrument.write(f"SOUR{channel}:VOLT {voltage}")
    instrument.write(f"SOUR{channel}:CURR {current_limit}")

    # Turn on output
    instrument.write(f"OUTP{channel} ON")
    #wait for supplies to settle
    time.sleep(1)
    
    # Read back values -> needed to update display on supply
    set_voltage = instrument.query(f"SOUR{channel}:VOLT?").strip()
    set_current = instrument.query(f"SOUR{channel}:CURR?").strip()
    meas_voltage = instrument.query(f"MEAS:VOLT? (@{channel})").strip()
    meas_current = instrument.query(f"MEAS:CURR? (@{channel})").strip()
    return 0

#get the measured values form supply returns [voltage,current]
def get_values_B2902B(instrument,channel):
    meas_voltage = instrument.query(f"MEAS:VOLT? (@{channel})").strip()
    meas_current = instrument.query(f"MEAS:CURR? (@{channel})").strip()
    return [meas_voltage,meas_current]

def kill_channel_B2902B(instrument,channel):
    #Set voltages to zero and then kill
    instrument.write(f"SOUR{channel}:FUNC VOLT")
    instrument.write(f"SOUR{channel}:VOLT {0}")
    instrument.write(f"SOUR{channel}:CURR {0}")
    instrument.write(f"OUTP{channel} OFF")
    instrument.write(":DISP:WIND:TEXT:CLE")


##Fns for E6313A
#device = "USB0::0x2A8D::0x1202::MY59003914::0::INSTR"
def connect_E36313A(device):
    rm = pyvisa.ResourceManager()
    instrument = rm.open_resource(device)  # Replace with your device address
    print("Connected to:", instrument.query("*IDN?").strip())
    # Make sure nothing is blocking the UI
    instrument.write(":DISP:WIND:TEXT:CLE")
    return instrument

#Disconnect the device. Please call disconnect channel before this
def disconnect_E36313A(instrument):
     instrument.close()
     return 0

#set the voltage with current limit Hardcode voltage/curren to be not more than 1 volt/amp and less than 0 volt/amp in any case
def set_voltage_E36313A(instrument,channel,voltage,current_limit):
    if(voltage<0 or voltage>5):
        kill_channel_E36313A(instrument,channel)
        print("Trying to set damaging voltage. channel killed")
        return 1

    if(current_limit<0 or current_limit>0.5):
        kill_channel_E36313A(instrument,channel)
        print("Trying to set damaging current_limit. channel killed")
        return 1
    # Select output channel
    instrument.write(f"INST:NSEL {channel}")

    # Set voltage and current limit
    instrument.write(f"VOLT {voltage}")
    instrument.write(f"CURR {current_limit}")

    # Turn on output and wait for it to settle
    instrument.write("OUTP ON")
    time.sleep(1)
    return 0

#get the measured values form supply returns [voltage,current]
def get_values_E36313A(instrument,channel):
    instrument.write(f"INST:NSEL {channel}")
    meas_voltage = instrument.query("MEAS:VOLT?").strip()
    meas_current = instrument.query("MEAS:CURR?").strip()
    return [meas_voltage,meas_current]

def kill_channel_E36313A(instrument,channel):
    instrument.write(f"INST:NSEL {channel}")
    #set voltage to 0 and then kill
    instrument.write(f"VOLT {0}")
    instrument.write(f"CURR {0.00}")
    instrument.write("OUTP OFF")

##Fns for E6313A
#device = "USB0::0x2A8D::0x1202::MY59003914::0::INSTR"
def connect_N5173B(device):
    rm = pyvisa.ResourceManager()
    instrument = rm.open_resource(device)  # Replace with your device address
    instrument.write_termination = '\n'
    instrument.read_termination = '\n'
    print("Connected to:", instrument.query("*IDN?").strip())
    # Make sure nothing is blocking the UI
    instrument.write(":DISP:WIND:TEXT:CLE")
    return instrument

#Disconnect the device. Please call disconnect channel before this
def disconnect_N5173B(instrument):
     instrument.close()
     return 0

#Enable the signaling
def enable_output_N5173B(instrument):
    instrument.write("OUTP ON")

#kill channel
def kill_N5173B(instrument):
    instrument.write("OUTP OFF")

#set the frequency
def set_frequency_N5173B(instrument, frequency_hz):
    instrument.write(f"FREQ {frequency_hz}HZ")

#Set voltage by converting it to power
def set_voltage_N5173B(instrument, voltage):
    """
    Sets the output RF power of the N5173B to achieve the desired sine wave voltage amplitude.
    
    Parameters:
        inst: PyVISA instrument object for the N5173B.
        voltage: Desired sine wave peak amplitude (Volts).
    """
    if(voltage<0 or voltage>1):
        kill_N5173B(instrument)
        print("Trying to set damaging voltage. supply killed")
        return
    # Calibration point: 0.3 V corresponds to 2.55 dBm
    ref_amp = 0.3  # volts
    ref_power_linear = (ref_amp ** 2) / 2
    ref_dBm = 2.55
    P0 = ref_power_linear * 10 ** (-ref_dBm / 10)  # inferred P0 in watts

    # Convert target voltage to power
    P = (voltage ** 2) / 2  # power in watts for sine wave amplitude
    P_dBm = 10 * np.log10(P / P0)

    # Set power level on instrument
    instrument.write(f"POW {P_dBm:.3f}DBM")  # Format to 3 decimal places

def get_values_N5173B(instrument):
    """
    Query the instrument for frequency and power, then back-calculate voltage amplitude.

    Parameters:
        inst: PyVISA instrument object for N5173B
        reference_voltage (float): Reference voltage used in calibration (default 0.3 V)
        ref_dB (float): dB reading for reference voltage (default 2.55 dB)

    Returns:
        frequency_hz (float): Frequency in Hz
        voltage (float): Estimated voltage amplitude in volts
    """
    # Query frequency and power
    reference_voltage=0.3
    ref_dB=2.55
    frequency_hz = float(instrument.query("FREQ?"))
    power_dBm = float(instrument.query("POW:LEV?"))

    # Calibration: compute P0 using reference voltage and ref_dB
    P_ref = (reference_voltage ** 2) / 2
    P0 = P_ref * 10 ** (-ref_dB / 10)

    # Convert dBm to watts
    P_watt = 10 ** (power_dBm / 10) * P0

    # Calculate voltage amplitude
    voltage = np.sqrt(2 * P_watt)
    return [frequency_hz, voltage]