module UserapiAi
  class Tool
    def self.crop url: nil, result: nil
        url = result["url"] if url.nil?
        image = MiniMagick::Image.open url
        image.crop "50%x50%"
        arr = image.path.split(".")
        (0..3).map{ |i|
          arr.dup.insert(-2, "-#{i}.").join("")
        }
    end
  end
end
