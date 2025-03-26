module Exercise
  module Arrays
    class << self
      def my_max(array)
        max = 0

        array.each do |el|
          max = el if el > max
        end
        max
      end

      def replace(array)
        max = my_max(array)

        array.each_with_index do |el, i|
          array[i] = max if el >= 0
        end
      end

      def search(array, query, low = 0, high = array.size - 1)
        return - 1 if low > high

        mid = (low + high) / 2

        if array[mid] < query
          search(array, query, mid + 1, high)
        elsif array[mid] > query
          search(array, query, low, mid - 1)
        else
          mid
        end
      end
    end
  end
end
