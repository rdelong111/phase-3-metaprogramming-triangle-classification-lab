class Triangle
  attr_reader :sides

  def initialize(s1, s2 ,s3)
    @sides = [s1, s2, s3, s1, s2]
  end

  def kind
    matches = 0
    3.times do |i|
      if @sides[i] <= 0 || @sides[i] + @sides[i + 1] <= @sides[i + 2]
        raise TriangleError
      elsif @sides[i] == @sides[i + 1]
        matches += 1
      end
    end

    if matches == 3
      :equilateral
    elsif matches == 1
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "Not a valid triangle."
    end
  end
end
