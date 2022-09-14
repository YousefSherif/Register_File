module reg_file #(parameter DATA_WIDTH = 32, REGISTER_DEPTH = 16, ADDRESS_WIDTH = 4) (
  input  wire                     i_clk          ,
  input  wire                     i_rst_n        ,
  input  wire                     i_write_enable ,
  input  wire                     i_read_enable  ,
  input  wire [DATA_WIDTH-1:0]    i_write_data   ,
  input  wire [ADDRESS_WIDTH-1:0] i_address      ,
  output reg  [DATA_WIDTH-1:0]    o_read_data   );

reg [DATA_WIDTH-1:0] register_file [REGISTER_DEPTH-1:0] ;

integer i ;

always@(posedge i_clk or negedge i_rst_n) begin
  if(!i_rst_n) begin
    for(i = 0; i < REGISTER_DEPTH; i = i + 1) begin
      register_file[i] <= 0 ;
    end
  end
  else if (i_write_enable && !i_read_enable) begin
    register_file[i_address] <= i_write_data ;
  end
  else if (!i_write_enable && i_read_enable) begin
    o_read_data <= register_file[i_address] ;
  end
end

endmodule
