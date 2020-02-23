#! /usr/bin/zsh

DLA=$1
CVE=`cat dla | grep CVE | cut -d':' -f2`
package=`cat dla | grep Package | cut -d':' -f2`
version=`cat dla | grep Version | cut -d':' -f2`
jessie=`cat dla | grep Jessie`

cat << EOF >> *.markdown
- Issued DLA $DLA-1, fixing ${CVE:1}, for ${package:1}.  
  $jessie ${version:1}.  

EOF
