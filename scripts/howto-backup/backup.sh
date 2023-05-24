#!/bin/bash

echo "Starting to Backup"

sourcefile="/media/sangubabes/Drive E/Shell-Scripting101/scripts/howto-backup/source-backup"
destination="/media/sangubabes/Drive E/Shell-Scripting101/scripts/howto-backup/tar-backup"
echo "The file being backedup is $sourcefile"
echo "The file is being backedup at $destination"

#create desitination directory if it doesn't exits
mkdir -p "$destination"

#we will add timestamp to backup files daily

current_timestamp="$(date "+%Y-%m-%d-%H-%M-%S")"
#giving name to our backupfile in .tgz

backupfilename="$destination/$(date "+%Y-%m-%d-%H-%M-%S").tgz"

echo $backupfilename


#we use tar command with c,z & z flag to create a backup of sourcefile and store it with at name stored in backupfilename
tar czf "$backupfilename" --absolute-names "$sourcefile"

if [ $? -eq 0 ]
then
	echo "Backup completed successfully. The backup file is saved as: $backupfilename"
else
	echo "Backup failed. Please check the error messages."
fi

echo "The time of backup is $current_timestamp"



