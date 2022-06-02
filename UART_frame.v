`timescale 10ns/1ns

module UART_frame();
reg Rx;
wire clk,finish;
wire [8:0]  Data	
initial 
begin
Rx =1'b1;
#10400 Rx = 1'b1;    //idle
#10400 Rx = 1'b1;   	//idle
#10400 Rx = 1'b0;  //23 35
	
#10400 Rx = 1'b1;
#10400 Rx = 1'b0;
#10400 Rx = 1'b1;
#10400 Rx = 1'b0;
#10400 Rx = 1'b0;
#10400 Rx = 1'b1;
#10400 Rx = 1'b1;  
#10400 Rx = 1'b0;  //0x35

#10400 Rx = 1'b1; //endbit


#10400 Rx = 1'b0;  //start bit
 
#10400 Rx = 1'b0;
#10400 Rx = 1'b1;
#10400 Rx = 1'b0;
#10400 Rx = 1'b0;
#10400 Rx = 1'b0;
#10400 Rx = 1'b0;
#10400 Rx = 1'b0;
#10400 Rx = 1'b0;	// 0x02

#10400 Rx = 1'b1; //endbit
end 
UART_RX   Reciver (clk,Rx,Data,finish);
endmodule 
