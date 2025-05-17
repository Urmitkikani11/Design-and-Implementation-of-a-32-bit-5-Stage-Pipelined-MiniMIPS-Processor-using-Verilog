# ⚙️ 5-Stage Pipelined miniMIPS Processor

An educational Verilog-based implementation of a **5-stage pipelined MIPS processor**, simulating the instruction flow through standard MIPS stages: IF, ID, EX, MEM, and WB. This project is designed to help understand pipelined architecture and hazards in RISC-based processors.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📌 Project Details

- **Title**: 5-Stage Pipelined miniMIPS Processor  
- **Platform**: Verilog (Simulation on **ModelSim** and **Quartus**)  
- **Developers**: Urmit Kikani (22BEC137), Jemit Rathor (22BEC102)
- **Guide**: Prof. Dhaval Shah  
- **Department**: Electronics and Communication Engineering  
- **Institute**: Institute of Technology  
- **University**: Nirma University, Ahmedabad  

---

## 🧠 Block Diagram

![Block Diagram](Block%20Diagram%20of%205%20stages%20pipelined%20miniMIPS/Block%20diagram%20of%205%20stages%20pipelined%20miniMIPS.jpg)

---

## 🌟 Features

- 🔄 **5 Pipeline Stages**: Implements all five classical MIPS pipeline stages:
  - Instruction Fetch (IF)
  - Instruction Decode/Register Fetch (ID)
  - Execute (EX)
  - Memory Access (MEM)
  - Write Back (WB)

- 🧰 **Hazard Handling**:
  - Data hazards managed via forwarding logic and pipeline stalls.
  - Control hazards reduced using simple branching logic.

- 🧱 **Modular Design**:
  - Clean and well-separated modules for each stage.
  - Easy to read, extend, and debug.

---
## 📊 Instruction Pipeline Example

| Cycle | IF      | ID      | EX      | MEM     | WB      |
|-------|---------|---------|---------|---------|---------|
| 1     | Instr 1 |         |         |         |         |
| 2     | Instr 2 | Instr 1 |         |         |         |
| 3     | Instr 3 | Instr 2 | Instr 1 |         |         |
| 4     | Instr 4 | Instr 3 | Instr 2 | Instr 1 |         |
| 5     | Instr 5 | Instr 4 | Instr 3 | Instr 2 | Instr 1 |

---
## 🧪 Simulation Instructions

### 📦 Requirements

- Verilog simulation tools:
  - **ModelSim** (for simulation and waveform analysis)
  - **Quartus Prime** (for RTL design, synthesis, and analysis)

### ▶️ How to Run

1. Clone or download this repository.
2. Open your Verilog tool (ModelSim or Quartus).
3. Add all source files to your project.
4. Compile and simulate to observe instruction flow and register/memory updates.

---

## 🧱 Pipeline Architecture Summary

Each instruction passes through the following stages:

1. **IF** – Program counter increments and instruction is fetched.
2. **ID** – Instruction is decoded and registers are read.
3. **EX** – ALU performs operation.
4. **MEM** – Memory read/write operations.
5. **WB** – Results written back to registers.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Acknowledgments

- Developed as part of coursework under the guidance of faculty at **Nirma University, Ahmedabad**.
- Special thanks to **Prof. Dhaval Shah** for mentoring and guidance.

---

Thank you for exploring the 5-Stage Pipelined miniMIPS Processor! ⚙️🚀
