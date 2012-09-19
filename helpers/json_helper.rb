require 'yajl'

module JSonHelper
  def encode_json(obj)
    Yajl::Encoder.encode(obj)
  end

  def parse_json(str)
    print str
    Yajl::Parser.parse(str, :symbolize_keys => true)
  end
end
