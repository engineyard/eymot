require 'bundler/setup'
require 'rubygems'
require 'samurai'

# data is an Array
def eysearch(data)
  query = data.join(' ')
  puts query
  say "searching for #{query}.."
  result = IO.popen(`eysearch --extended #{query} 2>&1`)
  puts result
  line = result.gets
  puts line
  if line =~ /tm\d+-s0{2}\d+/
    puts line
  end
#  unless result.split("\n").size > 2
#    say "no results found for 'eysearch #{query}'"
#    return
#  end
end

data = ["teamsport"]
eysearch(data)
