#!/bin/sh

LANG=en_US

DSMC=`which dsmc`
YESTERDAY=`date +%Y-%m-%d -d yesterday`

# Select the directory containing the most important data and/or files which change a lot
DIRS="/var/www/ /var/lib/mysql/"

echo "Using $DSMC"

for DIR in $DIRS
do
        echo ""
        echo "---------------------------------------------------------------"
        echo "Querying for files of directory $DIR backed up after $YESTERDAY"
        echo "CMD: $DSMC query backup -date=3 -fromdate=$YESTERDAY -filesonly -subdir=yes $DIR"

        echo ""
        $DSMC query backup -date=3 -fromdate="$YESTERDAY" -filesonly -subdir=yes "$DIR"
done

exit 0