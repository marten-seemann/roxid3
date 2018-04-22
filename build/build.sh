#!/bin/bash
NPM="/usr/local/bin/npm"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script
ROXID_DIR="$DIR/../../roxid"

usage() {
  echo "Usage: $0 [-t TAG] [-n]"
  echo "Available options:"
  echo -e "\t-g\tdo NOT use Grunt to build assets. Should ONLY be used by build scripts for ROXIDx."
  echo -e "\t-h\tprint this message"
  echo -e "\t-t\tBuild the version with a specified git tag"
}

TAG=""
GRUNT=true

while getopts "d:ght:" opt; do
  case "$opt" in
    d)
      DEST=$OPTARG
      ;;
    g)
      GRUNT=false
      ;;
    h)
      usage
      exit 0
      ;;
    t)
      TAG=$OPTARG
      ;;
  esac
done

source $DIR/build_config.sh

cd build
rm -rf tmp productive
mkdir tmp
cd tmp

echo "Building ROXID One..."
mkdir roxid

if [[ -n "$TAG" ]]; then
  $ROXID_DIR/build/build.sh -g -t $TAG -d $DIR/tmp/roxid
else
  $ROXID_DIR/build/build.sh -g -d $DIR/tmp/roxid
fi


echo "Retrieving $NAME_HUMAN code from GIT repo..."
git clone --quiet ../.. "$NAME"_tmp
cd "$NAME"_tmp
if [[ -n "$TAG" ]]; then
  echo "Checking out commit tagged with: $TAG"
  git checkout --quiet tags/$TAG
fi

rm -rf .git .gitignore README.md build/
rm out/roxid
# dereference all symlinks
cd $DIR/tmp
cp -LR "$NAME"_tmp $NAME
rm -r "$NAME"_tmp

cd $DIR/tmp
LANGUAGES[0]='de'
LANGUAGES[1]='en'
echo "Processing language files..."
for LANG in "${LANGUAGES[@]}"
do
  ../merge_langfiles.rb roxid/application/views/roxid/$LANG/theme_options.php $NAME/application/views/$NAME/$LANG/theme_options.php > theme_options.php.tmp
  mv theme_options.php.tmp $NAME/application/views/$NAME/$LANG/theme_options.php
  if [ -f $NAME/application/views/$NAME/$LANG/lang.php ]; then
    ../merge_langfiles.rb roxid/application/views/roxid/$LANG/lang.php $NAME/application/views/$NAME/$LANG/lang.php > lang.php.tmp
    mv lang.php.tmp $NAME/application/views/$NAME/$LANG/lang.php
  fi
done

rm -r roxid/package.json roxid/Gruntfile.coffee roxid/grunt/
rm -r roxid/out/roxid/src/favicons
# delete LiveReload config in order to always have the same port in ROXID_mod
rm $NAME/application/views/$NAME/tpl/widget/livereload.tpl

cp -r $NAME/out/$NAME $NAME/out/roxid_mod roxid/out/
# merge image folders
cp -r roxid/out/$NAME/img/* roxid/out/roxid/img/
rm -r roxid/out/$NAME/img
mv roxid/out/roxid/img  roxid/out/$NAME
# end merge image folders
cp -r $NAME/package.json $NAME/Gruntfile.coffee $NAME/grunt roxid/
cp -r $NAME/application/views/$NAME/* roxid/application/views/roxid
cp -r $NAME/application/views/roxid_mod/* roxid/application/views/roxid_mod

cat $NAME/sql/install-base.sql $NAME/sql/update*.sql > $NAME/sql/install.sql
rm $NAME/sql/install-base.sql
for FILE in $NAME/sql/*.sql
do
  FILENAME=$(basename "$FILE")
  if [ -f roxid/sql/$FILENAME ]; then
    echo $'\n\n\n' >> roxid/sql/$FILENAME
    cat $NAME/sql/$FILENAME >> roxid/sql/$FILENAME
  else
    cp $NAME/sql/$FILENAME roxid/sql/
  fi
done
mv roxid/application/views/roxid roxid/application/views/$NAME

cat roxid/application/views/$NAME/theme.php | grep -v parentTheme | grep -v parentVersions | grep -v "/inc/versions.php" > roxid/application/views/$NAME/theme.php.tmp
mv roxid/application/views/$NAME/theme.php.tmp roxid/application/views/$NAME/theme.php



echo "Copying logo, wallpaper and favicon from $NAME_HUMAN to ROXID_mod"
cp $NAME/out/$NAME/src/favicons/favicon.png roxid/out/roxid_mod/src/favicons/
cp $NAME/out/$NAME/img/logo.png $NAME/out/$NAME/img/wallpaper.jpg $NAME/out/$NAME/img/logo_email.png $NAME/out/$NAME/img/pdf_logo.jpg roxid/out/roxid_mod/img

echo "Doing replacements in SQL files..."
cd $DIR/tmp/roxid/sql
for FILE in `ls *.sql`
do
  sed "s/'theme:roxid'/'theme:$NAME'/g" $FILE | sed "s/roxid\./$NAME./g" > tmp.sql
  mv tmp.sql $FILE
done

cd $DIR/tmp
rm -r $NAME

# install bower modules
cd $DIR/tmp/roxid/out/$NAME
bower install --quiet --production
cd ../..


if [ "$GRUNT" = true ]; then
  cd $DIR/tmp/roxid
  echo "Installing required NPM modules for Grunt..."
  # use node_modules from dev version. provides a significant speedup of built process
  cp -r $DIR/../node_modules .
  npm install
  echo "Running Grunt..."
  grunt all
  rm -rf node_modules .sass-cache
fi

echo "Removing ROXID Grunt config and replacing it by ROXID_mod Grunt config"
rm -r grunt Gruntfile.coffee
sed 's/grunt_mod\//grunt\//g' Gruntfile_mod.coffee > Gruntfile.coffee
rm Gruntfile_mod.coffee
mv grunt_mod grunt


if [ "$GRUNT" = true ]; then
  echo "Installing required NPM modules for Grunt (for ROXID_mod)..."
  # use node_modules from dev version. provides a significant speedup of built process
  cp -r $DIR/../node_modules .
  npm install
  echo "Running Grunt (for ROXID_mod)..."
  grunt
  rm -rf node_modules .sass-cache
fi

cd $DIR
mv tmp/roxid productive
rm -r tmp
