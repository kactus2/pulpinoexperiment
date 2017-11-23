# pulpinoexperiment
An experimental repository containing IP-XACT packaging of PULPino by pulp-project.org: https://github.com/pulp-platform/pulpino

Based on PULPino release in August 2017

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
	== Left as ad-hoc port
- axi_node_intf_wrap:
	-- a vector of buses
	-- declared explicitly
	-- requires a new wrapper
	== Defined staticly 3 different bus interfaces, removed extra wrapper
- Riscv-core:
	-- N_EXT_PERF_COUNTERS = 0 => signal ext_perf_counters_i width is 0	
	-- Set signal width to 1, not connected
- Zero-riscy-core: zeroriscy_cs_registers
	-- N_EXT_CNT = 0 => signal ext_counters_i width is 0
	-- Set signal width to 1, not connected
- ifdefs
	-- To be replaced with design configurations
	-- Omitting for now
- generate loops
- hierarchical components with additional logic, usually muxes
	-- Split stray logic into new components

New RTL components split from stray logic in hierarchical files:
- axi_mem_if_DP_mem_mux (check)
- axi_mem_if_SP_mem_mux (check)
