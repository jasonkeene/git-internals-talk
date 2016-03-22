#doitlive shell: /bin/bash
#doitlive prompt: minimal_color
#doitlive commentecho: true

#
#to view the dag just use `git log --graph`
git lg

#
#lets view the conent of a commit again
git cat-file -p HEAD

#
#we can walk the dag by following the parent links
git cat-file -p 8ee01571c3d40ea817cae075e7de856117bac19c
#this commit has more than one parent (a merge commit)

#
#again, using a single sha1 we are able to cryptographically verify the contents of the entire dag
