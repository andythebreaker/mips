#!/bin/sh
printf "name:(without .s)"
read Name
s=${Name}".s"
o=${Name}".o"
i=${Name}".image"
c=${Name}".conv"
t=${Name}".txt"
sde-as ${s} -g -o ${o}
sde-ld ${o} -Ttext 0x0000800 -o ${i}
sde-conv ${i} -o ${c}
sde-objdump ${i} -D > ${t}
printf "You have finished converting..."
ls
