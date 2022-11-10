# regfile
## Name and NetID
Hunte Shen(Zhihang Shen) zs149
## Design implementation regfile
Our goal for this project checkpoint is to create a 32-bit regfile which can fetch and hold data for CPU in a high speed. The regfile has one write port and two read ports.
1. we need to create a 32-bits dffe use 32 1-bit dffe, and this can be simply done by using loop.
2. we need to create a 5-to-32 decoder. This can be done by using 4 3-to-8 decoders and 1 2-4 decoders. we make the rightmost 3 digit of the 5-bits input as the input of each 3-to-8 decoders, and we make the remaining two bits of the input as the input of the 2-to-4 decoder. Lastly, we choose each digit of the output of the 2-to-4 decoder to be enable of 4 3-to-8 decoders.
3. For the write port, we put 5-bits control_write_reg into 5-to-32 decoder, and we use a and gate to connect each bit with ctrl_writeEnable.
4. For the read port, the input is 32 32 bits q, we feed 5 bits into ctrl_readReg, and use a tribuffer to select q. The select of the tribuffer is the 32-bits output from the decoder. 
5. Lastly, we put all the component together, we feed data, reset, clock into the dffes, and connect read port, write ports with dffe.
## Bugs and issues
All componets seem working well so far, testbench is passed without error.

