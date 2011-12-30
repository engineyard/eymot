require 'bundler/setup'
require 'rubygems'
require 'samurai'

# data is an Array
def eysearch(data)
  query = data.join(' ')
  puts "searching for #{query}.."
  result = File.open("output.txt", "w+")
  result << %x{eysearch --extended #{query}}
  result.close
  file = File.read("output.txt")
  file.each do |f|
    match = f.scan(/tm\d+-s0+\d+/)
    puts match
  end
  # handle proper handling of searches that result in no result
  # search file and if no data have the unless run
 if %x{wc -l '#{output.txt}'}.to_i <= 2
   puts "no results found for 'eysearch #{query}'"
   return
 end
end

data = ["blahblah"]
eysearch(data)
