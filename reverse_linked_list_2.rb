# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def printLinkedList current
  while current
      print current.val.to_s + " -> "
      current = current.next
  end
end

# Create the linked list 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7
head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(3)
head.next.next.next = ListNode.new(4)
head.next.next.next.next = ListNode.new(5)
head.next.next.next.next.next = ListNode.new(6)
head.next.next.next.next.next.next = ListNode.new(7)

puts "Original list:"
# Print the Original linked list
printLinkedList head

# @param {ListNode} head
# @param {Integer} left
# @param {Integer} right
# @return {ListNode}
def reverse_between(head, left, right)
    start = head
    current = head
    current_position = 1
    while current_position < left
        start = current
        current = current.next
        current_position += 1
    end
    rev_list = nil
    tail = current
    while current_position >= left && current_position <= right
        next_node = current.next
        current.next = rev_list
        rev_list = current
        current = next_node
        current_position += 1
    end
    start.next = rev_list
    tail.next = current
    if left > 1
        return head
    else
        return rev_list
    end
end

puts "\nReversed list:"
# Create the reversed linked list 1 -> 2 -> 5 -> 4 -> 3 -> 6 -> 7
# Call the reverse method
reversed_head = reverse_between(head, 3, 5)

# Print the reversed linked list
printLinkedList reversed_head
