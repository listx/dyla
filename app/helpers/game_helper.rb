module GameHelper

    # takes "1 2 3 4" turns into [1,2,3,4]
  def str_to_arr(string)
    arr_of_strings = string.split(" ")
    arr_of_strings.map! do |element|
      element.to_i
    end
  end

  def arr_to_str(arr)
    arr.join(" ")
  end

end
