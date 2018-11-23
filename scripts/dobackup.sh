#!/bin/sh

# User that rsync will connect as
# Are you sure that you want to run as root, though?
USER="carlos"
# Destination host machine name
DEST="althalen"

# Base directory to copy from on the source machine.
SRCDIR=$1
if [ -z "$SRCDIR" ]
then
    echo "usage: sh $0 <SRCDIR>"
    exit
fi

# Log file
LOGFILE="/tmp/dobackup.log"

# Directory to copy to on the destination machine.
DESTDIR="/Volumes/BIGVAULT/carlos"

# excludes file - Contains wildcard patterns of files to exclude.
# i.e., *~, *.bak, etc.  One "pattern" per line.
# You must create this file.
#EXCLUDES="$BIN_HOME/respaldar.excludes"

# includes file - Contains wildcard patterns of files to include.
# i.e., *~, *.bak, etc.  One "pattern" per line.
#INCLUDES="$BIN_HOME/respaldar.includes"

# files - Contains exact list of files to transfer.
#         The --relative (-R) option is implied, which preserves the path information that is specified for each item
#         in the file (use --no-relative or --no-R if you want to turn that off).
#         The --dirs (-d) option is implied, which will create directories specified in the list on the destination rather
#         than noisily skipping them (use --no-dirs or --no-d if you want to turn that off).
#         The --archive (-a) option's behavior does not imply --recursive (-r), so specify it explicitly, if you want it.
#         These side-effects change the default state of rsync, so the position of the --files-from option on the command-line
#         has no bearing on how other options are parsed (e.g. -a works the same before or after --files-from, as does --no-R
#         and all other options).
FILES="$HOME/.dobackup.files"

# Options.
# --human-readable (-h) output numbers in a human-readable format
# --archive (-a) archive mode; equals -rlptgoD, means you want recursion and preserve almost everything
# --recursive (-r) This tells rsync to copy directories recursively
# --delete delete from the receiving side the files which are not on the
#          sending side, only works if the whole dir was sent, not like /dir/*
# --verbose (-v) increase verbosity
# --compress (-z) compress file data during the transfer
# --update (-u)skip files that are newer on the receiver
# --quiet decreases the amount of information given during the transfer
# --files-from=FILE read exact list of files to transfer from FILE
# --exclude-from=FILE read exclude patterns from FILE
# --include-from=FILE read include patterns from FILE (patterns that will not be excluded)
# --progress show progress during transfer
# --log-file=FILE log what we're doing to the specidifed FILE
# --whole-file copy files whole (w/o delta-xfer algorithm)
# See man rsync for other options.

# For testing.  Only displays what rsync *would* do and does no actual copying.
#OPTS="-n -vv -u -a --rsh=ssh --exclude-from=$EXCLUDES --stats --progress"
# Does copy, but still gives a verbose display of what it is doing
#OPTS="-v -u -a --rsh=ssh --exclude-from=$EXCLUDES --stats"
# Copies and does no display at all.
#OPTS="--archive --update --rsh=ssh --exclude-from=$EXCLUDES --quiet"
# Copies and does no display at all.
#OPTS="--human-readable --archive --verbose --compress --update --exclude-from=$EXCLUDES"
OPTS="--archive --recursive --progress --compress --delete --human-readable --update --quiet --files-from=$FILES --log-file=$LOGFILE"

# May be needed if run by cron?
export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/media/data/bin:$HOME/bin

# Only run rsync if $DEST responds.
VAR=`ping -s 1 -c 1 $DEST > /dev/null; echo $?`
if [ $VAR -eq 0 ]; then
    echo "`date` :backup process initialized" >> $LOGFILE
    rsync $OPTS $SRCDIR $USER@$DEST:$DESTDIR
    echo "`date` :backup process done" >> $LOGFILE
else
    echo "`date` :$DEST does not respond" >> $LOGFILE
fi
