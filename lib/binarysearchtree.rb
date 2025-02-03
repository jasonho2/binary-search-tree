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

  # per the article provided by TOP deletion
  def get_successor(curr)
    curr = curr.right
    while curr != nil && curr.left != nil
      curr = curr.left
    end
    curr
  end
  
  def delete(value, node = @root)
    # base case
    if node.nil?
      return node
    end

    # if key is in a subtree
    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else # if node = value

      if node.left.nil? # when root has 0 children or only right child
        return node.right
      end
      if node.right.nil? # when root has only left child
        return node.left
      end

      # per the article provided by TOP. when both children are present
      succ = get_successor(node)
      node.data = succ.data
      node.right = delete(succ.data, node.right)

    end

    node
  end

  def find(value, node = @root)
    if node.nil?
      return false
    end

    if value == node.data
      return true
    elsif value < node.data
      find(value, node.left)
    else
      find(value, node.right)
    end

  end

  def level_order(node = @root, &block)
    if node.nil?
      return
    end

    queue = [node]
    result = []

    until queue.empty?
      current = queue.shift
      block_given? ? yield(current) : result << current.data
      if current.left
        queue << current.left
      end
      if current.right
        queue << current.right
      end
    end

    result
  end

  # print method provided by student via Discord
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end