#!/usr/bin/env bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     OS=Linux;;
    Darwin*)    OS=Mac;;
    CYGWIN*)    OS=Cygwin;;
    MINGW*)     OS=MinGw;;
    *)          OS="UNKNOWN:${unameOut}"
esac

IP="8.8.8.8"
DURATION=4

if [ "${OS}" == "Mac" ]; then
	ping $IP -t $DURATION --apple-time | ./ping_to_csv.rb
elif [ "${OS}" == "Linux" ]; then
	ping $IP -D -t $DURATION | ./ping_to_csv.rb
fi

echo "Goodbye"
