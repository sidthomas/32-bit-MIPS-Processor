@echo off
set xv_path=H:\\Vivado_17.1\\Vivado\\2017.1\\bin
call %xv_path%/xsim sim_behav -key {Behavioral:sim_1:Functional:sim} -tclbatch sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
