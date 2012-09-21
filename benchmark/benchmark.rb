$:.unshift(File.join(File.dirname(__FILE__), %w{.. lib}))

require 'benchmark'
require 'ipaddr'
require 'consistent_hashing'

def ip(offset)
  address = IPAddr.new('10.0.0.0').to_i + offset
  [24, 16, 8, 0].collect {|b| (address >> b) & 255}.join('.')
end

def rand_client_id()
  (rand * 1_000_000).to_int
end

def benchmark_insertions_lookups()
  # The initial ring implementation using a combination of hash and sorted list
  # had the following results when benchmarked:
  #                  user     system      total        real
  # Insertions:  1.260000   0.000000   1.260000 (  1.259346)
  # Look ups:   20.080000   0.020000  20.100000 ( 20.111773)
  #
  # The ring implementation using an AVLTree has the following results
  # when benchmarked on the same system:
  #                  user     system      total        real
  # Insertions:  0.060000   0.000000   0.060000 (  0.062302)
  # Look ups:    1.020000   0.000000   1.020000 (  1.028172)
  #
  # The performance improvement is ~20x for both insertions and lookups.

  Benchmark.bm(10) do |x|
    ring = ConsistentHashing::Ring.new(replicas: 200)
    x.report("Insertions:") {for i in 1..1_000; ring << ip(i); end}
    x.report("Look ups:  ") do
      for i in 1..100_000
        ring.point_for(rand_client_id)
      end
    end
  end
end

benchmark_insertions_lookups
