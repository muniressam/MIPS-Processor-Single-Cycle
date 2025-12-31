vlib work
vlog ../RTL/*.v +cover
vlog *.v +cover
vsim -voptargs=+acc work.MIPS_TB

add wave /MIPS_TB/DUT/*
add wave /MIPS_TB/inst_Data_Memory/*
add wave /MIPS_TB/inst_Instruction_Memory/*

run -all

#quit -sims