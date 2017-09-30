@echo off
set xv_path=H:\\Vivado_17.1\\Vivado\\2017.1\\bin
call %xv_path%/xelab  -wto 7c64305f59fb4c098205a46370066310 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sim_behav xil_defaultlib.sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
