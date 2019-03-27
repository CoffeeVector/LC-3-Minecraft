#!/bin/bash
len=$(ls -l ./worlds/ | wc -l)
world=$(ls -l ./worlds/ | awk '{ if (NR !=1) {print $9}}' | awk '/^[^_]+$/{print $0}' | rofi -dmenu -lines $len-i -p "Worlds")
if [ "$world" != "" ]; then
	rm -r world
	rm -r world_nether
	rm -r world_the_end
	ln -s ./worlds/$world world
	ln -s ./worlds/"$world"_nether world_nether
	ln -s ./worlds/"$world"_the_end world_the_end
	#ln -s world ./worlds/$world
	#ln -s world_nether ./worlds/$world _nether
	#ln -s world_the_end ./worlds/$world _the_end
fi
