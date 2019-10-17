#!/bin/sh
printf "name:(without .s)"
read Name
s=${Name}".s"
o=${Name}".o"
sde-as ${s} -g -o ${o}


