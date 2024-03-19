module modeControl(clk,rst,mode, valid_vote_casted, candidate1_vote,candidate2_vote ,candidate3_vote,candidate4_vote, candidate1_button_press, candidate2_button_press, candidate3_button_press, candidate4_button_press);
input clk,rst,mode, valid_vote_casted;
input [7:0] candidate1_vote,
input [7:0] candidate2_vote,
input [7:0] candidate3_vote,
input [7:0] candidate4_vote,
input candidate1_button_press,
input candidate2_button_press,
input candidate3_button_press,
input candidate4_button_press,
output reg [7:0] leds;
    
reg [30:0] counter;

always @(posedge clk)
begin
    if(rst)
        counter <= 0;   
    else if(valid_vote_casted) 
        counter <= counter + 1;
    else if(counter !=0 & counter < 10
        counter <= counter + 1;
    else 
        counter <= 0;
end    
    
always @(posedge clk)
begin
    if(rst)
        leds <= 0;
    else
    begin
        if(mode == 0 &  counter > 0 
            leds <= 8'hFF;
        else if(mode == 0)
            leds <= 8'h00;
        else if(mode == 1) 
        begin
            if(candidate1_button_press)
                leds <= candidate1_vote;
            else if(candidate2_button_press)
                leds <= candidate2_vote;
            else if(candidate3_button_press)
                leds <= candidate3_vote;
            else if(candidate4_button_press)
                leds <= candidate4_vote;
        end
    end  
end
    
endmodule

