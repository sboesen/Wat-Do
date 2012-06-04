class Color < ActiveRecord::Base
  def to_hex
    output = ""
    [self.red,self.green,self.blue].each do |color|
      hex = color.to_s(16)
      hex = "0"+hex.to_s if (hex.length == 1)
      output += hex
    end
    output
  end
end
