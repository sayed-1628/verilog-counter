 module counter
#(
    parameter WIDTH = 8
)
(
    input clk,
    input rst_n,
    input en,
    output reg [WIDTH-1:0] count
);
always @(posedge clk)
begin
 if(!rst_n) begin 
   count <= 1'b0 ;
	end 
  else if (en) begin 
    count <= count + 1'b1 ;
    end 
 
end
endmodule 
