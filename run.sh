#!/bin/bash
set -e 

perspec generate -sln `perspec -home`/packages/integs/sv/perspec_sv_export_util.sln -sln $DV_VOBROOT/slg/packages/utils/runtime_checker/perspec_runtime_checker_top.sln -perspec_testing_mode -sln $DV_VOBROOT/slg/packages/utils/perpsec_check_imc_util.sln -f init.psf top_action test -target_dir test -expand_messages

xrun -64 -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' -ccargs "Wall -Wextra -pendantic -Wno_unused-variable -Wno-unused-but-set-variable -Wno-discarded-qualifiers"\
-uvm \
-top top \
incdir . \
-incdir test \
test/perspec_pkg.sv \
deisgn.sv \
testbench.sv \
+UVM_VERBOSITY=UVM_DEBUG \
-I./test \
test/perspec_test.c
-loadvpi `perspec -arch` /libperspec_utils.so:perspec_boot \
+PESPEC_TEST_DIR=test -errormax 3

perspec process -target_dir test -process_log_file xrun.log
