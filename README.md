# pulpinoexperiment
An experimental repository containing IP-XACT packaging of PULPino RISC-V microcontroller by pulp-project.org: https://github.com/pulp-platform/pulpino

Based on PULPino release in August 2017.

## Setup

Update submodule pulpino:

    git submodule init
    git submodule update

Update all pulpino IPs, see README.md in pulpino for full instructions:

    cd pulpino
    ./update-ips.py
    
## Directories

- ip-xact: IP-XACT description files
- pulpino: Submodule directory for original PULPino implementation
- rtl: RTL implementation files for glue logic and wrappers

## Notes on packaging

The following lists problems faced in the design in IP-XACT point of view:
- top.sv, peripherals.sv:
	- gpio_padcfg is 2-dimensional([6][32]) - Can't be used in bus definition
	- Left as ad-hoc port
- axi_node_intf_wrap.sv:
	- a vector of buses declared - Cant' be expressed in bus interfaces
	- Within the project the number of interfaces is always a constant
	- Created a new wrapper with bare ports and a set number of interfaces
- riscv-core.sv:
	- Parameter N_EXT_PERF_COUNTERS = 0 => signal ext_perf_counters_i boundaries are [-1:0] - IP-XACT port boundaries must be positive
	- Set default value to 1 which sets signal width to 1, not connected
- zero-riscy-core: zeroriscy_cs_registers
	- Parameter N_EXT_CNT = 0 => signal ext_counters_i boundaries are [-1:0] 
	- Set default value to 1 which sets signal width to 1, not connected
- ifdefs
	- To be replaced with design configurations and isPresent attribute
- generate loops - IP-XACT cannot express n instances
	- Replaced with static number of instances
- hierarchical modules with additional logic, usually muxes
	-- Split stray(glue) logic into new components in directory rtl

New RTL components split from stray logic in hierarchical files:
- core_region_demux
- csr_logic
- csr_mux
- mux_mem
- spi_master_fsm
- uart_registers
- zero_riscy_registers
