@echo off
set xv_path=H:\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim final_behav -key {Behavioral:sim_1:Functional:final} -tclbatch final.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
