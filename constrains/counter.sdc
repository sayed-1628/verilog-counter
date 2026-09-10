create_clock -name clk -period 20.0 [get_ports clk]
derive_clock_uncertainty
set_input_delay 2.0 -clock clk [get_ports en]
set_input_delay 2.0 -clock clk [get_ports rst_n]
set_output_delay 3.0 -clock clk [get_ports  {count[*]}] 
