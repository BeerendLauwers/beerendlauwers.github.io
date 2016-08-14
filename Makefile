CNAME := beerendlauwers.be
REPO := git@github.com:beerendlauwers/beerendlauwers.github.io.git

EXE := /home/ubuntu/.local/bin/site

all:	build
	@true

build:	${EXE}
	${EXE} build

# Deploy _site to Github Pages
deploy:
	echo ${CNAME} > _site/CNAME
	rm -rf _site/.git
	cd _site && git init && git add .
	cd _site && git config user.email "nobody@circleci.com"
	cd _site && git config user.name CircleCI
	cd _site && git commit -m "Generated on `date`"
	cd _site && git remote add origin ${REPO}
	cd _site && git push -f origin master:master