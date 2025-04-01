module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self
          yield item if block_given?
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |result, item| result << yield(item) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |result, item| item.nil? ? result : result << item }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, sym = nil)
        if acc.is_a?(Symbol)
          sym = acc
          acc = nil
        end

        first_iteration = true

        my_each do |el|
          if first_iteration && acc.nil?
            acc = el
            first_iteration = false
          elsif block_given?
            acc = yield(acc, el)
          elsif sym
            acc = acc.send(sym, el)
          end
        end
        acc
      end
    end
  end
end