#!/bin/bash
#
# generate a Markdown version of a word document. Goes in separate folder, since
# images are extracted and converted as well (separate folder avoids naming clashes).
#
# REQUIREMENTS: pandoc
#
#
# with pandoc
#  --extract-media=[media folder]
#
# USAGE:
#
# docx2md.sh a
#
# This will generate markdown files in a subfolder defined in `ROOTDIR`. Pictures will be moved to `PUBLICDIR`.
# ```

which pandoc > /dev/null
rc=$?
if [[ $rc != 0 ]]; then
  echo "FATAL missing pandoc. You can install with 'brew install pandoc' or similar"
  exit 9
fi

if [ -z "$1" ]; then
  echo "Usage:"
  echo ""
  echo "  docx2md.sh a"
  exit 13
fi

readonly ROOTDIR="/Users/gijtenbeek/rr/tendr/app/views/bids/"
readonly PUBLICDIR="/Users/gijtenbeek/rr/tendr/public/media/"

for d in */ ; do
  mkdir $ROOTDIR$d
  mkdir $PUBLICDIR$d

  for fullfile in $d*; do
    filename=$(basename "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"
    re='^[0-9]+$'

    if [[ $filename =~ $re ]] ; then

      mkdir -p $d"pandoc-output"
      pandoc -f docx -t markdown --extract-media=$d"pandoc-output" -o $ROOTDIR"$d"_"$filename.html.md" "$fullfile"
      gsed -i -r "s/([a-zA-Z0-9_-]+)\/pandoc-output\/media\/([a-zA-Z0-9]+)/\/media\/\1\/\2/" $ROOTDIR"$d"_"$filename.html.md"
    fi
  done
done

for d in */ ; do
   cp -r $PWD"/"$d"pandoc-output/media/." $PUBLICDIR$d
done
