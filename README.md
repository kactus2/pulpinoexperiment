# pulpinoexperiment
An experimental repository containing IP-XACT packaging of Pulpino by pulp-project.org: https://github.com/pulp-platform/pulpino

TODO:
- Wrapper for axi_node_intf_wrap
- Component file sets not complete
- peripherals.sv in progress
- Mismatching bus definitions in the hierarchical axi_mem_if_SP_wrap

Problems faced in the design in IP-XACT point of view:
- top.sv, peripherals.sv:
	gpio_padcfg is 2-dimensional([6][32] - How to define bus?
- axi_node_intf_wrap:
	2-dimensional buses
- Riscv-core:
	N_EXT_PERF_COUNTERS = 0 => signal width 0
	Omitting signal
- ifdefs
- generate loops
- hierarchical components with additional logic, usually muxes

New RTL components split from stray logic in hierarchical files:
axi_mem_if_DP_mem_mux
axi_mem_if_SP_mem_mux
