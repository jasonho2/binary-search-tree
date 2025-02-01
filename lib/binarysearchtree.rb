require_relative 'node.rb'

class Tree
  attr_accessor :root, :left, :right

  def initialize(array)
    @root = build_tree(array)
  end

end