#! /usr/bin/ruby

ela = ARGV[0]
package = version = nil
cve = []
fix = ""

file = File.read('ela')
file.each_line do |line|
  if line =~ /package/
    package = line.split(': ', 2).last.chomp
  end

  if line =~ /version/
    version = line.split(': ', 2).last.chomp
  end

  cve << line.scan(/CVE-\d+-\d+/)
end

cve.flatten!
cve.uniq!

size = cve.length

if size == 1
  fix = "[#{cve[0]}](https://security-tracker.debian.org/tracker/#{cve[0]})"
elsif size == 2
  fix = "[#{cve[0]}](https://security-tracker.debian.org/tracker/#{cve[0]}) " \
        "and [#{cve[1]}](https://security-tracker.debian.org/tracker/#{cve[1]})"
elsif size > 2
  0.upto size-2 do |i|
    fix << "[#{cve[i]}](https://security-tracker.debian.org/tracker/#{cve[i]}), "
  end
  fix << "and [#{cve[size-1]}](https://security-tracker.debian.org/tracker/#{cve[size-1]})"
else
  puts "Some error occured. 0 elements in CVE array."
end

sentence1 = "- Issued [ELA #{ela}-1](), fixing #{fix}, for " \
            "[#{package}](https://tracker.debian.org/pkg/#{package}).  "
sentence2 = "  For Debian 8 jessie, these problems have been fixed in version #{version}."

puts sentence1
puts sentence2
