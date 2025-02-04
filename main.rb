require_relative 'lib/binarysearchtree.rb'

# tie it all together
data = (Array.new(15) { rand(1..100) })
tree = Tree.new(data)

# view tree
tree.pretty_print

# confirm tree is balanced
puts "is the tree balanced? "
p tree.balanced?

# confirm element orders
puts "level_order array: "
p tree.level_order
puts "preorder array: "
p tree.preorder
puts "inorder array: "
p tree.inorder
puts "postorder array: "
p tree.postorder

# inserting numbers greater than 100 to make the tree unbalanced
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)

# view tree
tree.pretty_print

# confirm tree is unbalanced
puts "is the tree balanced? "
p tree.balanced?

# rebalance the tree
tree.rebalance

# view tree
tree.pretty_print

# confirm tree is balanced
puts "is the tree balanced? "
p tree.balanced?

# confirm element orders
puts "level_order array: "
p tree.level_order
puts "preorder array: "
p tree.preorder
puts "inorder array: "
p tree.inorder
puts "postorder array: "
p tree.postorder

# all code below was used to test methods individually
 
#data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324].to_a
#tree = Tree.new(data)

#tree.pretty_print

=begin
tree.insert(10)
tree.insert(9)
tree.insert(2)

puts "inserting 10, 9, and 2 (9 is a duplicate and will be discarded)"

tree.pretty_print

# only left children, which replace it
tree.delete(23)
tree.delete(4)

puts "deleting 23"

tree.pretty_print

# only left children, which replace it
tree.delete(3)

puts "deleting 3"

tree.pretty_print

# has both children, replace with next largest (5)
tree.delete(4)

puts "deleting 4"

tree.pretty_print

# removing a leaf
tree.delete(324)

puts "deleting 324"

tree.pretty_print

puts tree.find(7).inspect
puts tree.find(6).inspect

puts tree.find(7)
puts tree.find(6)
=end

=begin
tree.pretty_print
p "level order array: "
p tree.level_order

p "in order array: "
p tree.inorder

p "pre order array: "
p tree.preorder

p "post order array: "
p tree.postorder
=end

=begin
tree.pretty_print

node_324 = tree.find(324)
puts tree.depth(node_324)
=end

=begin
tree.pretty_print

puts tree.balanced?

# force tree to be unbalanced
tree.delete(23)
tree.delete(4)
tree.delete(3)
tree.delete(5)
tree.delete(7)
tree.delete(2)

tree.pretty_print

puts tree.balanced?

tree.rebalance

tree.pretty_print

puts tree.balanced?
=end