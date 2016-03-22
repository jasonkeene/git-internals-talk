#doitlive shell: /bin/bash
#doitlive prompt: minimal_color
#doitlive commentecho: true

#
#lets go into the mysterious .git directory
cd .git
ls -la

#
#objects are stored under the objects dir
cd objects
ls -la

#
#the first byte (in hex) is taken from the sha as a directory name
#lets look up our latest commit object
git log -1
cat a4/675b0821d40743ff03424456da9b5ce8de6598

#
#this doesn't look like the result we saw when using git cat-file
git cat-file -p a4675b0821d40743ff03424456da9b5ce8de6598

#
#all objects are compressed with zlib
openssl zlib -d -in a4/675b0821d40743ff03424456da9b5ce8de6598

#
#each object is prefixed with "type length\0"
openssl zlib -d -in a4/675b0821d40743ff03424456da9b5ce8de6598 | wc -c

#
#we are 11 bytes off of the length of the content since the prefix in this
#case is 11 bytes
#

#
#you can see once we decompress the object we simply do a plain sha1 to get
#the hash
openssl zlib -d -in a4/675b0821d40743ff03424456da9b5ce8de6598 | shasum

#
#lets find a blob object
git hash-object ../../docs/using_separate_release.md
openssl zlib -d -in ca/114ffe3fe75c3253a090215349a26c1b2dc683 | head

#
#here is a tag object
openssl zlib -d -in 12/50876c6ab487f4a93ea32aeb38877bec188427

#
#finally lets look at a tree object (this one is a bit strange)
git cat-file -p HEAD
openssl zlib -d -in 29/50fc132a6b7dcd7169d1db38979a32f21fce2a

#
#
#again, this doesn't look like the result we saw when using git cat-file
git cat-file -p 2950fc132a6b7dcd7169d1db38979a32f21fce2a

#
#lets look at a hex dump to see what's going on
openssl zlib -d -in 29/50fc132a6b7dcd7169d1db38979a32f21fce2a | od -xa

#
#git also stores objects in pack files which are compressed deltas between
#files that are similar, you can run `git gc` to pack your objects into
#compressed form and run `git unpack-objects` to unpack them again
