require 'bundler/setup'
require 'rubygems'
require 'samurai'
require 'httparty'

# data is an Array
def eysearch(data)
  query = data.join(' ')
  puts query
  say "searching for #{query}.."
  result=`eysearch --extended #{query} 2>&1`
  regex = /tm\d+-s0+\d+/
  result.to_s.each do |r|
    if regex.match(r)
      vm = regex.match(r)
      output = HTTParty.get("http://ec2-50-16-52-4.compute-1.amazonaws.com/vm/#{vm}.json")
      hash = output.to_hash
      puts "#{hash["name"]} has RAM: #{hash["ram"]} and DISK: #{hash["disk"]}"
    end
  end

  unless result.split("\n").size > 2
    say "no results found for 'eysearch #{query}'"
    return
  end
end

data = ["teamsport"]

eysearch(data)
