onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLOCK_50 -radix binary /testbench/clk
add wave -noupdate -label reset -radix binary /testbench/reset
add wave -noupdate -label key -radix binary /testbench/key
add wave -noupdate -label move_2bit -radix binary /testbench/move_2bit
add wave -noupdate -label enable -radix binary /testbench/enable
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 80
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2000 ns}
