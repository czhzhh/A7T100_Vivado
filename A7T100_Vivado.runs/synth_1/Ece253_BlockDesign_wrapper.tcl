# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/parallels/A7T100_Vivado/A7T100_Vivado.runs/synth_1/Ece253_BlockDesign_wrapper.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/parallels/A7T100_Vivado/A7T100_Vivado.cache/wt [current_project]
set_property parent.project_path /home/parallels/A7T100_Vivado/A7T100_Vivado.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths /home/parallels/A7T100_Vivado/lab_files_2024/vivado/seven/ip_repo [current_project]
update_ip_catalog
set_property ip_output_repo /home/parallels/A7T100_Vivado/A7T100_Vivado.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/hdl/Ece253_BlockDesign_wrapper.v
add_files /home/parallels/A7T100_Vivado/A7T100_Vivado.srcs/sources_1/bd/Ece253_BlockDesign/Ece253_BlockDesign.bd
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_mig_7series_0_0/Ece253_BlockDesign_mig_7series_0_0/user_design/constraints/Ece253_BlockDesign_mig_7series_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_mig_7series_0_0/Ece253_BlockDesign_mig_7series_0_0/user_design/constraints/Ece253_BlockDesign_mig_7series_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_0/Ece253_BlockDesign_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_0/Ece253_BlockDesign_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_0/Ece253_BlockDesign_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_dlmb_v10_0/Ece253_BlockDesign_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_ilmb_v10_0/Ece253_BlockDesign_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_dlmb_bram_if_cntlr_0/Ece253_BlockDesign_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_ilmb_bram_if_cntlr_0/Ece253_BlockDesign_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_lmb_bram_0/Ece253_BlockDesign_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_xbar_0/Ece253_BlockDesign_xbar_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_axi_intc_0/Ece253_BlockDesign_microblaze_0_axi_intc_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_axi_intc_0/Ece253_BlockDesign_microblaze_0_axi_intc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_axi_intc_0/Ece253_BlockDesign_microblaze_0_axi_intc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_mdm_1_0/Ece253_BlockDesign_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_mdm_1_0/Ece253_BlockDesign_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_mdm_1_0/Ece253_BlockDesign_mdm_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_rst_mig_7series_0_100M_0/Ece253_BlockDesign_rst_mig_7series_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_rst_mig_7series_0_100M_0/Ece253_BlockDesign_rst_mig_7series_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_rst_mig_7series_0_100M_0/Ece253_BlockDesign_rst_mig_7series_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_1/bd_04a4_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_1/bd_04a4_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_2/bd_04a4_arsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_3/bd_04a4_rsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_4/bd_04a4_awsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_5/bd_04a4_wsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_6/bd_04a4_bsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_10/bd_04a4_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_11/bd_04a4_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_12/bd_04a4_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_16/bd_04a4_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_17/bd_04a4_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_18/bd_04a4_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_19/bd_04a4_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_20/bd_04a4_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_21/bd_04a4_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_22/bd_04a4_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_23/bd_04a4_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_24/bd_04a4_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_25/bd_04a4_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_26/bd_04a4_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/bd_0/ip/ip_27/bd_04a4_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_smartconnect_0_1/ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_timer_0_0/Ece253_BlockDesign_axi_timer_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_timer_0_0/Ece253_BlockDesign_axi_timer_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_timer_1_0/Ece253_BlockDesign_axi_timer_1_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_timer_1_0/Ece253_BlockDesign_axi_timer_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_0/Ece253_BlockDesign_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_0/Ece253_BlockDesign_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_0/Ece253_BlockDesign_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_1/Ece253_BlockDesign_axi_gpio_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_1/Ece253_BlockDesign_axi_gpio_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_1/Ece253_BlockDesign_axi_gpio_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_2/Ece253_BlockDesign_axi_gpio_0_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_2/Ece253_BlockDesign_axi_gpio_0_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_2/Ece253_BlockDesign_axi_gpio_0_2.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_3/Ece253_BlockDesign_axi_gpio_0_3_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_3/Ece253_BlockDesign_axi_gpio_0_3_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_3/Ece253_BlockDesign_axi_gpio_0_3.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_4/Ece253_BlockDesign_axi_gpio_0_4_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_4/Ece253_BlockDesign_axi_gpio_0_4_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_4/Ece253_BlockDesign_axi_gpio_0_4.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_clk_wiz_0_1/Ece253_BlockDesign_clk_wiz_0_1_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_clk_wiz_0_1/Ece253_BlockDesign_clk_wiz_0_1.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_clk_wiz_0_1/Ece253_BlockDesign_clk_wiz_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_quad_spi_0_0/Ece253_BlockDesign_axi_quad_spi_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_quad_spi_0_0/Ece253_BlockDesign_axi_quad_spi_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_quad_spi_0_0/Ece253_BlockDesign_axi_quad_spi_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_quad_spi_0_0/Ece253_BlockDesign_axi_quad_spi_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_5/Ece253_BlockDesign_axi_gpio_0_5_board.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_5/Ece253_BlockDesign_axi_gpio_0_5_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_axi_gpio_0_5/Ece253_BlockDesign_axi_gpio_0_5.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/Ece253_BlockDesign_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/A7T100_Vivado/A7T100_Vivado.gen/sources_1/bd/Ece253_BlockDesign/ip/Ece253_BlockDesign_microblaze_0_0/data/mb_bootloop_le.elf]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/parallels/A7T100_Vivado/A7T100_Vivado.srcs/constrs_1/imports/lab_files_2024/Nexys4_Handout_2022.xdc
set_property used_in_implementation false [get_files /home/parallels/A7T100_Vivado/A7T100_Vivado.srcs/constrs_1/imports/lab_files_2024/Nexys4_Handout_2022.xdc]

read_xdc /home/parallels/A7T100_Vivado/A7T100_Vivado.srcs/constrs_1/imports/Lab3A_hw_src/mic_constraints.xdc
set_property used_in_implementation false [get_files /home/parallels/A7T100_Vivado/A7T100_Vivado.srcs/constrs_1/imports/Lab3A_hw_src/mic_constraints.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental /home/parallels/A7T100_Vivado/A7T100_Vivado.srcs/utils_1/imports/synth_1/Ece253_BlockDesign_wrapper.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top Ece253_BlockDesign_wrapper -part xc7a100tcsg324-1
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Ece253_BlockDesign_wrapper.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Ece253_BlockDesign_wrapper_utilization_synth.rpt -pb Ece253_BlockDesign_wrapper_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
