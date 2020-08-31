#!/bin/sh -l

echo "" > rmcmd

if [ "$INPUT_IGNORESSL" -eq "1" ]
then
    echo -e "set ftp:ssl-allow no;" >> rmcmd
fi

echo -e "set ftp:list-options -a" >> rmcmd
echo -e "user $INPUT_USER \"$INPUT_PASSWORD\"" >> rmcmd
echo -e "cd \"$INPUT_WORKINGDIR\"" >> rmcmd
echo -e "glob -a rm -r *" >> rmcmd
echo -e "quit;\n" >> rmcmd

lftp  ftp://$INPUT_HOST < rmcmd
