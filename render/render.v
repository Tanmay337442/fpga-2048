// memory for cells 2^1-2^11
module mem0(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/1.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem1(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/2.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem2(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/4.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem3(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/8.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem4(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/16.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem5(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/32.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem6(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/64.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem7(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/128.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem8(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/256.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem9(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/512.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem10(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/1024.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module mem11(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 10;   // address bits
    parameter INIT_FILE = "./MIF/2048.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

// grid background object
module grid_bg(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 17;   // address bits
    parameter INIT_FILE = "./MIF/bmp_320_3.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

// win background object
module win_bg(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 17;   // address bits
    parameter INIT_FILE = "./MIF/win_bg.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

// loss background object
module loss_bg(address, clock, q);
    parameter n = 9;    // memory width
    parameter Mn = 17;   // address bits
    parameter INIT_FILE = "./MIF/loss_bg.mif";

	input wire [Mn-1:0] address;
	input wire clock;
	output [n-1:0]  q;
	wire [n-1:0] sub_wire0;
	wire [n-1:0] q = sub_wire0[n-1:0];

	altsyncram	altsyncram_component (
				.address_a (address),
				.clock0 (clock),
				.q_a (sub_wire0),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.address_b (1'b1),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_a ({n{1'b1}}),
				.data_b (1'b1),
				.eccstatus (),
				.q_b (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_a (1'b0),
				.wren_b (1'b0));
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.clock_enable_input_a = "BYPASS",
		altsyncram_component.clock_enable_output_a = "BYPASS",
		altsyncram_component.init_file = INIT_FILE,
		altsyncram_component.intended_device_family = "Cyclone V",
		altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=NO",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = 1 << Mn,
		altsyncram_component.operation_mode = "ROM",
		altsyncram_component.outdata_aclr_a = "NONE",
		altsyncram_component.outdata_reg_a = "UNREGISTERED",
		altsyncram_component.widthad_a = Mn,
		altsyncram_component.width_a = n,
		altsyncram_component.width_byteena_a = 1;
endmodule

module render_bg(clk, resetn, go, state, VGA_x, VGA_y, VGA_color, VGA_write, done);
	// parameters from object
	parameter RESOLUTION = "320x240"; // "640x480" "320x240" "160x120"
    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = (RESOLUTION == "640x480") ? 10 : ((RESOLUTION == "320x240") ? 9 : 8);
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = (RESOLUTION == "640x480") ? 9 : ((RESOLUTION == "320x240") ? 8 : 7);
    parameter COLOR_DEPTH = 9;

	// inputs and outputs
	input clk, resetn, go;
	input [1:0] state;
	output [nX-1:0] VGA_x;                 // for syncing with object memory
	output [nY-1:0] VGA_y;                 // for syncing with object memory
	output reg [COLOR_DEPTH-1:0] VGA_color;    // used to draw pixels
    output VGA_write;                      // pixel write control
    output reg done;

	reg [8:0] xcounter; // 319 is 100111111
	reg [7:0] ycounter; // 239 is 11101111

	wire [17:0] addr; // address of pixel in current memory object

	// update counters to draw background pixel by pixel
	always @(posedge clk) begin
		if (!resetn) begin
			xcounter <= 9'd0;
			ycounter <= 8'd0;
			done <= 1'b0;
		end
		else if (go) begin
			done <= 1'b0;
			// count up across row then move to next row
			if (ycounter == 8'd239 && xcounter == 9'd319) begin
				done <= 1'b1;
			end
			else if (xcounter == 9'd319) begin
				xcounter <= 9'd0;
				ycounter <= ycounter + 8'd1;
			end
			else begin
				xcounter <= xcounter + 9'd1;
			end
		end
	end
endmodule

// render single cell on grid
module render_cell(clk, resetn, go, cell_num, row, col, VGA_x, VGA_y, VGA_color, VGA_write, done);
	// parameters from object
	parameter RESOLUTION = "320x240"; // "640x480" "320x240" "160x120"
    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = (RESOLUTION == "640x480") ? 10 : ((RESOLUTION == "320x240") ? 9 : 8);
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = (RESOLUTION == "640x480") ? 9 : ((RESOLUTION == "320x240") ? 8 : 7);
    parameter COLOR_DEPTH = 9;
	
	// constants for coords
	parameter leftX = 78;
	parameter topY = 38;
	parameter shiftX = 44;
	parameter shiftY = 44;

	// inputs and outputs
	input clk, resetn, go;
	input [3:0] cell_num;
	input [1:0] row, col;
	output [nX-1:0] VGA_x;                 // for syncing with object memory
	output [nY-1:0] VGA_y;                 // for syncing with object memory
	output reg [COLOR_DEPTH-1:0] VGA_color;    // used to draw pixels
    output VGA_write;                      // pixel write control
    output reg done;                            // done drawing cycle

	// set top left corner position of cell to draw
	wire [nX-1:0] startX;
	wire [nY-1:0] startY;
	assign startX = leftX + col * shiftX;
	assign startY = topY + row * shiftY;

	reg [4:0] xcounter, ycounter; // 5 bits since 2^5 = 32

	wire [9:0] addr; // address of pixel in current memory object
	assign addr = {ycounter, xcounter};

    reg write;       // object control signals
    reg [2:0] y_Q, Y_D;                  // FSM
    
	wire [COLOR_DEPTH-1:0] obj_color;    // object pixel colors, read from memory
	
    // object (x,y) location. For x, counter will be enabled when moving L/R, increment
    // for R, decrement for L. For y, counter will be enabled when moving U/D, increment 
    // for D, decrement for U
    assign X0 = XOFFSET;
    assign Y0 = YOFFSET;

	// wires to store pixel colours
	wire [8:0] c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;

	// set colours of current pixel for each memory object
	mem0 m0(addr, clk, c0);
	mem1 m1(addr, clk, c1);
	mem2 m2(addr, clk, c2);
	mem3 m3(addr, clk, c3);
	mem4 m4(addr, clk, c4);
	mem5 m5(addr, clk, c5);
	mem6 m6(addr, clk, c6);
	mem7 m7(addr, clk, c7);
	mem8 m8(addr, clk, c8);
	mem9 m9(addr, clk, c9);
	mem10 m10(addr, clk, c10);
	mem11 m11(addr, clk, c11);

	// states for FSM
	parameter [3:0] A = 4'd0, B = 4'd1, C = 4'd2, D = 4'd3, E = 4'd4, F = 4'd5, G = 4'd6,
					H = 4'd7, I = 4'd8, J = 4'd9, K = 4'd10, L = 4'd11;
	
	// cases for numbers
    always @ (*) begin
        // default assignments
        write = 1'b0; 
        erase = 1'b0;
		done = 1'b0;
        case (cell_num)
            // FSM
			A: VGA_color = c0;
			B: VGA_color = c1;
			C: VGA_color = c2;
			D: VGA_color = c3;
			E: VGA_color = c4;
			F: VGA_color = c5;
			G: VGA_color = c6;
			H: VGA_color = c7;
			I: VGA_color = c8;
			J: VGA_color = c9;
			K: VGA_color = c10;
			L: VGA_color = c11;
			default: VGA_color = c0;
        endcase
    end

	always @(posedge clk) begin
		if (!resetn) begin
			xcounter <= 5'b00000;
			ycounter <= 5'b00000;
			done <= 1'b0;
		end
		else if (go) begin
			done <= 1'b0;
			// count up across row then move to next row
			if (ycounter == 5'd31) begin
				done <= 1'b1;
			end
			else if (xcounter == 5'd31) begin
				xcounter <= 5'b00000;
				ycounter <= ycounter + 5'b00001;
			end
			else begin
				xcounter <= xcounter + 5'b00001;
			end
		end
	end
endmodule

module render_grid(clk, reset, enable, grid_in);

endmodule

module render(clk, reset, enable, grid_in, state);
    input clk, reset, enable;
    input [63:0] grid_in;
    input [1:0] state;

	parameter RESOLUTION = "320x240"; // "640x480" "320x240" "160x120"
    parameter COLOR_DEPTH = 3; // 9 6 3

    // specify the number of bits needed for an X (column) pixel coordinate on the VGA display
    parameter nX = (RESOLUTION == "640x480") ? 10 : ((RESOLUTION == "320x240") ? 9 : 8);
    // specify the number of bits needed for a Y (row) pixel coordinate on the VGA display
    parameter nY = (RESOLUTION == "640x480") ? 9 : ((RESOLUTION == "320x240") ? 8 : 7);

	input wire CLOCK_50;	
	input wire [3:0] KEY;
	output wire [9:0] LEDR;
    output [7:0] VGA_R;
    output [7:0] VGA_G;
    output [7:0] VGA_B;
    output VGA_HS;
    output VGA_VS;
    output VGA_BLANK_N;
    output VGA_SYNC_N;
    output VGA_CLK;    

	// The four signals below are used in demos that actively draw pixels on top of the 
    // background MIF. In this example, only the background is drawn, so these signals are 
    // just used as placeholders in this very simple example.
	wire [COLOR_DEPTH-1:0] color;        // used as placeholder
    wire [nX-1:0] X;                     // used as placeholder
    wire [nY-1:0] Y;                     // used as placeholder
    wire write;                          // used as placeholder
    
    // display the color depth
    assign LEDR[3:0] = (COLOR_DEPTH == 9) ? 4'b1001 : ((COLOR_DEPTH == 6) ? 4'b0110 : 4'b0011);

    assign color = 0;
    assign X = 0;
    assign Y = 0;
    assign write = 0;

    // instantiate the VGA adapter
    vga_adapter VGA (
        .resetn(KEY[0]),
        .clock(CLOCK_50),
        .color(color),
        .x(X),
        .y(Y),
        .write(write),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS),
        .VGA_BLANK_N(VGA_BLANK_N),
        .VGA_SYNC_N(VGA_SYNC_N),
        .VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = RESOLUTION;
        // choose background image according to resolution and color depth
		defparam VGA.BACKGROUND_IMAGE = 
            (RESOLUTION == "640x480") ?
                ((COLOR_DEPTH == 9) ? "./MIF/bmp_640_9.mif" :
                ((COLOR_DEPTH == 6) ? "./MIF/bmp_640_6.mif" :
                "./MIF/bmp_640_3.mif")) : 
            ((RESOLUTION == "320x240") ?
                ((COLOR_DEPTH == 9) ? "./MIF/bmp_320_9.mif" :
                ((COLOR_DEPTH == 6) ? "./MIF/bmp_320_6.mif" :
                "./MIF/bmp_320_3.mif")) : 
                    // 160x120
                    ((COLOR_DEPTH == 9) ? "./MIF/bmp_160_9.mif" :
                    ((COLOR_DEPTH == 6) ? "./MIF/bmp_160_6.mif" :
                    "./MIF/bmp_160_3.mif")));
		defparam VGA.COLOR_DEPTH = COLOR_DEPTH;

	// need FSM to display grid, win, or loss screen
	parameter [1:0] INIT = 2'b00, PLAYING = 2'b01, WIN = 2'b10, LOSS = 2'b11;
	always @(*) begin
		case (state)
			// render initialized board
			INIT: begin
			end
			// render current grid from gridmemory
			PLAYING: begin
			end
			// render win screen
			WIN: begin
			end
			// render loss screen
			LOSS: begin
			end
		endcase
	end
endmodule