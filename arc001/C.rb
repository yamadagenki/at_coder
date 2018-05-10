# frozen_string_literal: true

# Generated by AtcoderGreedy on 2018-04-30
# ARC001 C
# Your code here
$c = []
$queens = {}
8.times do |i|
  tmp = gets.chomp.split('')
  $queens[i] = tmp.index('Q') if tmp.index('Q')
  $c << tmp
end

def is_ok?(c, point)
  y, x = point
  8.times do |j|
    next if j == y
    return false if c[j][x] == 'Q'
  end
  8.times do |i|
    next if i == x
    return false if c[y][i] == 'Q'
  end

  16.times do |k|
    next unless x + (8 - k) >= 0 && x + (8 - k) < 8 && y - (8 - k) >= 0 && y - (8 - k) < 8
    next if k == 8
    return false if c[y - (8 - k)][x + (8 - k)] == 'Q'
  end

  16.times do |k|
    next unless x - (8 - k) >= 0 && x - (8 - k) < 8 && y - (8 - k) >= 0 && y - (8 - k) < 8
    next if k == 8
    return false if c[y - (8 - k)][x - (8 - k)] == 'Q'
  end

  true
end

def fill_box(c, point)
  tmp = Marshal.load(Marshal.dump(c))
  y, x = point
  8.times do |i|
    tmp[y][i] = 'Q'
  end

  8.times do |j|
    tmp[j][x] = 'Q'
  end

  16.times do |k|
    next unless x - (8 - k) >= 0 && x - (8 - k) < 8 && y - (8 - k) >= 0 && y - (8 - k) < 8
    tmp[y - (8 - k)][x - (8 - k)] = 'Q'
  end
  16.times do |k|
    next unless x + (8 - k) >= 0 && x + (8 - k) < 8 && y - (8 - k) >= 0 && y - (8 - k) < 8
    tmp[y - (8 - k)][x + (8 - k)] = 'Q'
  end
  tmp
end

$queens.each do |y, x|
  unless is_ok?($c, [y, x])
    puts 'No Answer'
    exit(0)
  end
end

$queens.each do |y, x|
  $c = fill_box($c, [y, x])
end

def dfs(c, queens, j)
  return queens if j == 8
  return dfs(c, queens, j + 1) if queens[j]

  8.times do |i|
    next if c[j][i] == 'Q'
    tmp = queens.dup
    tmp[j] = i
    res = dfs(fill_box(c, [j, i]), tmp, j + 1)
    return res if res.size == 8
  end
  queens
end

res_queens = dfs($c, $queens, 0)

if res_queens.size < 8
  puts 'No Answer'
else
  res_queens.sort.each do |_, i|
    tmp = '.' * 8
    tmp[i] = 'Q'
    puts tmp
  end
end