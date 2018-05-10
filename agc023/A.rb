# frozen_string_literal: true

# Generated by AtcoderGreedy on 2018-04-28
# AGC023 A
# Your code here
$N = gets.chomp.to_i

$A = gets.chomp.split(' ').map(&:to_i)

count = 0
sum_list = {}
tmp = 0
$N.times do |i|
  tmp += $A[i]
  count += 1 if tmp == 0
  sum_list[tmp] ||= 0
  sum_list[tmp] += 1
end

sum_list.each do |_, v|
  count += v * (v - 1) / 2
end
puts count