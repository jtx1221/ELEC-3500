// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.3 (win64) Build 1682563 Mon Oct 10 19:07:27 MDT 2016
// Date        : Sat Mar 09 12:41:55 2019
// Host        : ME4166-09 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode pin_planning -force -port_diff_buffers {W:/Desktop/ELEC 3500 LABS/LAB
//               7/lab5/uart_led.v}
// Design      : ios
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
module ios(led_pins, clk_pin, btn_pin, rxd_pin, rst_pin);
  output [7:0] led_pins;
  input clk_pin;
  input btn_pin;
  input rxd_pin;
  input rst_pin;

  // internal wires associated with differential buffers
//***************************************************************************
  // Parameter definitions
  //***************************************************************************
    parameter BAUD_RATE           = 115_200;   
    parameter CLOCK_RATE          = 100_000_000;
  
  //***************************************************************************
  // Reg declarations
  //***************************************************************************
  
  //***************************************************************************
  // Wire declarations
  //***************************************************************************
  
    // Synchronized reset
    wire             rst_clk_rx;
  
    // Synchronized button
    wire             btn_clk_rx;
  
    // Between uart_rx and led_ctl
    wire [7:0]       rx_data;      // Data output of uart_rx
    wire             rx_data_rdy;  // Data ready output of uart_rx
    
  //***************************************************************************
  // Code
  //***************************************************************************
  
    // Metastability harden the rst - this is an asynchronous input to the
    // system (from a pushbutton), and is used in synchronous logic. Therefore
    // it must first be synchronized to the clock domain (clk_pin in this case)
    // prior to being used. A simple metastability hardener is appropriate here.
    meta_harden meta_harden_rst_i0 (
      .clk_dst      (clk_pin),
      .rst_dst      (1'b0),    // No reset on the hardener for reset!
      .signal_src   (rst_pin),
      .signal_dst   (rst_clk_rx)
    );
  
    // And the button input
    meta_harden meta_harden_btn_i0 (
      .clk_dst      (clk_pin),
      .rst_dst      (rst_clk_rx),
      .signal_src   (btn_pin),
      .signal_dst   (btn_clk_rx)
    );
  
    uart_rx #(
      .CLOCK_RATE   (CLOCK_RATE),
      .BAUD_RATE    (BAUD_RATE) 
    ) uart_rx_i0 (
      .clk_rx      (clk_pin),
      .rst_clk_rx  (rst_clk_rx),
  
      .rxd_i       (rxd_pin),
      .rxd_clk_rx  (),
      
      .rx_data_rdy (rx_data_rdy),
      .rx_data     (rx_data),
      .frm_err     ()
    );
  
    led_ctl led_ctl_i0 (
      .clk_rx      (clk_pin),
      .rst_clk_rx  (rst_clk_rx),
      .btn_clk_rx  (btn_clk_rx),
      .rx_data     (rx_data),
      .rx_data_rdy (rx_data_rdy),
      .led_o       (led_pins)
    );


  // differential buffers


endmodule
