# frozen_string_literal: true

# Generated by AtcoderGreedy on 2018-04-23
# ATC001 A
# Your code here

$H, $W = gets.chomp.split(' ').map(&:to_i)

$c = []

s = []
$H.times do |i|
  tmp = gets.chomp.split('')
  s = [i, tmp.index('s')] if tmp.index('s')
  $c << tmp
end

$visited = {}
$stack = [s]

until $stack.empty?
  x, y = $stack.pop
  next if $c[x][y] == '#'
  next if $visited["#{x},#{y}"]

  if $c[x][y] == 'g'
    puts 'Yes'
    exit(0)
  end
  $visited["#{x},#{y}"] = true

  $stack << [x - 1, y] if x - 1 >= 0
  $stack << [x + 1, y] if x + 1 < $H
  $stack << [x, y - 1] if y - 1 >= 0
  $stack << [x, y + 1] if y + 1 < $W
end

puts 'No'
