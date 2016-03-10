#!/usr/bin/sh
# From https://github.com/yianwillis/vimcdoc.git
#
# This script is used to update the repo.

function Remove {
  rm -rf doc
  rm -rf plugin
  rm -rf syntax
}

isUpdated=0
if [ ! -f "VERSION" ]; then
  echo "Init project ..."
  isUpdated=1
elif [ `echo .vimdoc/VERSION` != `echo VERSION` ]; then
  echo "Updating project ..."
  isUpdated=1
  Remove
fi

if [ "$isUpdated" = "1" ]; then
  cp .vimdoc/VERSION VERSION
  cp -rf .vimdoc/doc doc

  mkdir plugin
  cp .vimdoc/vimcdoc.vim plugin/

  mkdir syntax
  cp .vimdoc/help_cn.vim syntax/

  cp .vimdoc/ChangeLog ChangeLog
  cp .vimdoc/dict.txt dict.txt
fi
