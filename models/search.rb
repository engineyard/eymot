class Search
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  
  def eysearch(search)
    query = search.join(' ')
    say "searching for #{query}.."
    result=`bundle exec eysearch --extend #{query} 2>&1`
    regex = /tm\d+-s0+\d+/
    result.to_s.each do |r|
      if regex.match(r)
        vm = regex.match(r)
        output = HTTParty.get("http://ec2-50-16-52-4.compute-1.amazonaws.com/vm/#{vm}.json")
        hash = output.to_hash
        puts "#{hash["name"]} has RAM:#{hash["ram"]} and DISK:#{hash["disk"]}"
      end
    end
  end
end
