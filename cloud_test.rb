require 'rubygems'
require 'fog'
require 'pp'

def ecloud
     # vcloud = ::Fog.modules.detect { |service| service == Vcloud }
     config = YAML.load_file(File.expand_path("~/.fog"))
     config = config[:default][:vcloud][:ecloud]
     @vcloud ||= ::Fog::Compute.new(:provider => 'Ecloud',
                                    :ecloud_username => config[:username],
                                    :ecloud_password => config[:password],
                                    :ecloud_version => config[:version],
                                    :ecloud_versions_uri => config[:versions_uri])
   end

puts ecloud.vdcs.first

total_overall_disk = 0
      total_overall_memory = 0
      total_overall_cpus = 0

ecloud.vdcs.each do |v|
        puts "Processing #{v.name}..."
        v.servers.each do |s|
          puts s.name      
        end
end

ecloud.vdcs.server(tm21-s00016).cpus
