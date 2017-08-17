#!/bin/bash

OUTPUT=./dist
BUNDLE_PATH="$OUTPUT/TypeScript.tmbundle"

if [ -e $BUNDLE_PATH ] ; then
	rm -r $BUNDLE_PATH
fi

pushd TypeScript-TmLanguage

git pull
#TODO should a build be run here?

popd

mkdir -p $BUNDLE_PATH/Preferences
mkdir -p $BUNDLE_PATH/Syntaxes

cp TypeScript-TmLanguage/*.tmPreferences $BUNDLE_PATH/Preferences
cp TypeScript-TmLanguage/*.tmLanguage $BUNDLE_PATH/Syntaxes
cp src/* $BUNDLE_PATH

pushd $OUTPUT

zip -r TypeScript.tmbundle.zip TypeScript.tmbundle

popd