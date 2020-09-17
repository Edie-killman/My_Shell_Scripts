#!/bin/bash
if [ "$USER" != "root" ] ; then
	echo '=-=-=-=-=-=-=-=-=-=-='
	echo "|     Need Root!    | "
	echo '=-=-=-=-=-=-=-=-=-=-='
fi
if [ "$1" == "-i" ] ; then
	echo ""
        echo "=-=-=-=-=-Options-=-=-=-=-="
        ls *.sh
        echo "=-=-=-=-=-=-=-=-=-=-=-=-=-="
        echo ""
	echo "Type the Script name you want to install as command:"
	read script
	dir=$(pwd)
	command=$(echo  $script | sed 's/...$//' )
	cd /opt
	mkdir $command
	cd $dir
	cp $script /opt/$command
	cd ~
	echo alias $command="'"bash /opt/$command/$script"'" >> .bashrc
	cd $dir
	echo "All Done:01"
	echo "Restart the console to command works."
	exit
fi
if [ "$1" == "-ic" ] ; then
	echo ""
	echo "=-=-=-=-=-Options-=-=-=-=-="
	ls *.sh
	echo "=-=-=-=-=-=-=-=-=-=-=-=-=-="
	echo ""
        echo "Type the Script name you want to install as command:"
        read script
        echo "What command do you want assing in to it?:"
        read command
        dir=$(pwd)
        cd /opt
        mkdir $command
        cd $dir
        cp $script /opt/$command
        cd ~
        echo alias $command="'"bash /opt/$command/$script"'" >> .bashrc
        cd $dir
        echo "All Done:02"
	echo "Restart the console to command works."
	exit
fi
echo " ./install -i : to install a script as command"
echo " ./install -ic : to install a script as command with another name for command"
