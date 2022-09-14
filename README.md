# Register_File
This is the Verilog code and synthesis output of my parameterized register file that operates at 10 MHz.

Register File Specification:
 - This register file consists of 16 registers, each of 32-bit width. 
 - The register file has a read data bus (o_read_data), a write data bus (i_write_data) and one address bus (i_address) used for both read and write operations.
 - Each register can be read and written by applying an address to be accessed in the register file.
 - Only one operation (read or write) can be evaluated at a time. 
 - Write Operation is done only when i_write_enable is high.
 - Read operation is done only when i_read_enable is high. 
 - Read and Write operations are done on the positive edge of the clock.
 - All the registers are cleared using an Asynchronous active low Reset signal.
