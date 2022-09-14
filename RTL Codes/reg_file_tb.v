`timescale 1ns/1ps
module reg_file_tb ();
parameter DATA_WIDTH = 32, REGISTER_DEPTH = 16, ADDRESS_WIDTH = 4 ;

  reg                      i_clk_tb          ;
  reg                      i_rst_n_tb        ;
  reg                      i_write_enable_tb ;
  reg                      i_read_enable_tb  ;
  reg  [DATA_WIDTH-1:0]    i_write_data_tb   ;
  reg  [ADDRESS_WIDTH-1:0] i_address_tb      ;
  wire [DATA_WIDTH-1:0]    o_read_data_tb    ;

initial begin
  i_rst_n_tb = 1                  ;
  i_clk_tb   = 0                  ;
  i_write_enable_tb = 1           ;
  i_read_enable_tb = 0            ;
  i_write_data_tb = 32'b0000_1111 ;
  i_address_tb = 4'b1100          ;
  #10
  i_rst_n_tb = 0                  ;
  #10
  i_rst_n_tb = 1                  ;
  #20
  i_write_enable_tb = 0           ;
  i_read_enable_tb = 1            ;
  i_address_tb = 4'b1100          ;
  #20
  i_write_enable_tb = 0           ;
  i_read_enable_tb = 1            ;
  i_address_tb = 4'b1111          ;
end

  always #5 i_clk_tb = ~i_clk_tb ;

  reg_file #(.DATA_WIDTH(DATA_WIDTH), .REGISTER_DEPTH(REGISTER_DEPTH), .ADDRESS_WIDTH(ADDRESS_WIDTH)) DUT (
  .i_clk(i_clk_tb)                   ,
  .i_rst_n(i_rst_n_tb)               ,
  .i_write_enable(i_write_enable_tb) ,
  .i_read_enable(i_read_enable_tb)   ,
  .i_write_data(i_write_data_tb)     ,
  .i_address(i_address_tb)           ,
  .o_read_data(o_read_data_tb))      ;

  endmodule