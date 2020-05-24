#! /usr/bin/ruby

# can be used to install gems listed in Gemfile.lock.

x = File.open("Gemfile.lock")
x.each_line do |i|
  i.gsub!(/^\s*/, "")
  gem = i[/[^\s\-][\w\-]+[\w\-]/]
  version = i[/\d\.\d.\d/]
  if version.nil?
    system("ruby-standalone gem install #{gem}")
  else
    system("ruby-standalone gem install #{gem} -v #{version}")
  end
end
