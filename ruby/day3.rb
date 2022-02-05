module ActsAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  class CsvRow
    attr_accessor :headers_to_vals
    def initialize(headers, row)
      vals = row.chomp.split(', ' )
      @headers_to_vals = Hash.new
      headers.each_with_index {|h, index| @headers_to_vals[h.to_sym] = vals[index]}
    end

    def method_missing name
      @headers_to_vals[name]
    end
  end


  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ' )
      file.each do |row|
        @csv_contents << CsvRow.new(headers, row)
      end
    end

    def each(&block)
      @csv_contents.each &block
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

  end

end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
puts
puts "1."
csv.each {|row| puts "one: #{row.one}, two: #{row.two}"}

