
def bubble_sort arr_to_sort
  ((arr_to_sort.length/2) + 2).times do
     count = 0
    while count <= arr_to_sort.length-2
      if arr_to_sort[count] < arr_to_sort[count+1]
        arr_to_sort
      else
        val_one = arr_to_sort[count]
        val_two = arr_to_sort[count+1]

        arr_to_sort[count] = val_two
        arr_to_sort[count+1] = val_one
      end
      count += 1
    end
  end
  arr_to_sort
end

p bubble_sort([4,3,78,2,0,2])