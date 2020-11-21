#! /usr/bin/ruby

literal_string = ARGV[0]
list_of_files = Dir["**/*"].reject { |f| File.directory?(f) }.select { |f| File.exist?(f) }

start = Time.now
0.upto list_of_files.length-1 do |i|
  file_name = list_of_files[i]
  # binding.irb
  if file_name.empty?
    next
  else
    File.open file_name do |file|
      file.each_line do |line|
        line = line.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
        if line =~ /#{literal_string}/
          # binding.irb
          puts "#{file_name}: #{line}"
        end
      end
    end
  end
end
finish = Time.now

# for benchmarking
# puts "Time taken: #{finish-start}"
# puts "Files inspected: #{list_of_files.length}"
