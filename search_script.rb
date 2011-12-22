require 'bundler/setup'
require 'rubygems'
require 'samurai'

# data is an Array
def eysearch(data)
  query = data.join(' ')
  puts query
  say "searching for #{query}.."
  result=`eysearch --extended #{query} 2>&1`
  say result
  unless result.split("\n").size > 2
    say "no results found for 'eysearch #{query}'"
    return
  end
end

data = ["tst", "media"]
eysearch(data)
