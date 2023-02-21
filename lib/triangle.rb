class Triangle
  # write code herea
  attr_reader :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
    validate_triangle

  end

  def kind
    if (length1 == length2 && length2 == length3)
      :equilateral
    elsif (length1 == length2 || length1 == length3 || length2 == length3)
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    raise TriangleError, "Sides must have positive length." if [length1, length2, length3].any? { |s| s <= 0 }
    sides = [length1, length2, length3].sort
    raise TriangleError, "Invalid triangle: the sum of the lengths of any two sides must be greater than the length of the third side." unless sides[0] + sides[1] > sides[2]
  end

  class TriangleError < StandardError
  
  end
end


