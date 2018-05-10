# frozen_string_literal: true

$N = gets.chomp.to_i

list = Array.new($N + 1, true)

prime_list = []
(2..$N).each do |i|
  next unless list[i]
  prime_list << i
  (i * 2).step($N, i) do |j|
    list[j] = false
  end
end

# puts prime_list.inspect
puts list[$N] ? 'Yes' : 'No'
