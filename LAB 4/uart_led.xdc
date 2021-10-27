set_property IOSTANDARD LVCMOS33 [get_ports clk_pin]
set_property IOSTANDARD LVCMOS33 [get_ports btn_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rxd_pin]
set_property IOSTANDARD LVCMOS33 [get_ports rst_pin]
set_property PACKAGE_PIN E3 [get_ports clk_pin]
set_property PACKAGE_PIN M18 [get_ports btn_pin]
set_property PACKAGE_PIN C4 [get_ports rxd_pin]
set_property PACKAGE_PIN N17 [get_ports rst_pin]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pins[7]}]
set_property DRIVE 12 [get_ports {led_pins[0]}]
set_property DRIVE 12 [get_ports {led_pins[1]}]
set_property DRIVE 12 [get_ports {led_pins[2]}]
set_property DRIVE 12 [get_ports {led_pins[3]}]
set_property DRIVE 12 [get_ports {led_pins[4]}]
set_property DRIVE 12 [get_ports {led_pins[5]}]
set_property DRIVE 12 [get_ports {led_pins[6]}]
set_property DRIVE 12 [get_ports {led_pins[7]}]
set_property SLEW SLOW [get_ports {led_pins[0]}]
set_property SLEW SLOW [get_ports {led_pins[1]}]
set_property SLEW SLOW [get_ports {led_pins[2]}]
set_property SLEW SLOW [get_ports {led_pins[3]}]
set_property SLEW SLOW [get_ports {led_pins[4]}]
set_property SLEW SLOW [get_ports {led_pins[5]}]
set_property SLEW SLOW [get_ports {led_pins[6]}]
set_property SLEW SLOW [get_ports {led_pins[7]}]
set_property PACKAGE_PIN U16 [get_ports {led_pins[7]}]
set_property PACKAGE_PIN U17 [get_ports {led_pins[6]}]
set_property PACKAGE_PIN V17 [get_ports {led_pins[5]}]
set_property PACKAGE_PIN R18 [get_ports {led_pins[4]}]
set_property PACKAGE_PIN N14 [get_ports {led_pins[3]}]
set_property PACKAGE_PIN J13 [get_ports {led_pins[2]}]
set_property PACKAGE_PIN K15 [get_ports {led_pins[1]}]
set_property PACKAGE_PIN H17 [get_ports {led_pins[0]}]

create_clock -period 10.000 -name clk_pin -waveform {0.000 5.000} [get_ports clk_pin]
set_input_delay -clock [get_clocks clk_pin] -min -add_delay -0.500 [get_ports btn_pin]
set_input_delay -clock [get_clocks clk_pin] -max -add_delay 0.000 [get_ports btn_pin]
set_input_delay -clock [get_clocks clk_pin] -min -add_delay -0.500 [get_ports rst_pin]
set_input_delay -clock [get_clocks clk_pin] -max -add_delay 0.000 [get_ports rst_pin]
set_input_delay -clock [get_clocks clk_pin] -min -add_delay -0.500 [get_ports rxd_pin]
set_input_delay -clock [get_clocks clk_pin] -max -add_delay 0.000 [get_ports rxd_pin]
set_output_delay -clock [get_clocks clk_pin] -min -add_delay 0.000 [get_ports {led_pins[*]}]
set_output_delay -clock [get_clocks clk_pin] -max -add_delay 0.000 [get_ports {led_pins[*]}]



set_property IOB TRUE [get_ports {led_pins[*]}]
set_property IOB TRUE [get_ports {led_pins[*]}]
set_property IOB TRUE [get_ports {led_pins[*]}]