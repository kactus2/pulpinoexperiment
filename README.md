# pulpinoexperiment
An experimental repository containing IP-XACT packaging of PULPino by pulp-project.org: https://github.com/pulp-platform/pulpino

Based on PULPino release in August 2017

## Setup

Update submodule pulpino

Update all pulpino IPs, see README.md in pulpino


## Notes

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
