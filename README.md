VGA Controller Project
📖 Overview
This project implements a VGA (Video Graphics Array) controller to generate standard 640×480 @ 60 Hz display signals.
The design is based on the IBM VGA standard and demonstrates how horizontal and vertical synchronization, blanking intervals, and RGB signals combine to produce a valid video output.

🎯 Features
-Generates HSYNC and VSYNC signals according to VGA timing requirements.
-Tracks horizontal (x) and vertical (y) counters for pixel positioning.
-Implements active video region detection.
-Outputs RGB signals based on simple switch inputs (SW[2:0]) or custom logic.
-Displays black background outside the visible region.

🖥 VGA Signal Timing
-Resolution: 640 × 480 pixels
-Pixel Clock: 25.175 MHz
-Total Pixels per Line: 800
  --Visible: 640
  --Front Porch: 16
  --Sync Pulse: 96
  --Back Porch: 48
-Total Lines per Frame: 525
  --Visible: 480
  --Front Porch: 10
  --Sync Pulse: 2
  --Back Porch: 33
The controller ensures RGB signals are driven only in the visible area, while blanking intervals output black.

🧩 Project Structure
-VGA Controller (vga_ctrl) 
  --Generates hsync, vsync.
  --Maintains horizontal & vertical counters.
  --Indicates active video region.
-RGB Block
  --Sets pixel colors using switch inputs.
  --Ensures black output during blanking.
-Top Module (vga_top)
  --Connects all components.
  --Final outputs: hsync, vsync, red, green, blue.
-Test Bench
  --Verifies RGB values during blank times.
  --Checks sync pulse, front porch, and back porch timing.

🚀 How to Run
1) Synthesize the design using your preferred FPGA toolchain.
2) Connect the VGA output pins to a VGA connector.
3) Use switches to change screen colors in real-time.
4) Verify output on a VGA monitor.

Verify output on a VGA monitor.
