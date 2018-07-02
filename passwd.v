/***************************************************************************
**                                                                        **
**  Lock: 数电作业,设计一个电子密码锁。                                        **
**  Copyright (C) 2018 张泽平 (Randy Hoffman)                              **
**                                                                        **
**  This program is free software: you can redistribute it and/or modify  **
**  it under the terms of the GNU General Public License as published by  **
**  the Free Software Foundation, either version 3 of the License, or     **
**  (at your option) any later version.                                   **
**                                                                        **
**  This program is distributed in the hope that it will be useful,       **
**  but WITHOUT ANY WARRANTY; without even the implied warranty of        **
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         **
**  GNU General Public License for more details.                          **
**                                                                        **
**  You should have received a copy of the GNU General Public License     **
**  along with this program.  If not, see http://www.gnu.org/licenses/.   **
**                                                                        **
****************************************************************************
**           Author: 张泽平 (Randy Hoffman)                                **
**  Website/Contact: https://github.com/zhangzp9970/Lock                  **
****************************************************************************/
module Passwd(
        input CLK,
        input del,
        input [9:0] K,
        output reg lock,
        output reg [15:0] Data
);
integer count=0;
reg [15:0] passwd=16'b1001_1001_0111_0000;//9970
reg [15:0] root=16'b0000_0001_0010_0011;//0123
initial
    begin
      Data<=0;
      lock<=1;
    end
always @ (posedge CLK)
    begin
      if (count==4)
        begin
          if (Data==passwd)
            begin
                lock<=0;
            end
          else
            if (Data==root)
                begin
                  lock<=0;
                end
            else
                begin
                  lock<=1;
                  Data<=0;
                end
        count<=0;
        Data<=0;
        end
    else
        begin
            if (del==1)
                begin
                  Data<=Data>>4;
                  count=count-1;
                end
          if (K!=0)
            begin
              case (K)
                10'b100_000_000_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=0;
                      count<=count+1;
                    end
                10'b010_000_000_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=1;
                      count=count+1;
                    end
                10'b001_000_000_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=2;
                      count=count+1;
                    end
                10'b000_100_000_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=3;
                      count=count+1;
                    end
                10'b000_010_000_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=4;
                      count=count+1;
                    end
                10'b000_001_000_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=5;
                      count=count+1;
                    end
                10'b000_000_100_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=6;
                      count=count+1;
                    end
                10'b000_000_010_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=7;
                      count=count+1;
                    end
                10'b000_000_001_0:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=8;
                      count=count+1;
                    end
                10'b000_000_000_1:
                    begin
                      Data<=Data<<4;
                      Data[3:0]<=9;
                      count=count+1;
                    end
              endcase
            end
        end
    end
endmodule

module Display(
	input [15:0] DataIn,
	input CLK,
	output reg [3:0] Data,
	output reg [3:0] Ctrl
);

integer i;
initial
	begin
		i=0;
		Data<=4'b1111;
		Ctrl<=4'b1111;
	end

always @ ( posedge CLK )
	begin
		case(i)
			0: 
				begin
					Data<=DataIn[15:12];
					Ctrl<=4'b0111;
				end
			1:
				begin
					Data<=DataIn[11:8];
					Ctrl<=4'b1011;
				end
			2:
				begin
					Data<=DataIn[7:4];
					Ctrl<=4'b1101;
				end
			3:
				begin
					Data<=DataIn[3:0];
					Ctrl<=4'b1110;
				end
			default:
				begin
					Data<=4'b1111;
					Ctrl<=4'b1111;
				end
		endcase
		i=i+1;
		if ( i==4)
			i=0;
	end

endmodule

module Top(
  input SYS_CLK,
  input SYS_DEL,
  input SYS_K,
  output SYS_LOCK,
  output wire [3:0] SYS_DATA,
  output wire [3:0] SYS_CTRL
);
wire [15:0] USER_DATA;
Passwd PASS(.CLK(SYS_CLK),.del(SYS_DEL),.K(SYS_K),.lock(SYS_LOCK),.Data(USER_DATA));
Display DS(.DataIn(USER_DATA),.CLK(SYS_CLK),.Data(SYS_DATA),.Ctrl(SYS_CTRL));
endmodule // Top
