# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  result = nil
  
  t = [a,b,c].uniq.sort
  
  result = begin
    # if t.map { |i| true if i <= 0 }.include?(true)
    if t.find { |i| i <= 0 }
      :negative_side
    elsif (t.size == 2) && (t.first + 2 == t.last)
      :invalid_side
    end
  end
  
  raise TriangleError, "Invalid triangle" unless result.nil?
  
  if (a == b) && (b == c) && (a == c)
    :equilateral
  elsif (a == b && a != c) || (b == c && b != a) || (a == c && a != b)
    :isosceles
  elsif (a != b) && (b != c) && (a != c)
    :scalene
  else
    puts "unknown triangle!"
  end
  
  # http://stackoverflow.com/questions/4742692/a-more-elegant-solution-to-ruby-koans-triangle-rb
  # ...a more elegant solution:
  # 
  # case [a,b,c].uniq.size
  # when 1 then :equilateral
  # when 2 then :isosceles
  # else        :scalene
  # end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
