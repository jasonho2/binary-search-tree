require_relative 'node.rb'
require_relative 'merge_sort.rb'

class Tree
  attr_accessor :root#, :left, :right

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return nil if array.empty?
    array = merge_sort(array).uniq
    
    mid = array.size / 2
    
    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid+1...])

    root
  end

  def insert(value, node = @root)
    if node.nil?
      return Node.new(value)
    end

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    else
      return node
    end

    node
  end

  # print method provided by student via Discord
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end