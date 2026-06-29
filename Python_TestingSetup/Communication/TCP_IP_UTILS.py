#Put all your TCP related functions here.

import socket

#Fn to convert integers into 4 individual bytes
def int_to_4byte_array(num):
    if not (0 <= num <= 0xFFFFFFFF):
        raise ValueError("Integer must be between 0 and 2^32 - 1 (inclusive)")
    return num.to_bytes(4, byteorder='little')

#Fn to create tcp connection with given host and port.
def tcp_connect(HOST,PORT):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((HOST, PORT))
    #client_socket.settimeout(60) #Temp timeout for one minute when waiting.
    print(f"[Client] Connected to {HOST}:{PORT}")
    return client_socket

#Fn to call fpga functions with given data. This waits for fpga to send return data and returns it to caller.
def call_fpga_fn(client_socket,fn_id,data_size,data,debug):
    packet_size = 1446 #This is tcp packet size on fpga. Do not change it

    #Send the function_packet = {fn_id,data_size} 
    message = bytes([fn_id])+int_to_4byte_array(data_size)
    client_socket.sendall(message)
    if debug: print("Fn identifier Sent")

    #Wait for okay reply (128)
    data_recvd = client_socket.recv(1)
    data_int = int.from_bytes(data_recvd, byteorder='little');
    if debug: print(f"Received: {(data_int)}")

    #Send the data in packets size.
    #payload_size = packet_size 
    data_to_send = bytearray(data)
    for i in range(0, data_size, packet_size):
        packet = data_to_send[i:i + packet_size]
        #packet = bytearray([192]) + chunk  # First byte is 192
        client_socket.sendall(packet)
    if debug: print("All Data Sent")

    #Wait for okay reply (128)
    data_recvd = client_socket.recv(1)
    data_int = int.from_bytes(data_recvd, byteorder='little');
    if debug: print(f"Received: {(data_int)}")

    #Wait for fpga to reply fn data
    data_recvd = client_socket.recv(1)
    data_int = int.from_bytes(data_recvd, byteorder='little');
    if debug: print(f"FN: {(data_int)}")
    
    #Recieve data size
    data_recvd = client_socket.recv(4)
    data_size = int.from_bytes(data_recvd, byteorder='little');
    if debug: print(f"Received Data Size: {(data_size)}")

    #Start receving Data
    data_byte = bytes(0)
    i = 0
    while i != data_size:
        data_recvd = client_socket.recv(1446*2)
        data_byte = data_byte + data_recvd;
        i+=len(data_recvd)
    data_int = list(data_byte)
    if debug: print("All Data Received")
    return data_int