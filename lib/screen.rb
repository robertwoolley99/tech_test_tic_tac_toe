# frozen_string_literal: true

# Object to render board.
class Screen
  def initialize(hash)
    @hash = hash
  end

  def image
    output = "ABC\n1"
    n = 1
    @hash.each do |_key, value|
      output += value
      output += "\n2" if n == 3
      output += "\n3" if n == 6
      n += 1
    end
    output
  end
end
