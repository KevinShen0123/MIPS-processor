transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/shiftright.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/shiftleft.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/orop.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/andop.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/clock_div4.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/processor.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/dmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/imem.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/dffe.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/five_to_thirtytwo_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/pc.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/sixteen_bit_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/sx.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/three_to_eight_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/two_to_four_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/cmp.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/d_f.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/write_port.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/skeleton_test.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/csa.v}

vlog -vlog01compat -work work +incdir+C:/Users/zs149/Documents/github/550-cp4 {C:/Users/zs149/Documents/github/550-cp4/skeleton_test_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_test_tb

add wave *
view structure
view signals
run -all
