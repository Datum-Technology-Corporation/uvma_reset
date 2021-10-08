# About
## [Home Page](https://datum-technology-corporation.github.io/uvma_reset/)
The Moore.io UVM Reset Agent is a simple and vital element to any UVM test bench.  Both for driving and monitoring purposes.  This project consists of the agent (`uvma_reset_pkg`), the self-testing UVM environment (`uvme_reset_st_pkg`) and the test bench (`uvmt_reset_st_pkg`) to verify the agent against itself.

## IP
* DV
> * uvma_reset
> * uvme_reset_st
> * uvmt_reset_st
* RTL
* Tools


# Simulation
```
cd ./sim
cat ./README.md
./setup_project.py
source ./setup_terminal.sh
export VIVADO=/path/to/vivado/install
dvm --help
clear && dvm all uvmt_reset_st -t rand_pulses -s 1 -w
```
