require 'csv'

def filter(keyword)
  csv = CSV.read("contacts.csv", "r:utf-8", :headers => true, :header_converters => :symbol)

  outputs = '<?xml version="1.0"?><items>';

  csv.each do |twer|
    if twer[:chinese_name].include? keyword
      outputs << %Q{
        <item uid="desktop" arg="~/Desktop" valid="YES" autocomplete="Desktop" type="file">
          <title>#{twer[:chinese_name]}</title>
          <subtitle>~/Desktop</subtitle>
          <icon type="fileicon">~/Desktop</icon>
        </item>
      }
    end
  end

  outputs << "</items>"
end
