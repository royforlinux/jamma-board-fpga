`timescale 1ns / 1ps
module stimulus(aMem,dMem,clk,nReset,hsync,vsync,ega,iVideo,oVideo,csync,relay,nCs,nOe,nWe);

input [15:0] aMem;
input [7:0] dMem;
output  clk;
output  nReset;
reg  nReset;
output  hsync;
output  vsync;
output  ega;
reg  ega;
output  iVideo;
reg  iVideo;
input  oVideo;
input  csync;
input  relay;
input  nCs;
input  nOe;
input  nWe;


wire [1:0] tb_status;
reg [1:0] tb_status_driver;
assign tb_status = tb_status_driver;

parameter tb_stop_time = 2.2e+007;


real vsync_JFall;
real vsync_JRise;
real vsync_MaxHL;
real vsync_MaxLH;
real vsync_MinHL;
real vsync_MinLH;
real vsync_Duty;
real vsync_Period;
real vsync_Offset;
real hsync_JFall;
real hsync_JRise;
real hsync_MaxHL;
real hsync_MaxLH;
real hsync_MinHL;
real hsync_MinLH;
real hsync_Duty;
real hsync_Period;
real hsync_Offset;
real clk_JFall;
real clk_JRise;
real clk_MaxHL;
real clk_MaxLH;
real clk_MinHL;
real clk_MinLH;
real clk_Duty;
real clk_Period;
real clk_Offset;

task AssignExpressions;
  begin
  vsync_JFall = 0.0;
  vsync_JRise = 0.0;
  vsync_MaxHL = 0.0;
  vsync_MaxLH = 0.0;
  vsync_MinHL = 0.0;
  vsync_MinLH = 0.0;
  vsync_Duty = 99.4;
  vsync_Period = 16666666.667;
  vsync_Offset = 0.0;
  hsync_JFall = 0.0;
  hsync_JRise = 0.0;
  hsync_MaxHL = 0.0;
  hsync_MaxLH = 0.0;
  hsync_MinHL = 0.0;
  hsync_MinLH = 0.0;
  hsync_Duty = 99.0;
  hsync_Period = 32000.0;
  hsync_Offset = 100.0;
  clk_JFall = 0.0;
  clk_JRise = 0.0;
  clk_MaxHL = 0.0;
  clk_MaxLH = 0.0;
  clk_MinHL = 0.0;
  clk_MinLH = 0.0;
  clk_Duty = 50.0;
  clk_Period = 40.0;
  clk_Offset = 0.0;
  end
endtask  // AssignExpressions

initial
  begin
  AssignExpressions;
  tb_status_driver <= 1'b1;
  #(tb_stop_time)
  tb_status_driver <= 1'b0;
  end

tb_clock_minmax #(1) tb_clk(tb_status[1:0],
                            clk,
                            $realtobits(clk_Offset),
                            $realtobits(clk_Period),
                            $realtobits(clk_Duty),
                            $realtobits(clk_MinLH),
                            $realtobits(clk_MaxLH),
                            $realtobits(clk_MinHL),
                            $realtobits(clk_MaxHL),
                            $realtobits(clk_JRise),
                            $realtobits(clk_JFall));

initial
  begin                  //SIGNAL nReset
        nReset = 1'b0;
      #19.561
        nReset = 1'b1;
      #0.001
        nReset = 1'b1;
      #21999980.438
        ;
  end

tb_clock_minmax #(1) tb_hsync(tb_status[1:0],
                              hsync,
                              $realtobits(hsync_Offset),
                              $realtobits(hsync_Period),
                              $realtobits(hsync_Duty),
                              $realtobits(hsync_MinLH),
                              $realtobits(hsync_MaxLH),
                              $realtobits(hsync_MinHL),
                              $realtobits(hsync_MaxHL),
                              $realtobits(hsync_JRise),
                              $realtobits(hsync_JFall));

tb_clock_minmax #(1) tb_vsync(tb_status[1:0],
                              vsync,
                              $realtobits(vsync_Offset),
                              $realtobits(vsync_Period),
                              $realtobits(vsync_Duty),
                              $realtobits(vsync_MinLH),
                              $realtobits(vsync_MaxLH),
                              $realtobits(vsync_MinHL),
                              $realtobits(vsync_MaxHL),
                              $realtobits(vsync_JRise),
                              $realtobits(vsync_JFall));

initial
  begin                  //SIGNAL ega
        ega = 1'b0;
      #22000000
        ;
  end

initial
  begin                  //SIGNAL iVideo
        iVideo = 1'b0;
      #22000000
        ;
  end

  initial
    #22000000000 $finish;

endmodule

module tb_clock_minmax(tb_status, CLK, offset_bits, period_bits, duty_bits, minLH_bits, maxLH_bits, minHL_bits, maxHL_bits, jRise_bits, jFall_bits);
  parameter initialize = 0;

  input [1:0] tb_status;
  output CLK;
  input [63:0] offset_bits;
  input [63:0] period_bits;
  input [63:0] duty_bits;
  input [63:0] minLH_bits;
  input [63:0] maxLH_bits;
  input [63:0] minHL_bits;
  input [63:0] maxHL_bits;
  input [63:0] jRise_bits;
  input [63:0] jFall_bits;

  reg  CLK;
  real offset;
  real period;
  real duty;
  real minLH;
  real maxLH;
  real minHL;
  real maxHL;
  real jRise;
  real jFall;
  real CLK_high;
  real CLK_low;
 
  task DriveLHInvalidRegion;
    begin
    if ( (jRise + maxLH - minLH) > 0.0 )
      begin
      CLK <= 1'bx;
      #((jRise + maxLH - minLH));
      end
    end
  endtask

  task DriveHLInvalidRegion;
    begin
    if ( (jFall + maxHL - minHL) > 0.0 )
      begin
      CLK <= 1'bx;
      #((jFall + maxHL - minHL));
      end
    end
  endtask

  always
    begin
    @(posedge tb_status[0])
    offset = $bitstoreal( offset_bits );
    period = $bitstoreal( period_bits );
    duty  = $bitstoreal( duty_bits );
    minLH = $bitstoreal( minLH_bits );
    maxLH = $bitstoreal( maxLH_bits );
    minHL = $bitstoreal( minHL_bits );
    maxHL = $bitstoreal( maxHL_bits );
    jRise = $bitstoreal( jRise_bits );
    jFall = $bitstoreal( jFall_bits );
    if (period <= 0.0)
      $display("Error: Period for clock %m is invalid (period=%f).  Clock will not be driven", period);
    else if (duty <= 0.0)
      $display("Error: Duty for clock %m is invalid (duty=%f).  Clock will not be driven", duty);
    else
      begin
      CLK_low = period * duty / 100;
      CLK_high = period - CLK_low;
      
      if ( (offset + (minLH - jRise/2)) >= 0.0 )
        begin
        if (initialize)
          CLK <= 1'b0; // drive initial state
        #(offset + (minLH - jRise/2))
        ;
        end
      else
        begin // wait for x
        if (initialize)
          CLK <= 1'bx; // in middle of X region, init to X
        #((jRise/2 + maxLH) + (offset))
        CLK <= 1'b1;
        #((CLK_high - (maxLH + jRise/2) + (minHL - jFall/2)))
        DriveHLInvalidRegion;
        CLK <= 1'b0;
        #((CLK_low - (maxHL + jFall/2) + (minLH - jRise/2)))
        ;
        end
      while ( tb_status[0] == 1'b1 )
        begin : clock_loop
        DriveLHInvalidRegion;
        CLK <= 1'b1;
        #((CLK_high - (maxLH + jRise/2) + (minHL - jFall/2)))
        DriveHLInvalidRegion;
        CLK <= 1'b0;
        #((CLK_low - (maxHL + jFall/2) + (minLH - jRise/2)))
        ;
        end
      end
    end
endmodule


//Test bench module
module testbench;

wire [15:0] aMem;
wire [7:0] dMem;
wire  clk;
wire  nReset;
wire  hsync;
wire  vsync;
wire  ega;
wire  iVideo;
wire  oVideo;
wire  csync;
wire  relay;
wire  nCs;
wire  nOe;
wire  nWe;

//Instantiation of the stimulus module.
stimulus stimulus_0(aMem,dMem,clk,nReset,hsync,vsync,ega,iVideo,oVideo,csync,relay,nCs,nOe,nWe);

//Instantiation of the product module.
scanconv scanconv_0(
	.aMem(aMem),
	.dMem(dMem),
	.clk(clk),
	.nReset(nReset),
	.hsync(hsync),
	.vsync(vsync),
	.ega(ega),
	.iVideo(iVideo),
	.oVideo(oVideo),
	.csync(csync),
	.relay(relay),
	.nCs(nCs),
	.nOe(nOe),
	.nWe(nWe)
	);

endmodule