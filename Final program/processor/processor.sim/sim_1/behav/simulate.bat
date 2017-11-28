@echo off
set xv_path=H:\\Vivado_17.1\\Vivado\\2017.1\\bin
call %xv_path%/xsim final_behav -key {Behavioral:sim_1:Functional:final} -tclbatch final.tcl -view C:/Users/Sidharth Thomas/Desktop/Final CMP/Final program/processor/final_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
