#!/bin/bash
if [ $# -eq 0 ]; then
  echo "No config number provided (1,2,3,4)."
  exit
fi
if [ -z $2 ]; then
  echo "No number of runs provided."
  exit
fi

if [[ "$1" -eq 1 ]]; then
  for (( i=0; i<=$2; i++ )); do
        ./exam_project -r $i -u Cmdenv -c TenStudents -n ../simulations:.:../../../inet/examples:../../../inet/src -l ../../../inet/src/inet omnetpp.ini
  done
fi

if [[ "$1" -eq 2 ]]; then
  for (( i=0; i<=$2; i++ )); do
        ./exam_project -r $i -u Cmdenv -c TwentyFiveStudents -n ../simulations:.:../../../inet/examples:../../../inet/src -l ../../../inet/src/inet omnetpp.ini
  done
fi

if [[ "$1" -eq 3 ]]; then
  for (( i=0; i<=$2; i++ )); do
        ./exam_project -r $i -u Cmdenv -c FiftyStudents -n ../simulations:.:../../../inet/examples:../../../inet/src -l ../../../inet/src/inet omnetpp.ini
  done
fi

if [[ "$1" -eq 4 ]]; then
  for (( i=0; i<=$2; i++ )); do
        ./exam_project -r $i -u Cmdenv -c HundredStudents -n ../simulations:.:../../../inet/examples:../../../inet/src -l ../../../inet/src/inet omnetpp.ini
  done
fi

echo "Done."
