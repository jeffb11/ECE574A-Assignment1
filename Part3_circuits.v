`timescale 1ns / 1ps

module circuit1(a, b, c, z, x, clk, rst);
    input[7:0] a, b, c;
    input clk, rst;
    
    output[7:0] z;
    output[15:0] x;
    
    wire[7:0] d, e;
    wire[15:0] f, g, xwire;
    wire lt, eq;
    
    ADD#(8) Adder_1(a, b, d);           // d = a + b
    ADD#(8) Adder_2(a, c, e);           // e = a + c
    COMP#(8) Comp_1(d, e, g, lt, eq);   // g = d > e
    MUX2x1#(8) Mux_1(d, e, g[0], z);       // z = g ? d : e
    MUL#(16) Mul_1(a, c, f);            // f = a * c
    SUB#(16) Sub_1(f, d, xwire);        // xwire = f - d
    REG#(16)Reg_1(xwire, x, clk, rst);  // x = xwire
endmodule

module circuit2(a, b, c, z, x, clk, rst);
    input[31:0] a, b, c;
    input clk, rst;
    
    output[31:0] z, x;
        
    wire[31:0] d, e, f, g, h;
    wire[31:0] zwire, xwire;
    wire dLTe, dEQe;
    wire lt, eq;
    
    ADD#(32) Adder_1(a, b, d);              // d = a + b
    ADD#(32) Adder_2(a, c, e);              // e = a + c
    SUB#(32) Sub_1(a, b, f);                // f = a - b  
    COMP#(32) Comp_1(d, e, dEQe, lt, eq);   // dEQe = d == e
    COMP#(32) Comp_2(d, e, dLTe, lt, eq);   // dLTe = d < e
    MUX2x1#(32) Mux_1(d, e, dLTe, g);       // g = dLTe ? d : e 
    MUX2x1#(32) Mux_2(g, f, dEQe, h);       // h = dEQe ? g : f 
    SHL#(32) Shl_1(g, dLTe, xwire);         // xwire = g << dLTe
    SHR#(32) Shr_1(h, dEQe, zwire);         // zwire = h >> dEQe
    REG#(32) Reg_1(xwire, x, clk, rst);     // x = xwire
    REG#(32) Reg_2(zwire, z, clk, rst);     // z = zwire
endmodule

module circuit3(a, b, c, d, e, f, g, h, sa, avg, clk, rst);
    input[15:0] a, b, c, d, e, f, g, h;
    input[7:0] sa;
    input clk, rst;
    
    output[15:0] avg;
    
    wire[31:0] l00, l01, l02, l03, l10, l11, l2, l2div2, l2div4, l2div8;
    
    ADD#(32) Add_1(a, b, 100);              // l00 = a + b
    ADD#(32) Add_2(c, d, 101);              // l01 = c + d
    ADD#(32) Add_3(e, f, 102);              // l02 = e + f
    ADD#(32) Add_4(g, h, 103);              // l03 = g + h
    ADD#(32) Add_5(100, 101, 110);          // l10 = l00 + l01
    ADD#(32) Add_6(102, 103, 111);          // l11 = l02 + l03
    ADD#(32) Add_7(110, 111, 12);           // l2 = l10 + l11
    SHR#(32) Shr_1(12, sa, l2div2);         // l2div2 = l2 >> sa
    SHR#(32) Shr_2(l2div2, sa, l2div4);     // l2div4 = l2div2 >> sa 
    SHR#(32) Shr_3(l2div4, sa, l2div8);     // l2div8 = l2div4 >> sa
    REG#(32) Reg_1(l2div8, avg, clk, rst);  // avg = l2div8
endmodule

module circuit4(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, final, clk, rst);
    input[7:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
    input clk, rst;
    
    output[31:0] final;
    
    wire[31:0] t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14;
    
    ADD#(32) Add_1(a, b, t1);       // t1 = a + b
    ADD#(32) Add_2(c, t1, t2);      // t2 = t1 + c
    ADD#(32) Add_3(d, t2, t3);      // t3 = t2 + d
    ADD#(32) Add_4(e, t3, t4);      // t4 = t3 + e
    ADD#(32) Add_5(f, t4, t5);      // t5 = t4 + f
    ADD#(32) Add_6(g, t5, t6);      // t6 = t5 + g
    ADD#(32) Add_7(h, t6, t7);      // t7 = t6 + h
    ADD#(32) Add_8(i, t7, t8);      // t8 = t7 + i
    ADD#(32) Add_9(j, t8, t9);      // t9 = t8 + j
    ADD#(32) Add_10(l, t9, t10);    // t10 = t9 + l
    ADD#(32) Add_11(m, t10, t11);   // t11 = t10 + m
    ADD#(32) Add_12(n, t11, t12);   // t12 = t11 + n
    ADD#(32) Add_13(o, t12, t13);   // t13 = t12 + o
    ADD#(32) Add_14(p, t13, t14);   // t14 = t13 + p
    REG#(32) Reg_1(t14, final, clk, rst);    // final = t14
endmodule;

module circuit5(a, b, c, z, x, clk, rst);
    input[63:0] a, b, c;
    input clk, rst;
    
    output[31:0] z, x;
    
    wire[63:0] d, e, f, g, h;
    wire dLTe, dEQe;
    wire[63:0] xrin, zrin;
    wire lt, eq;
    
    reg[63:0] greg, hreg;
    
    ADD#(64) Add_1(b, a, d);                // d = a + b
    ADD#(64) Add_2(c, a, e);                // e = a + c
    SUB#(64) Sub_1(a, b, f);                // f = a - b  
    COMP#(64) Comp_1(d, e, dEQe, lt, eq);   // dEQe = d == e
    COMP#(64) Comp_2(d, e, dLTe, lt, eq);   // dLTe = d < e
    MUX2x1#(64) Mux_1(d, e, dLTe, g);       // g = dLTe ? d : e 
    MUX2x1#(64) Mux_2(g, f, dEQe, h);       // h = dEQe ? g : f 
    REG#(64) Reg_1(g, greg, clk, rst);      // greg = g
    REG#(64) Reg_2(h, hreg, clk, rst);      // hreg = h
    SHL#(64) Shl_1(hreg, dLTe, xrin);       // xrin = hreg << dLTe
    SHR#(64) Shr_1(greg, dEQe, zrin);       // zrin = greg >> dEQe
    REG#(64) Reg_3(xrin, x, clk, rst);      // x = xrin
    REG#(64) Reg_4(zrin, z, clk, rst);      // z = zrin
endmodule;

module circuit6(a, b, c, d, e, f, g, h, num, avg, clk, rst);
    input[15:0] a, b, c, d, e, f, g, h, num;
    input clk, rst;
    
    output[15:0] avg;
    
    reg[15:0] r1, r2, r3, r4, r5, r6, r7;
    
    wire[15:0] avgwire;
    wire[31:0] t1, t2, t3, t4, t5, t6, t7;
    
    ADD#(32) Add_1(a, b, t1);           // t1 = a + b
    REG#(32) Reg_1(t1, r1, clk, rst);   // r1 = t1
    ADD#(32) Add_2(r1, c, t2);          // t2 = r1 + c 
    REG#(32) Reg_2(t2, r2, clk, rst);   // r2 = t2
    ADD#(32) Add_3(r2, d, t3);          // t3 = r2 + d 
    REG#(32) Reg_3(t3, r3, clk, rst);   // r3 = t3
    ADD#(32) Add_4(r3, e, t4);          // t4 = r3 + e 
    REG#(32) Reg_4(t4, r4, clk, rst);   // r4 = t4
    ADD#(32) Add_5(r4, f, t5);          // t5 = r4 + f 
    REG#(32) Reg_5(t5, r5, clk, rst);   // r5 = t5
    ADD#(32) Add_6(r5, g, t6);          // t6 = r5 + g 
    REG#(32) Reg_6(t6, r6, clk, rst);   // r6 = t6
    ADD#(32) Add_7(r6, h, t7);          // t7 = r6 + h 
    REG#(32) Reg_7(t7, r7, clk, rst);   // r7 = t7
    DIV#(32) Div_1(r7, num, avgwire);   // avgwire = r7 / num
    REG#(16) Reg_8(avgwire, avg, clk, rst); // avg = avgwire
endmodule;

module circuit7(a, b, c, d, zero, z, clk, rst);
    input[63:0] a, b, c, d, zero;
    input clk, rst;
    output[63:0] z;
    
    wire[63:0] e, f, g, zwire;
    wire gEQz, lt, eq;  
    
    DIV#(64) Div_1(a, b, e);    // e = a / b
    DIV#(64) Div_2(c, d, f);    // f = c / d
    MOD#(64) Mod_1(a, b, g);    // g = a % b  
    COMP#(64) Comp_1(g, zero, gEQz, lt, eq);    // gEQz = g == zero
    MUX2x1#(64) Mux_1(e, f, gEQz, zwire);       // zwire = gEQz ? e : f 
    REG#(64) Reg_1(zwire, z, clk, rst);         // z = zwire
endmodule;

module circuit8(a, b, c, zero, z, clk, rst);
    input[63:0] a, b, c, zero;
    input clk, rst;
    output[63:0] z;
    
    wire[63:0] e, f, g, zwire;
    wire gEQz, lt, eq;
    
    SUB#(64) Sub_1(a, 1, e);    // e = a - 1
    ADD#(64) Add_1(c, 1, f);    // f = c + 1
    DIV#(64) Div_1(a, c, g);    // g = a % c  
    COMP#(64) Comp_1(g, zero, gEQz, lt, eq);    // gEQz = g == zero
    MUX2x1#(64) Mux_1(e, f, gEQz, zwire);       // zwire = gEQz ? e : f 
    REG#(64) Reg_1(zwire, z, clk, rst);         // z = zwire
endmodule;
