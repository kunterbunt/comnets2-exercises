#Prepare files for simulation. Copy this file into workspace directory with:
#scp prepare_simulation.sh  xxxx@l00p32.rz.tu-harburg.de:~/workspace/ex7
#substitude xxxxx with login
#To execute:
#1. Write "bash"
#2. Write ""./prepare_simulation"


cd ~/workspace/ex7 \
&&rm -rf out \
&&makeCONFIGNAME=gcc-release-fmakemakefiles \
&&make MODE=release
