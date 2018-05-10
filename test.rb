# frozen_string_literal: true

require 'pry-byebug'

class Heap
  def op(a, b)
    a[1] > b[1]
  end

  def push(array, elem)
    # puts array.inspect
    n = array.size
    array << elem

    while n != 0
      i = (n - 1) / 2
      if op(array[n], array[i])
        tmp = array[n]
        array[n] = array[i]
        array[i] = tmp
      end
      n = i
    end
  end

  def pop(array)
    n = array.size.to_i - 1
    return array.pop if n == 0
    max_elem = array[0]
    array[0] = array.pop
    i = 0

    while (j = (2 * i + 1)) < n
      j += 1 if (j != n - 1) && !op(array[j], array[j + 1])
      if !op(array[i], array[j])
        tmp = array[j]
        array[j] = array[i]
        array[i] = tmp
      else
        break
      end
      i = j
    end

    max_elem
  end

  def peak(array)
    array[0]
  end

  def remove(array, t)
    i = array.index { |k, _| k == t }
    if i == 0
      pop(array)
      return array
    end
    array[i] = nil

    until array[2 * i + 1].nil?
      array[i] = array[2 * i + 1]
      array[2 * i + 1] = nil
      i = 2 * i + 1
    end

    array.compact
  end
end

class PriorityQueue
  def initialize
    @pqueue = []
    @heap = Heap.new
  end

  def push(k, v)
    @heap.push(@pqueue, [k, v])
  end

  def pop
    @heap.pop(@pqueue)
  end

  def peak
    @heap.peak(@pqueue)
  end

  def remove(i)
    @pqueue = @heap.remove(@pqueue, i)
  end

  def size
    @pqueue.size
  end
end

pq = PriorityQueue.new

# 10.times do
#   pq.push(rand(100), 2)
# end
# 10.times do
#   puts pq.pop.inspect
# end

$N, $L = gets.chomp.split(' ').map(&:to_i)
$a = gets.chomp.split(' ').map(&:to_i)

$a.each_with_index do |a, i|
  unless pq.peak
    pq.push(a, a)
    next
  end
  if $L <= i
    puts pq.peak[1]
    pq.remove($a[i - $L])
  end
  _, m = pq.peak
  pq.push(a, [a, m].compact.max)
end
puts pq.peak[1]
