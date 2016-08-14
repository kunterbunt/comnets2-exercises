#Run simulation. Copy this file into default directory with:
#scp run_simulation.sh  xxxxx@l00p32.rz.tu-harburg.de:~/workspace/ex7
#substitude xxxx with login
#To execute:
#1. Write "bash" go to directory
#2. Write ""./run_simulation"


cd ~/workspace/exam_project \
&&./out/gcc-release/exam_project  -u Cmdenv -r 0..19 -c FiftyStudents  -n .:../inet/src/ omnetpp.ini \
&&./out/gcc-release/exam_project  -u Cmdenv -r 0..19 -c HundredStudents  -n .:../inet/src/ omnetpp.ini \
&&./out/gcc-release/exam_project  -u Cmdenv -r 0..19 -c TenStudentsNOCCTV  -n .:../inet/src/ omnetpp.ini \
&&./out/gcc-release/exam_project  -u Cmdenv -r 0..19 -c TwentyFiveStudentsNOCCTV  -n .:../inet/src/ omnetpp.ini \
&&./out/gcc-release/exam_project  -u Cmdenv -r 0..19 -c FiftyStudentsNOCCTV  -n .:../inet/src/ omnetpp.ini \
&&./out/gcc-release/exam_project  -u Cmdenv -r 0..19 -c HundredStudentsNOCCTV  -n .:../inet/src/ omnetpp.ini
