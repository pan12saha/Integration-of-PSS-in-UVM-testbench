class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)
  
  
  
  //Instantiation of signal information
  rand logic reset;
  rand logic [7:0] a;
  rand logic [7:0] b;
  rand logic [3:0] op_code;
  logic [7:0] result; // out
  bit carry_out; //out
  
  //Defining Basic Default contraints for the fields
  constraint input1_c {a inside {[10:20]};}
  constraint input2_c {b inside {[1:10]};}
  constraint input3_c {op_code inside {[0:3]};}
  
  function new(string name = "alu_test");
    super.new(name);
    `uvm_info("SEQUENCE_ITEM_CLASS","Inside Test constructor", UVM_HIGH)
  endfunction: new
  
  
endclass: alu_sequence_item 
