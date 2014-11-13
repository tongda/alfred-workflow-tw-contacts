require 'csv'
require 'json'

def filter(keyword)
  csv = CSV.read("contacts.csv", "r:utf-8", :headers => true, :header_converters => :symbol)

  outputs = '<?xml version="1.0"?><items>';

  csv.each do |twer|
    if twer.to_s.include? keyword
      outputs << %Q{
        <item uid="desktop" valid="YES" autocomplete="Desktop" type="file">
          <title>#{twer[:chinese_name]}</title>
          <arg>#{twer.to_hash.to_json}</arg>
          <subtitle>Copy #{twer[:chinese_name]} to clipboard.</subtitle>
          <subtitle mod="cmd">Copy #{twer[:email]} to clipboard.</subtitle>
          <icon type="fileicon">~/Desktop</icon>
        </item>
      }
    end
  end

  outputs << "</items>"
end
