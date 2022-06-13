transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Adder4bit {C:/Users/user/Desktop/Adder4bit/Adder4bit.v}

vlog -vlog01compat -work work +incdir+C:/Users/user/Desktop/Adder4bit {C:/Users/user/Desktop/Adder4bit/FA_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc" FA_test

add wave *
view structure
view signals
run -all
