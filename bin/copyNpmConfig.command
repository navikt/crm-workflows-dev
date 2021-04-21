#!/bin/bash

# run to copy all npm config from this dev repo to all other repos

cd -- "$(dirname "$BASH_SOURCE")"
cd ../..
tput reset

declare -a folders=( "crm-arbeidsforhold" "crm-arbeidsgiver-base" "crm-arbeidsgiver-integration" "crm-arbeidsgiver-kurs" "crm-arbeidsgiver-template" "crm-arbeidsgiver-tiltaksarrangor" "crm-community-base" "crm-nks-base" "crm-platform-access-control" "crm-platform-admin" "crm-platform-base" "crm-platform-email-scheduling" "crm-platform-integration" "crm-platform-reporting" "crm-platform-unpackaged" "crm-platform-user-access-management" "crm-shared" "crm-shared-activity-timeline" "crm-workflows-base" )
branch="autoNpmUpdate"

for folder in ${folders[@]}; do
	
    cd $folder
	echo "Folder: "$folder

	git stash >/dev/null 2>&1
	git checkout master >/dev/null 2>&1
	git stash >/dev/null 2>&1
	git pull >/dev/null 2>&1

    git push origin --delete $branch >/dev/null 2>&1
    git branch -D $branch >/dev/null 2>&1
    git checkout -b $branch >/dev/null 2>&1

	cp ../crm-workflows-dev/{.eslintignore,.eslintrc.json,.prettierignore,.prettierrc,jest-sa11y-setup.js,jest.config.js,package.json,package-lock.json,ruleset.xml} . >/dev/null 2>&1
    npm install >/dev/null 2>&1
    npm update --force >/dev/null 2>&1

	git add . >/dev/null 2>&1
	git commit -m "[AUTO] Updated NPM" >/dev/null 2>&1

    if npx prettier --write . >/dev/null 2>&1 ; then
        git add . >/dev/null 2>&1
        git commit -m "[AUTO] Re-formatted all files" >/dev/null 2>&1
        git push origin $branch >/dev/null 2>&1
        open "https://github.com/navikt/$folder/compare/$branch?expand=1"
        git checkout master >/dev/null 2>&1
    else
        echo "ERROR!!!"
        echo "ERROR!!!"
        echo "ERROR!!!"
    fi

	cd ..
	echo ""
done