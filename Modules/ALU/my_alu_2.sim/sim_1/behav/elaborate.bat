@echo off
set xv_path=H:\\Vivado_17.1\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto e42388d9a2e647b49bfdde5ac5bf0405 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sim_behav xil_defaultlib.sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0