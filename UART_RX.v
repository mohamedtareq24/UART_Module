/*
UART reciever of BAUD rate 9600 works on the stock 50 MHz clock of the FPGA 

*/
module UART_RX (clk,Rx,DATA_OUT,finish);
input clk,Rx ;
wire [8:0]Q;
output reg[8:0]  DATA_OUT;
reg  [16:0] count; 
reg   CLR;
reg D;
reg buff,reset;
output reg finish;

always @ (posedge clk )
begin
if ((count < 17'd2600) || (count > 17'd51100))
	CLR <= Rx ;
else
	CLR <= 1'b0;               //CLR generation	
	if (~CLR)
		count <= count + 17'b1 ;	
	else
	count <= 0;
	
	case (count) 
	17'd7800 :buff <=1'b1;//1st
	17'd13000:buff <=1'b1;//2nd
	17'd18200:buff <=1'b1;//3rd
	17'd23400:buff <=1'b1;//4th
	17'd28600:buff <=1'b1;//5th
	17'd33800:buff <=1'b1;//6th
	17'd39000:buff <=1'b1;//7th
	17'd44200:buff <=1'b1;//8th
	17'd49000:buff <=1'b1;//endbit	
	default  :buff <=1'b0;
	endcase
end


Shift_Register U1(D,clk,buff,1'b1,Q[8:0]);
always@(*) //combinational 
begin
	if (buff)
	begin
	D = Rx;
	end
	else
	begin
	D = 1'bz;
	end
	if((count < 51100) && (count > 49050))
	finish =1'b1;
	else 
	finish =1'b0;
	if(finish)
	DATA_OUT = Q[8:0];
	else
	DATA_OUT = 9'bzzzzzzzzz;
end
endmodule
