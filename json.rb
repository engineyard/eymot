require 'rubygems'
require 'httparty'

print "What is the VM number? "
vm = $stdin.gets.chomp
output = HTTParty.get("http://ec2-50-16-52-4.compute-1.amazonaws.com/vm/#{vm}.json")
hash = output.to_hash
puts hash["name"]
puts hash["ram"]
puts hash["disk"]
