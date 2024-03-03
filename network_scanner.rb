require "ipaddr"
require "net/ping"

def scan_network(ip, mask)
  address = "#{ip}/#{mask}"
  ip_range = IPAddr.new(address).to_range.map{ |ip_object| ip_object.to_s }
end

def scan_range(ip_range)
    active_ips = ip_range.select { |ip| Net::Ping::External.new(ip).ping? }
end

def write_to_file(active_ips)
  File.open("active_ips.txt", "w") do |file|
    active_ips.each { |ip| file.puts(ip) }
  end
end

range = scan_network("192.168.1.10", "255.255.255.0")
active_ips = scan_range(range)
write_to_file(active_ips)