onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label CLOCK_50 -radix binary /testbench/CLOCK_50
add wave -noupdate -label KEY -radix binary /testbench/KEY
add wave -noupdate -label SW -radix binary /testbench/SW
add wave -noupdate -label VGA_X -radix hexadecimal /testbench/VGA_X
add wave -noupdate -label VGA_Y -radix hexadecimal /testbench/VGA_Y
add wave -noupdate -label VGA_COLOR -radix hexadecimal /testbench/VGA_COLOR
add wave -noupdate -label plot -radix binary /testbench/plot
add wave -noupdate -label key_action -radix binary /testbench/key_action
add wave -noupdate -divider vga_demo
add wave -noupdate -label ps2_clk -radix binary /testbench/U1/PS2_CLK
add wave -noupdate -label ps2_dat -radix binary /testbench/U1/PS2_DAT
add wave -noupdate -label Packet -radix hexadecimal /testbench/U1/Packet
add wave -noupdate -divider object
add wave -noupdate -label x -radix hexadecimal /testbench/U1/O1/X
add wave -noupdate -label y -radix hexadecimal /testbench/U1/O1/Y
add wave -noupdate -label xC -radix hexadecimal /testbench/U1/O1/XC
add wave -noupdate -label yC -radix hexadecimal /testbench/U1/O1/YC
add wave -noupdate -label object_address -radix hexadecimal /testbench/U1/O1/U6/address
add wave -noupdate -label object_color -radix hexadecimal /testbench/U1/O1/U6/q
add wave -noupdate -label go -radix hexadecimal /testbench/U1/O1/go
add wave -noupdate -label FSM -radix hexadecimal /testbench/U1/O1/y_Q
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
WaveRestoreZoom {0 ps} {120 ns}
