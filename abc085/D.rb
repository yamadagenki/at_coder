# Generated by AtcoderGreedy on 2018-05-10
# ABC085 D
# Your code here
$N, $H = gets.chomp.split(' ').map(&:to_i)

$b = []
$max_a = -100

$total = []
$N.times do
  a, b = gets.chomp.split(' ').map(&:to_i)
  $max_a = a < $max_a ? $max_a : a
  $b << b
end

$b = $b.sort

count = 0

while $H > 0
  if $b.empty? || $b.last < $max_a
    # puts [$H, $max_a, count].inspect
    count += ($H / $max_a.to_f).ceil
    break
  else
    count += 1
    $H -= $b.pop
  end
end

puts count