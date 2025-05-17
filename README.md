
# 🚀 32-bit 5-Stage Pipelined MiniMIPS Processor

This repository showcases the design and implementation of a 32-bit MiniMIPS processor with a 5-stage pipelined architecture using Verilog. The MiniMIPS processor enhances instruction throughput by leveraging pipelining techniques, ensuring efficient execution of multiple instructions simultaneously.

---

## 📖 Overview

The MiniMIPS processor follows the classic 5-stage MIPS pipeline architecture:
1. **Instruction Fetch (IF):** Retrieves instructions from memory.
2. **Instruction Decode (ID):** Decodes instructions and fetches operands.
3. **Execute (EX):** Performs arithmetic/logic operations.
4. **Memory Access (MEM):** Handles data memory read/write.
5. **Write Back (WB):** Updates register file with the final result.

It includes mechanisms for:
- **Data Hazard Resolution** through forwarding units.
- **Control Hazard Handling** with branch prediction and instruction flushing.

---

## 🌟 Features

- **32-bit Pipelined Processor:** Designed for educational and research purposes.
- **5-Stage Pipelining:** Maximizes instruction throughput.
- **Hazard Detection and Forwarding:** Manages pipeline hazards efficiently.
- **RISC Architecture:** Implements a simplified subset of MIPS instructions.
- **Verilog Implementation:** Modular, scalable, and ready for FPGA deployment.

---

## 🔧 Project Structure

```plaintext
.
├── src
│   ├── alu.v              # Arithmetic Logic Unit
│   ├── control_unit.v     # Generates control signals
│   ├── datapath.v         # Core processor datapath
│   ├── hazard_unit.v      # Handles data and control hazards
│   ├── instruction_mem.v  # Instruction memory
│   ├── register_file.v    # Register file with 32 registers
│   └── other_modules.v    # Additional pipeline components
├── docs
│   └── design_report.pdf  # Detailed design documentation
├── sim
│   └── simulation_results # Simulation waveform screenshots
└── LICENSE                # MIT License
````

---

## 🖼️ Pipeline Diagram

![5-Stage Pipelined Processor](https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/MIPS_pipeline.svg/800px-MIPS_pipeline.svg.png)

---

## 🏁 Getting Started

### Prerequisites

* **Verilog Simulator:** Tools like ModelSim or Vivado for simulation and verification.
* **Git:** To clone the repository.

### Steps to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/YourUsername/32bit-5stage-pipelined-MiniMIPS.git
   cd 32bit-5stage-pipelined-MiniMIPS
   ```

2. Open the Verilog files in your simulator and configure the design for simulation.

3. Analyze the results using waveform viewers to verify the pipeline functionality.

---

## 🧪 Results

The pipelined MiniMIPS processor was validated using Verilog simulation, yielding the following outcomes:

* **Improved Throughput:** Faster instruction execution compared to non-pipelined designs.
* **Correct Hazard Handling:** Data forwarding and flushing mechanisms ensured smooth execution without pipeline stalls.
* **Validated Instruction Set:** All supported instructions executed correctly, maintaining program order.

Simulation results can be found in the `sim/simulation_results` directory.

---

## 👥 Contributors

* **Urmit Kikani** (22BEC137)
* **Jemit Rathor** (22BEC102)

---

## 🏫 Academic Information

* **Guide:** Prof. Dhaval Shah
* **Department:** Electronics and Communication Engineering
* **University:** Nirma University

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Feel free to ⭐ this repository if you find it useful, and don't hesitate to contribute or raise issues! 😊

```

This version includes **everything in a single code block** for easy copy-pasting, as per your request.
```
