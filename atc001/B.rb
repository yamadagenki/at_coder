# frozen_string_literal: true
# frozen_string_literal: true

# Generated by AtcoderGreedy on 2018-04-23
# ATC001 B
# Your code here

$N, $Q = gets.chomp.split(' ').map(&:to_i)

$con = {}
(1..$N).each do |i|
  $con[i] = i
end
$rank = Array.new($N, 0)

def find(i)
  return i if i == $con[i]

  find($con[i])
end

def union(i, j)
  x = find(i)
  y = find(j)

  return if x == y

  if $rank[x - 1] < $rank[y - 1]
    $con[y] = x
  else
    $con[x] = y
    $rank[x - 1] += 1 if $rank[x - 1] == $rank[y - 1]
  end
end

$Q.times do
  p, a, b = gets.chomp.split(' ').map(&:to_i)

  if p == 0
    union(a, b)
  else
    puts find(a) == find(b) ? 'Yes' : 'No'
  end
end
