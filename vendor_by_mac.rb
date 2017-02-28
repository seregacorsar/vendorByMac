require 'open-uri'
require 'nokogiri'

def getVendorByMac(mac)
	url = 'http://api.macvendors.com/' + mac
	html = open(url)
	doc = Nokogiri::HTML(html)
	if html != nil
		return doc.text.strip
	else
		return ""
	end
end

fin = File.open('.\Projects\vendor_by_mac\src.txt', 'r')
fout = File.open('.\Projects\vendor_by_mac\out.csv', 'w')
fout.write("mac;vendor\n")
i = 1
while (str = fin.gets)
	STDOUT.write "\r#{i} from 12889"
	mac = str.chomp
	fout.write("#{mac};#{getVendorByMac(mac)}\n")
	i += 1
end
fin.close
fout.close
puts "\nready"