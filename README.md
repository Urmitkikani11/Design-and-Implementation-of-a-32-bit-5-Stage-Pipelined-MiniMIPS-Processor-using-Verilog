# 🚀 32-bit 5-Stage Pipelined MiniMIPS Processor

This repository contains the design and implementation of a 32-bit, 5-stage pipelined MiniMIPS processor using Verilog. The project explores the use of pipelining to enhance instruction throughput and efficiency in a Reduced Instruction Set Computing (RISC) architecture.

## 📑 Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Pipeline Stages](#pipeline-stages)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Simulation Results](#simulation-results)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## 🌟 Introduction

Modern embedded systems demand high-performance processors, and RISC architectures like MIPS excel in efficiency and scalability. This project implements a 32-bit MiniMIPS processor in Verilog, leveraging a 5-stage pipeline to execute multiple instructions simultaneously, minimizing execution time and maximizing throughput.

Key highlights include:
- Implementation of **hazard detection** and **data forwarding** mechanisms.
- Simulation and validation using **ModelSim**.

## ✨ Features

- **RISC-based Design**: Implements a subset of the MIPS instruction set.
- **5-Stage Pipeline**: Enhances instruction throughput.
- **Hazard Management**: 
  - Data forwarding for reduced stalls.
  - Branch prediction and hazard detection for smoother execution.
- **Simulation Support**: Verilog testbench provided.
- **Scalable Design**: Modular structure for ease of optimization and FPGA implementation.

## 🛠️ Pipeline Stages

1. **Instruction Fetch (IF)**: Retrieve instructions from memory.
2. **Instruction Decode (ID)**: Decode instructions and fetch operands.
3. **Execution (EX)**: Perform arithmetic or logical operations.
4. **Memory Access (MEM)**: Handle data read/write operations.
5. **Write Back (WB)**: Update registers with results.

## 📁 Project Structure

```plaintext
.
├── src
│   ├── alu.v              # Arithmetic Logic Unit
│   ├── control_unit.v     # Control signals
│   ├── datapath.v         # Main datapath
│   ├── hazard_unit.v      # Hazard detection and resolution
│   ├── instruction_mem.v  # Instruction memory
│   ├── register_file.v    # General-purpose registers
│   └── ...                # Additional modules
├── simulations
│   ├── testbench.v        # Verilog testbench
│   └── results            # Simulation outputs
├── docs
│   └── report.pdf         # Design documentation
└── LICENSE                # MIT License
````

## 🚀 Getting Started

### Prerequisites

* **Verilog Simulator**: Tools like ModelSim or Xilinx Vivado.
* **Git**: Version control to clone the repository.

### Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/YourUsername/32bit-5stage-pipelined-MiniMIPS.git
   cd 32bit-5stage-pipelined-MiniMIPS
   ```

2. Navigate to the simulation directory and run the testbench:

   ```bash
   <verilog_simulator> -f testbench.v
   ```

3. Analyze the simulation results in the output files or waveform viewer.

## 📊 Simulation Results

* **Reduced CPI**: The pipelined architecture improves clock cycles per instruction.
* **Hazard Management**: Mechanisms like data forwarding minimize stalls.
* **Validated Functionality**: Correct execution verified via test cases.

Simulation outputs can be found in the `simulations/results` directory.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## 🙌 Acknowledgements

* **Guidance**: Prof. Dhaval Shah, Nirma University.

Feel free to ⭐ this repository if you find it helpful and open issues or pull requests for contributions! 😄

```
