#!/usr/bin/env bash
echo "Compiling SimpleCPU"
iverilog -o SimpleCPU *.v

echo "Running SimpleCPU simulation"
vvp SimpleCPU
