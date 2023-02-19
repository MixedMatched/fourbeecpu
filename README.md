# fourbee cpu
the fourbee cpu is a very simple 4-bit cpu

## architecture
there are two registers on the cpu, which are hard referenced by the instructions. fourbee uses a harvard architecture (the program and instruction memory are split). the cpu can connect to a whopping 16 addresses of 4-bit program memory and 16 addresses of 4-bit instruction memory. 

this cpu uses a custom instruction set architecture defined in the following table. each instruction is a single 4-bit binary word, which is a single hex digit.

| mnemonic | binary | hex | description | assignment |
| --- | --- | --- | --- | --- |
| swp | 0000 | 0 | swap the registers | rx <=> ry |
| add | 0001 | 1 | add the registers | rx = rx + ry |
| sub | 0010 | 2 | subtract two registers | rx = rx - ry |
| and | 0011 | 3 | bitwise and two registers | rx = rx & ry |
| or | 0100 | 4 | bitwise or two registers | rx = rx | ry |
| inc | 0101 | 5 | increment one register | rx = rx + 1 |
| not | 0110 | 6 | bitwise not one register | rx = ~rx |
| lsl | 0111 | 7 | logical shift left one register | rx = rx << 1 |
| lsr | 1000 | 8 | logical shift right one register | rx = rx >> 1 |
| jmp | 1001 | 9 | jump to address in register | pc = rx |
| jz | 1010 | A | jump to address in register if zero flag is set | if (z) pc = rx |
| jnz | 1011 | B | jump to address in register if zero flag is not set | if (!z) pc = rx |
| jn | 1100 | C | jump to address in register if negative flag is set | if (n) pc = rx |
| jnn | 1101 | D | jump to address in register if negative flag is not set | if (!n) pc = rx |
| ld | 1110 | E | load register from memory | rx = mem[ry] |
| st | 1111 | F | store register to memory | mem[ry] = rx |

the cpu has two flags, the zero flag and the negative flag. the zero flag is set if the result of the last operation was zero, and the negative flag is set if the result of the last operation was negative.

## simulating
to build and simulate the cpu, you'll need to have make, iverilog, and vvp installed. you can compile the cpu with:
```
make compile
```
which will generate vvp files for each testbench in the target folder. you can simulate these testbenches by doing:
```
make simulate
```
which will run vvp on each of the compiled files. to do both you can run:
```
make all
```

## license

Copyright (C) 2022 Alessandra Simmons

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.