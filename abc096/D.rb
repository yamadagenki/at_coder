# frozen_string_literal: true

# Generated by AtcoderGreedy on 2018-05-05
# ABC096 D
# Your code here

prime_list = []
list = (2..55_555).to_a

is_prime = {}

list.each do |i|
  next if is_prime[i] == true

  prime_list << i

  i.step(55_555, i) do |k|
    is_prime[k] = true
  end
end

$N = gets.chomp.to_i

(1..4).each do |i|
  res = []
  count = 0
  prime_list.each do |p|
    break if $N == count
    next unless p % 5 == i
    res << p
    count += i
    next
  end
  next unless count == $N
  puts res.join(' ')
  exit 0
end