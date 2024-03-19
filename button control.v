module ButtonControl(clk,rst,button,valid_vote);
input clk,rst,button;
output valid_vote;
reg valid_vote;
reg [30:0] counter;
always @(posedge clk)
begin
    if(rst)
        counter <= 0;
    else
    begin
      if(button & counter < 11)
            counter <= counter + 1;
        else if(!button)
            counter <= 0;
    end
end

always @(posedge clk)
begin
    if(rst)
        valid_vote <= 1'b0;
    else
    begin
        if(counter == 10)
            valid_vote <= 1'b1;
        else
            valid_vote <= 1'b0;
    end
end
endmodule
