//ALU Verification
//Author : Pankaj Saha
//Date: 17th August 2024

`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"
//
// Include the files here 
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
 
  
  logic clock;
  alu_interface intf(.clock(clock));
  
  
  alu dut(
    .clock(intf.clock),
    .reset(intf.reset),
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.op_code),
    .ALU_Out(intf.result),
    .CarryOut(intf.carry_out)
  );
  initial begin
    uvm_config_db #(virtual alu_interface)::set(null,"*","vif",intf);
  end
  
  initial begin
    run_test("alu_test");
  end
  
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
  initial begin
    #5000 
    $display("Sorry we ran out of allocated time: TIMEOUT");
    $finish();
  end
    
endmodule : top
