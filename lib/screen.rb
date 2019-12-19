class Screen
  def initialize(hash)
    @hash  = hash
  end
  def image
    output = "ABC\n1"
    n = 1
    @hash.each do |key, value|
      output += value
      if n == 3
        output += "\n2"
      end
      if n == 6
        output += "\n3"
      end
      n+=1
    end
    output
  end
end
