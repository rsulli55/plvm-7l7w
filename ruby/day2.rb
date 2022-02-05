## 1.
def div_by_four?(x)
  x % 4 == 0
end

def print_sixteen(numbers)
  numbers.each {|i| print (if div_by_four?(numbers.index(i) + 1) then "#{i}\n" else "#{i} " end)}
end

def print_sixteen2(numbers)
  numbers.each_slice(4) {|slice| p slice}
end

puts "1."
print_sixteen((1..16).collect{|i| i})
print_sixteen2((1..16).collect{|i| i})
puts

## 2.
class Tree
  attr_accessor :children, :node_name
  def initialize(tree)
    tree.each_pair do |parent, children|
      @node_name = parent
      @children = children.to_h {|par, kids| [par, Tree.new({par => kids})]}.values
    end
  end
  # def initialize(name, children=[])
  #   @children = children
  #   @node_name = name
  # end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end
puts "2."
# ruby_tree = Tree.new( "Ruby", [Tree.new("Reia" ), Tree.new("MacRuby" )] )
ruby_tree = Tree.new({"grandpa" => { "dad" => {"child 1" => {}, "child 2" => {} }, "uncle" => {"child 3" => {}, "child 4" => {} } } })
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
puts

puts "3."
def simple_grep(filename, pattern)
  lines = File.readlines(filename, chomp: true)
  lines.each {|line| puts "Matched #{pattern} on line: '#{line}'" if line.match(pattern)}
end

simple_grep("test.txt", "orld")
simple_grep("test.txt", "ll")
simple_grep("test.txt", "l")


