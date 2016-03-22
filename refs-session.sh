#doitlive shell: /bin/bash
#doitlive prompt: minimal_color
#doitlive commentecho: true

cd .git
ls -la

#
#HEAD is a symbolic ref which means it points to another ref
cat HEAD

#
#all the other refs are stored under .git/refs
cd refs
ls -la

#
#heads are branches
cd heads
ls -la
cat develop
cat master

#
#remote refs are read only refs that track the remote's refs
cd ../remotes
ls -la
cd origin
ls -la
cat develop
cat master
cat release-elect
cat HEAD

#
#the last type of ref is a lightweight tag
cd ../../
ls -la
cd tags
ls -la

#
#we have no tags so lets create one
git tag --list
git tag demo-tag HEAD
git tag --list
ls -la
cat demo-tag
rm demo-tag
git tag --list

#
#there is a reflog located in .git/logs that stores changes to refs
cd ../..
ls -la
cd logs
ls -la
cat HEAD

cd refs
ls -la
cd heads
ls -la
cat develop
cat master

#
#you can easily view the reflog for your current branch by using `git reflog`
cd ../../../..
git reflog

git co develop
git reflog

#
#this is useful as it will keep pointers to objects that would other wise get
#garbage collected and allows you to quickly revert mishaps
#

#
#you may know that you can checkout any sha1 as a detached head
git log -1
git co a4675b0821d40743ff03424456da9b5ce8de6598
git reflog

#
#now HEAD just contains the sha1 you checked out
cat .git/HEAD

#
#this can be useful to keep a temporary reference to a commit object
git co master

