 #!/bin/bash

#
# Use this script to tag a release
#
# Example: ./tag-edsc.sh 1.105.22
#

if [[ $1 =~ ([[:digit:]].[[:digit:]]+). ]]
then
  RELEASE=${BASH_REMATCH[1]} 

  echo 'Navigate to the project directory...'
  cd ~/Projects/earthdata-search

  echo 'Checking out master...'
  git checkout master

  echo -e '\nGetting latest...'
  git pull origin master

  echo -e "\nTagging EDSC Release $RELEASE at $1..."
  git tag -a "v$1" -m "Sprint $RELEASE release"

  echo -e '\nPushing the new tag...'
  git push origin "v$1"

  echo -e '\nDone!'

  echo -e '\n\n****'
  echo '*  Visit the address below to bump the release number.'
  echo '*  '
  echo '*  https://ci.earthdata.nasa.gov/deploy/config/configureDeploymentProjectVersioning.action?id=242712580'
  echo '****'
fi