To use this demo:

This demo uses the VGA output display in the DESim GUI. It first displays a background 
image (MIF) on the VGA output, which is read from the video memory.  Then, the code displays
two objects, each of which is read from a small memory, on the screen. Each object can be 
moved left/right/up/down by pressing PS2 keyboard keys. To use the circuit, first use KEY[0]
to perform a reset. The background MIF should appear on the VGA output. Pressing KEY[1] 
displays one object, at its initial position, and pressing KEY[2] displays the other object.
Move the first object left/right/up/down using PS2 keys a/s/w/z, and the other object using 
d/f/r/c.

The VGA resolution can be set to 640x480, 320x240, or 160x120. The color depth can be set 
to 3-, 6-, or 9-bit color. Set these parameters in top.v.

Note: if the background image isn't needed, then comment out the line:

`define VGA_MEMORY

in vga_demo.v
