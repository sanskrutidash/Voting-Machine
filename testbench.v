Test bench
`timescale 1ns/1ps
module test;
  
  reg clk;
  reg rst;
  reg mode;
  reg button1;
  reg button2; 
  reg button3;
  reg button4;
  wire [7:0] led;
  

  VotingMachine newvm (
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .led(led)
  );
  initial begin
    clk = 0; 
    forever #5 clk = ~clk;
  end

  initial begin
    rst = 1;
    mode = 0;
    button1 = 0;
    button2 = 0;
    button3 = 0;
    button4 = 0;
    
    #100 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #200 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst = 0; mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst = 0; mode = 0; button1 = 0; button2 = 1; button3 = 1; button4 = 0;
    #200 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
   #5 rst = 0; mode = 1; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 rst = 0; mode = 1; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0; 
    #5 rst = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    
    
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

  initial begin
    $monitor($time, "mode = %b, button1 = %b, button2 = %b, button3 = %b, button4 = %b, led = %d", mode, button1, button2, button3, button4, led);
  end
endmodule
