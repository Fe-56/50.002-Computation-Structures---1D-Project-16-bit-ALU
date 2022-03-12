set projDir "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/vivado"
set projName "Temp"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/au_top_0.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/counter_1.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/auto_tester_2.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/manual_tester_3.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/button_conditioner_4.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/edge_detector_5.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/multi_seven_seg_6.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/reset_conditioner_7.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/rom1_8.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/rom2_9.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/alu_10.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/pipeline_11.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/counter_12.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/seven_seg_13.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/decoder_14.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/adder_15.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/compare_16.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/boolean_17.v" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/verilog/shifter_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/constraint/alchitry.xdc" "C:/Users/limfu/OneDrive/Desktop/FPGA/Temp/Temp/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
