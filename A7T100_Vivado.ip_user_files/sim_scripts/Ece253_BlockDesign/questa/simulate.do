onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib Ece253_BlockDesign_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {Ece253_BlockDesign.udo}

run -all

quit -force
