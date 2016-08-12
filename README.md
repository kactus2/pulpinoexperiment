# pulpinoexperiment
An experimental repository containing IP-XACT packaging of PULPino by pulp-project.org: https://github.com/pulp-platform/pulpino

Based on PULPino release version 2.1

Milestones:
- Flat design
- Hierarchical view for core region
- Hierarchical view for peripherals
- Hierarchical view for RISCV core

TODO:
- Wrapper for axi_node_intf_wrap
- Component file sets not complete
- peripherals.sv in progress
- Mismatching bus definitions in the hierarchical axi_mem_if_SP_wrap

Problems faced in the design in IP-XACT point of view:
- top.sv, peripherals.sv:
	-- gpio_padcfg is 2-dimensional([6][32]) - Can't be used in bus definition
- axi_node_intf_wrap:
	-- a vector of buses
	-- declared explicitly
	-- requires a new wrapper
- Riscv-core:
	-- N_EXT_PERF_COUNTERS = 0 => signal ext_perf_counters_i width is 0
	-- Set signal width to 1, not connected
- ifdefs
	-- To be replaced with design configurations
	-- Omitting for now
- generate loops
- hierarchical components with additional logic, usually muxes
	-- Split stray logic into new components

New RTL components split from stray logic in hierarchical files:
- axi_mem_if_DP_mem_mux
- axi_mem_if_SP_mem_mux
