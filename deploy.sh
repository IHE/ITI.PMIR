#!/usr/bin/env sh

# abort on errors
set -e

# build
sushi .

# navigate into the build output directory
cd build
./_genonce.sh
cd output

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:IHE/ITI.PMIR.git master:gh-pages

cd -
