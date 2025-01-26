# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} head
# @return {ListNode}
def reverse(head)
    prev = nil
    current = head
    while current
        next_node = current.next
        current.next = prev
        prev = current
        current = next_node
    end
    prev
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
# Print the reversed linked list
current = head
while current
    print current.val.to_s + " -> "
    current = current.next
end
puts "\nReversed list:"
# Call the reverse method
reversed_head = reverse(head)

# Print the reversed linked list
current = reversed_head
while current
    print current.val.to_s + " -> "
    current = current.next
end
