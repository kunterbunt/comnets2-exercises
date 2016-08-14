#Prepare files for simulation. Copy this file into default directory with:
#scp prepare_simulation.sh  xxxxxx@l00p32.rz.tu-harburg.de:~/workspace/ex7
#substitude xxxx with login
#To execute:
#1. Write "bash"
#2. Write ""./prepare_simulation"


cd ~/workspace/exam_project \
&&rm -rf out \
&&makeCONFIGNAME=gcc-release-fmakemakefiles \
&&make MODE=release
