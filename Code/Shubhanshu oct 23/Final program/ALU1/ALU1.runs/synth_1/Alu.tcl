# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/B. Tech II year/CSN_221/Project/32-bit-MIPS-Processor-master/Modules/ALU/ALU1/ALU1.cache/wt} [current_project]
set_property parent.project_path {E:/B. Tech II year/CSN_221/Project/32-bit-MIPS-Processor-master/Modules/ALU/ALU1/ALU1.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {{E:/B. Tech II year/CSN_221/Project/32-bit-MIPS-Processor-master/Modules/ALU/ALU1/ALU1.srcs/sources_1/new/Alu.v}}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top Alu -part xc7k70tfbv676-1


write_checkpoint -force -noxdef Alu.dcp

catch { report_utilization -file Alu_utilization_synth.rpt -pb Alu_utilization_synth.pb }
