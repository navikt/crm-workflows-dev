#!/bin/bash

# run to copy all workflows from this dev repo to all other repos

# set which folder you're running from
cd -- "$(dirname "$BASH_SOURCE")"
cd ../..
tput reset

# define which repos to copy workflows to
declare -a folders=( "crm-arbeidsforhold" "crm-arbeidsgiver-base" "crm-arbeidsgiver-integration" "crm-arbeidsgiver-kurs" "crm-arbeidsgiver-template" "crm-arbeidsgiver-tiltaksarrangor" "crm-community-base" "crm-nks-base" "crm-platform-access-control" "crm-platform-admin" "crm-platform-base" "crm-platform-email-scheduling" "crm-platform-integration" "crm-platform-reporting" "crm-platform-user-access-management" "crm-shared" "crm-shared-activity-timeline" "crm-workflows-base" )
branch="autoWorkflowsUpdate"

# remove mac files
rm -f crm-workflows-dev/.github/workflows/.DS_Store
rm -f crm-workflows-dev/.github/.DS_Store

# merge directly to master branches on all repos except crm-hot
for folder in ${folders[@]}; do
	cd $folder
	echo "Folder: "$folder

	git stash >/dev/null 2>&1
	git checkout master >/dev/null 2>&1
	git stash >/dev/null 2>&1
	git pull >/dev/null 2>&1

	cp ../crm-workflows-dev/.github/workflows/* .github/workflows/

	git add .github/workflows/* >/dev/null 2>&1
	git commit -m "[AUTO] Updated Workflows" >/dev/null 2>&1
	git push origin master

	cd ..
	echo ""
done


# Create PR for crm-hot
############################

folder="crm-hot"

cd $folder
echo "Folder: "$folder

git stash >/dev/null 2>&1
git checkout master >/dev/null 2>&1
git stash >/dev/null 2>&1
git pull >/dev/null 2>&1

git push origin --delete $branch >/dev/null 2>&1
git branch -D $branch >/dev/null 2>&1
git checkout -b $branch >/dev/null 2>&1

cp ../crm-workflows-dev/.github/workflows/* .github/workflows/
git add .github/workflows/* >/dev/null 2>&1
git commit -m "[AUTO] Updated Workflows" >/dev/null 2>&1
git push origin $branch
open "https://github.com/navikt/$folder/compare/$branch?expand=1" # opens PR