#!/usr/bin/ruby

# to be run with the changelog entries (uploads file)
# eg: cat uploads | ./terceiro.rb

package = cve = bug = nil

ARGF.each_line do |line|
  if line =~ /^(\w\S+)/
    package = $1
    cve = bug = nil
  end
  if line =~ /(CVE-\S*)/
    cve = " (" + $1 + ")"
  end
  if line =~ /Closes: (#\d+)/
    bug = $1
    puts "- #{bug} for #{package}" + (cve || "") + ".  "
  end
end
