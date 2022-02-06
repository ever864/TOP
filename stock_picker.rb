

def stock_picker arr_prices

  count_arr = 0
  new_arr = []
  new_arr_two = []
  while count_arr <= arr_prices.length - 2
     new_arr_two << [arr_prices.index(arr_prices[count_arr..-1][0]), arr_prices.index(arr_prices[count_arr + 1..-1].max)]
    new_arr << [arr_prices[count_arr..-1][0], arr_prices[count_arr + 1..-1].max]
    count_arr += 1
  end
  index_arr = new_arr.map{|pair|pair[1] - pair[0]}.index(new_arr.map{|pair|pair[1] - pair[0]}.max)
  new_arr_two[index_arr]
end

p stock_picker([2,3,1,9,15,8,6,1,20])
