# 16-bit ALU in Verilog for DSCO project
 
A structural/behavioural 16-bit Arithmetic Logic Unit written in Verilog, simulated with Icarus Verilog (`iverilog`) and inspected with GTKWave.
 
## Overview
 
The top-level module `alu` takes two 16-bit operands, a 4-bit opcode and a carry-in, and produces a 16-bit result plus status flags. A 4-to-16 decoder turns the opcode into a one-hot select line, which picks the operation.
 
### Ports
 
| Port       | Dir | Width | Description                          |
|------------|-----|-------|--------------------------------------|
| `a`        | in  | 16    | Operand A                            |
| `b`        | in  | 16    | Operand B                            |
| `op`       | in  | 4     | Operation select                     |
| `cin`      | in  | 1     | Carry-in (used by ADC / SBB)         |
| `result`   | out | 16    | Operation result                     |
| `zero`     | out | 1     | High when `result == 0`              |
| `negative` | out | 1     | MSB of `result`                      |
| `overflow` | out | 1     | Signed overflow (arithmetic ops only)|
| `cout`     | out | 1     | Carry-out (arithmetic ops only)      |
 
### Operations
 
| `op`   | Operation                              |
|--------|----------------------------------------|
| `0000` | Clear (result = 0)                     |
| `0001` | Pass A                                 |
| `0010` | Pass B                                 |
| `0011` | AND                                    |
| `0100` | OR                                     |
| `0101` | XOR                                    |
| `0110` | NOT A                                  |
| `0111` | A + B + cin                            |
| `1000` | A + 1 (increment)                      |
| `1001` | ~A + 1 (negate A)                      |
| `1010` | A + ~B + cin (subtract with borrow)    |
| `1011` | Shift left, fill 0 (SL0)               |
| `1100` | Logical shift right, fill 0 (SR0)      |
| `1101` | Arithmetic shift right (SRS)           |
| `1110` | Rotate left (ROL)                      |
| `1111` | Rotate right (ROR)                     |
 
## Project structure
 
All design files are in `Components/`:
 
| File            | Description                                          |
|-----------------|------------------------------------------------------|
| `alu.v`         | Top-level ALU                                        |
| `adder16.v`     | 16-bit ripple-carry adder (also exports carry into bit 15) |
| `fulladder.v`   | 1-bit full adder                                     |
| `and16.v`, `or16.v`, `xor16.v`, `not16.v` | 16-bit bitwise logic     |
| `SL0.v`, `SR0.v`, `SRS.v`, `ROL.v`, `ROR.v` | Shift and rotate units |
| `decoder4_16.v` | 4-to-16 decoder built from two `decoder3_8`          |
| `decoder3_8.v`  | 3-to-8 decoder with enable                           |
| `mux2_1.v`, `mux4_1.v` | Multiplexer building blocks                   |
 
`alu.v` pulls in the other modules through `` `include``, so only the top file needs to be passed to the compiler.
 
## Requirements
 
- [Icarus Verilog](https://steveicarus.github.io/iverilog/) (`iverilog`, `vvp`)
- [GTKWave](https://gtkwave.sourceforge.net/) for viewing waveforms
On Ubuntu:
 
```bash
sudo apt install iverilog gtkwave
```
 
## Compile and run
 
From the project root, replace `alu_tb.v` with the path to your testbench:
 
```bash
iverilog -o alu_sim -I Components alu_tb.v
vvp alu_sim
```
 
The `-I Components` flag lets the compiler find the files pulled in by `` `include``.
 
To view the waveform produced by the testbench's `$dumpfile`:
 
```bash
gtkwave <dumpfile_name>.vcd
```
 
To compile the ALU on its own (syntax check only, no testbench):
 
```bash
iverilog -o alu_check -I Components Components/alu.v
```
 
Claude finished the response
