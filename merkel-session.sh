#doitlive shell: /bin/bash
#doitlive prompt: minimal_color
#doitlive commentecho: true

#
#lets play with loggregator
cd ~/workspace/loggregator
ls -la
cd docs
ls -la

#
#we can walk the merkel tree down from our lastest commit
git log -1

#
#lets cat out the contents of our commit
git cat-file -p a4675b0821d40743ff03424456da9b5ce8de6598

#
#we can see how the contents is identified by it's hash
git cat-file -p a4675b0821d40743ff03424456da9b5ce8de6598 | git hash-object -t commit --stdin

#
#each commit has a single tree, let's see it's content
git cat-file -p 2950fc132a6b7dcd7169d1db38979a32f21fce2a

#
#and again the content is identified by it's hash
git cat-file tree 2950fc132a6b7dcd7169d1db38979a32f21fce2a | git hash-object -t tree --stdin

#
#the docs directory is represented as a sub tree
git cat-file -p dc0420d41b873d80fb9afdab35ecd9f99206d852

#
#and files are known as blobs
git cat-file -p ca114ffe3fe75c3253a090215349a26c1b2dc683 | head

#
#finally the file's content is identified by it's hash
git hash-object using_separate_release.md

#
#using a single sha1 we are able to cryptographically verify the contents of our entire source tree
