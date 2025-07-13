class pss_alu_test_sequence extends alu_test_sequence;
  bit[7:0] A,B;
  bit[7:0] alu_result;
  bit carry_out;
  `uvm_object_utils(pss_alu_test_sequence)
  function new(string name = "pss_alu_test_sequence");
    super.new(name);
  endfunction

  virtual task body();
    super.body();
  endtask
endclass
