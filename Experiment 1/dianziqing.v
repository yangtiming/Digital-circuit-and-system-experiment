module dianziqing(clk,key,switch,speakers,num_show,);
input clk;
input [6:0]key;
input switch;


output  speakers;
output reg [2:0]num_show; //数码管显示数字

reg [10:0]d; //分频系数 
reg [10:0]o; //初始值
reg speaker;

assign speakers=switch&&speaker;
parameter  do=1,
	   re=2,
	   mi=4,
	   fa=8,
	   so=16, 
	   la=32,
	   xi=64;

wire preclk;
assign preclk=(d==2047)?1:0;



always@(posedge clk)
begin 
if(preclk)
	d=o;
else
	d=d+1;
end

always@(posedge preclk)
begin
speaker= ~speaker;//2分频产生方波 
end

always@(key)
  case(key)
   	 do:begin
	       
			 o=2048-1908;//频率为262HZ，对应分频系数为1908，初始值为2048-1908
			 num_show=1;
			 
		 end
	 re:begin
	      
			 o=2048-1701;//频率为294HZ，对应分频系数为1701，初始值为2048-1701
			 num_show=2;
			 
		 end
	 mi:begin
	       
			 o=2048-1515;//频率为330HZ，对应分频系数为1515，初始值为2048-1515
			 num_show=3;
			 
		 end
    	 fa:begin
	      
			 o=2048-1433;//频率为349HZ，对应分频系数为1433，初始值为2048-1433
			 num_show=4;
			 
		 end
	 so:begin
	       
			 o=2048-1276;//频率为392HZ，对应分频系数为1276，初始值为2048-1276
			 num_show=5;
			 
		 end
	 la:begin
	       
			 o=2048-1136;//频率为440HZ，对应分频系数为1136，初始值为2048-1136
			 num_show=6;
			 
		 end
	 xi:begin
	       
			 o=2048-1012;//频率为494HZ，对应分频系数为1136，初始值为2048-1012
			 num_show=7;
			 
		 end
  	default:num_show=0;
  endcase

endmodule