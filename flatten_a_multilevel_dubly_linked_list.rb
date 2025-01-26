# Definition for a Node.
class Node
  attr_accessor :val, :prev, :next, :child

  def initialize(val = nil, prev = nil, next_ = nil, child = nil)
    @val = val
    @prev = prev
    @next = next_
    @child = child
  end
end

# @param {Node} root
# @return {Node}
def flatten(root)
  return root if root.nil?

  current = root
  while current
    current = concatenate_child_list(current) if current.child
    current = current.next
  end
  root
end

def concatenate_child_list(current)
  current.child.prev = current
  current.next.next = current.child
  current.child = nil
  current
end
