#Run simulation. Copy this file into workspace directory with:
#scp run_simulation.sh  xxxxx@l00p32.rz.tu-harburg.de:~/workspace/ex7
#substitude xxxx with login
#To execute:
#1. Write "bash" go to directory
#2. Write ""./run_simulation"
#3. Correct for requiered number of runs -r and confgiuracion -c

cd ~/workspace/ex7 \
&&./out/gcc-release/ex7 -u Cmdenv -c TenRunsThousendSec -r 0..9 -n .:../inet/src/ omnetpp.ini
