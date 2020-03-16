################################################################################
# @Author: carrgan
# @Date:   2020/03/16
# @Email:  Carrgan@outlook.com
# @Filename: cache_cleaner_macos.sh
# @Last modified by:   carrgan
# @Last modified time: 2020/03/16
# !/bin/bash
# Version: V0.1
# @Program:
#			DEL Application Cache
################################################################################

function PrintDir(){
	if [ -n "${2}" ]; then
		for i in ${*}; do
			raw=`echo ${i} | sed 's/[####][####]*/ /g'`
			echo ${raw}
		done
	fi
}

function DelFile() {
	if [ -n "${2}" ]; then
		dir_f=`echo ${1} | sed 's/[---][---]*/\ /g'`
		for i in ${*}; do
			if [ ${i} != ${1} ]; then
				raw=`echo ${i} | sed 's/[####][####]*/\ /g'`
				rm -rf "$dir_f${raw}"
			fi
		done
	fi
}

if [ -n "$1" ]; then
		# Replace spaces with #### and --- and _
		Pre=`ls /Users/carrgan/Library/Preferences/ | grep  $1 | sed 's/[ ][ ]*/####/g'`
		Support=`ls /Users/carrgan/Library/Application\ Support/ | grep $1 | sed 's/[ ][ ]*/####/g'`
		CrashReporter=`ls /Users/carrgan/Library/Application\ Support/CrashReporter/ | grep $1 | sed 's/[ ][ ]*/####/g'`
		Containers=`ls /Users/carrgan/Library/Containers/ | grep $1 | sed 's/[ ][ ]*/####/g'`
		State=`ls /Users/carrgan/Library/Saved\ Application\ State/ | grep $1 | sed 's/[ ][ ]*/####/g'`
		Caches=`ls /Users/carrgan/Library/Caches/ | grep $1 | sed 's/[ ][ ]*/####/g'`
		Containers=`ls /Users/carrgan/Library/Containers/ | grep $1 | sed 's/[ ][ ]*/####/g'`
		Logs=`ls /Users/carrgan/Library/Logs/ | grep $1 | sed 's/[ ][ ]*/####/g'`

		PrintDir /Users/carrgan/Library/Preferences/: ${Pre}
		PrintDir /Users/carrgan/Library/Application_Support/: ${Support}
		PrintDir /Users/carrgan/Library/Containers/: ${Containers}
		PrintDir /Users/carrgan/Library/Application_Support/CrashReporter/: ${CrashReporter}
		PrintDir //Users/carrgan/Library/Saved_Application_State/: $State
		PrintDir /Users/carrgan/Library/Caches/: $Caches
		PrintDir /Users/carrgan/Library/Containers/: $Containers
		PrintDir /Users/carrgan/Library/Logs/: $Logs

		if [ -n "$Pre" ] || [ -n "$Support" ] || [ -n "$CrashReporter" ] ||
		 	 [ -n "$Containers" ] || [ -n "$State" ] || [ -n "$Cache" ] ||
			 [ -n "$Containers" ]|| [ -n "$Logs" ]; then
			read -p "Do you want to del? y/n: " y_n
			if [ ${y_n} == y ] || [ ${y_n} == Y ]; then
				DelFile "/Users/carrgan/Library/Preferences/" ${Pre}
				DelFile "/Users/carrgan/Library/Application---Support/" ${Support}
				DelFile "/Users/carrgan/Library/Containers/" ${Containers}
				DelFile "/Users/carrgan/Library/Application---Support/CrashReporter/" ${CrashReporter}
				DelFile "/Users/carrgan/Library/Saved---Application---State/" $State
				DelFile "/Users/carrgan/Library/Caches/" $Caches
				DelFile "/Users/carrgan/Library/Containers/" $Containers
				DelFile "/Users/carrgan/Library/Logs/" $Logs
			else
				echo "Did Nothing."
			fi
		else
			echo "No Cache."
		fi
else
		echo "You need to enter a parameter！"
fi
