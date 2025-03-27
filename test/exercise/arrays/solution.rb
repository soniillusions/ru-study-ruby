module Exercise
  module Arrays
    class << self
      def my_max(array)
        max = 0
        array.map { |el| max = el if el > max }
        max
      end

      def replace(array)
        max = my_max(array)
        array.map { |el| el >= 0 ? max : el }
      end

      def search(array, query, low = 0, high = array.size - 1)
        return -1 unless array.include?(query)
        return -1 if low > high

        mid = (low + high) / 2

        return mid if array[mid] == query

        array[mid] < query ? search(array, query, mid + 1, high) : search(array, query, low, mid - 1)
      end
    end
  end
end
