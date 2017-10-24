@echo off
set xv_path=H:\\Vivado_17.1\\Vivado\\2017.1\\bin
call %xv_path%/xsim program_counter_sim_behav -key {Behavioral:sim_1:Functional:program_counter_sim} -tclbatch program_counter_sim.tcl -view H:/IITR Study/Sem 3/Computer Architecture and Microprocessors/Project/Code/mips_001/program_counter_sim_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
