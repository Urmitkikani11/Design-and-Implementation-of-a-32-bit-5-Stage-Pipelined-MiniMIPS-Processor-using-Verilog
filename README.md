
# ⚙️ 5-Stage Pipelined miniMIPS Processor

An educational Verilog-based implementation of a **5-stage pipelined MIPS processor**, simulating the instruction flow through standard MIPS stages: IF, ID, EX, MEM, and WB. This project is designed to help understand pipelined architecture and hazards in RISC-based processors.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📌 Project Details

- **Title**: 5-Stage Pipelined miniMIPS Processor  
- **Platform**: Verilog (Simulation on ModelSim / Vivado)  
- **Developers**: Urmit Kikani (22BEC137), Jemit Rathor (22BEC102)  
- **Institution**: Nirma University  
- **Guide**: Prof. Dhaval Shah  

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

## 🧪 Simulation Instructions

### 📦 Requirements

- Verilog simulation tool such as:
  - **ModelSim**
  - **Vivado**
  - **Icarus Verilog**

### ▶️ How to Run

1. Clone or download this repository.
2. Open your Verilog simulation tool.
3. Compile all source files.
4. Run the simulation and observe instruction flow and register/memory updates.

---

## 📂 File Structure

```

📁 5-Stage-MIPS
├── 📁 Block Diagram of 5 stages pipelined miniMIPS
│   └── 📄 Block diagram of 5 stages pipelined miniMIPS.jpg
├── 📁 src
│   ├── 📄 if\_stage.v
│   ├── 📄 id\_stage.v
│   ├── 📄 ex\_stage.v
│   ├── 📄 mem\_stage.v
│   ├── 📄 wb\_stage.v
│   └── 📄 top\_module.v
├── 📄 README.md
└── 📄 LICENSE

```

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

- Developed as part of coursework under the guidance of faculty at **Nirma University**.
- Special thanks to **Prof. Dhaval Shah** for mentoring and guidance.

---

Thank you for exploring the 5-Stage Pipelined miniMIPS Processor! ⚙️🚀
```
