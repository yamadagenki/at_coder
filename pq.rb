# frozen_string_literal: true

class Heap
  def push(array, elem)
    n = array.size
    array << elem

    while n != 0
      i = (n - 1) / 2
      if (array[n] - array[i]) > 0
        tmp = array[n]
        array[n] = array[i]
        array[i] = tmp
      end
      n = i
    end
  end

  def pop(array)
    n = array.size.to_i - 1
    max_elem = array[0]
    array[0] = array.pop
    i = 0

    while (j = (2 * i + 1)) < n
      j += 1 if (j != n - 1) && ((array[j] - array[j + 1]) < 0)
      if (array[i] - array[j]) < 0
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
    i = array.index(t)
    return pop(array) if i == 0
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
    @data = {}
    @heap = Heap.new
  end

  def push(k, _v)
    @heap.push(@pqueue, k)
  end

  def pop
    k = @heap.pop(@pqueue)
    [k, @data.delete(k)]
  end

  def peak
    @heap.peak(@pqueue)
  end

  def remove(i)
    @pqueue = @heap.remove(@pqueue, i)
    @data.delete(i)
  end

  def to_s
    data.to_s
  end
end

pq = PriorityQueue.new
