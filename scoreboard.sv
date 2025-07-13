
class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard)
   uvm_analysis_imp #(alu_sequence_item,alu_scoreboard) scoreboard_port;
   alu_sequence_item transactions[$]; // creating queue for data store
  
  function new(string name = "alu_scoreboard",uvm_component parent);
    super.new(name,parent);
    `uvm_info("SRCB_CLASS","Inside Test constructor", UVM_LOW)
  endfunction: new
  
  //BUILD PHASE
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SRCB_CLASS","Inside Build Phase",UVM_LOW)
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  // Implementation of write method
  function void write(alu_sequence_item item);
    transactions.push_back(item);
  endfunction 
  
  //Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SRCB_CLASS","Inside connect Phase",UVM_LOW)
  endfunction: connect_phase
  
  
  //Run Phase
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SRCB_CLASS","Inside Run Phase",UVM_HIGH)
    //get the packet
    //generate the expected value
    //compare it with actual value
    //score the trasaction 
    forever begin
    	alu_sequence_item curr_trans;
    	wait(transactions.size() != 0);
    	curr_trans = transactions.pop_front();
    	compare(curr_trans);
    end
    
  endtask
  //--------------------------------------------------------
  //Compare : Generate Expected Result and Compare with Actual
  //--------------------------------------------------------
  task compare(alu_sequence_item curr_trans);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.op_code)
      0: begin //A + B
        expected = curr_trans.a + curr_trans.b;
      end
      1: begin //A - B
        expected = curr_trans.a - curr_trans.b;
      end
      2: begin //A * B
        expected = curr_trans.a * curr_trans.b;
      end
      3: begin //A / B
        expected = curr_trans.a / curr_trans.b;
      end
    endcase
    
    actual = curr_trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", actual, expected))
    end
    else begin
      // Note: Can display the input and op_code as well if you want to see what's happening
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
endclass: alu_scoreboard


   
