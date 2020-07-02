#! /usr/bin/zsh

# dla is the file which is issues and sent to d-lts-announce@l.d.o.
# *.markdown is the blog file to which the data goes for the blog.

DLA=$1
CVE=`cat dla | grep CVE | cut -d':' -f2`
package=`cat dla | grep Package | cut -d':' -f2`
version=`cat dla | grep Version | cut -d':' -f2`
jessie=`cat dla | grep Jessie`

cat << EOF >> *.md
- Issued [DLA $DLA-1](), fixing [${CVE:1}](https://security-tracker.debian.org/tracker/${CVE:1}), for [${package:1}](https://tracker.debian.org/pkg/${package:1}).  
  $jessie ${version:1}.  

EOF
