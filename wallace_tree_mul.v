module wallace_tree_multiplier (
    input [3:0] A,  
    input [3:0] B,  
    output [7:0] product
);
    wire [15:0] pp;  
    wire [7:0] sum1, sum2, sum3, carry1, carry2, carry3;
    
    assign pp[0]  = A[0] & B[0];
    assign pp[1]  = A[1] & B[0];
    assign pp[2]  = A[2] & B[0];
    assign pp[3]  = A[3] & B[0];

    assign pp[4]  = A[0] & B[1];
    assign pp[5]  = A[1] & B[1];
    assign pp[6]  = A[2] & B[1];
    assign pp[7]  = A[3] & B[1];

    assign pp[8]  = A[0] & B[2];
    assign pp[9]  = A[1] & B[2];
    assign pp[10] = A[2] & B[2];
    assign pp[11] = A[3] & B[2];

    assign pp[12] = A[0] & B[3];
    assign pp[13] = A[1] & B[3];
    assign pp[14] = A[2] & B[3];
    assign pp[15] = A[3] & B[3];

    assign {carry1[0], sum1[0]} = pp[0] + pp[4];
    assign {carry1[1], sum1[1]} = pp[1] + pp[5] + pp[8];
    assign {carry1[2], sum1[2]} = pp[2] + pp[6] + pp[9] + pp[12];
    assign {carry1[3], sum1[3]} = pp[3] + pp[7] + pp[10] + pp[13];
    assign {carry1[4], sum1[4]} = pp[11] + pp[14];
    assign sum1[5] = pp[15];

    assign {carry2[0], sum2[0]} = sum1[0] + carry1[0];
    assign {carry2[1], sum2[1]} = sum1[1] + carry1[1];
    assign {carry2[2], sum2[2]} = sum1[2] + carry1[2];
    assign {carry2[3], sum2[3]} = sum1[3] + carry1[3];
    assign {carry2[4], sum2[4]} = sum1[4] + carry1[4];
    assign sum2[5] = sum1[5];

    assign product = sum2 + carry2;

endmodule
