require_relative 'flatten_a_multilevel_dubly_linked_list'

RSpec.describe 'flatten' do
  def create_linked_list(values, children = {})
    return nil if values.empty?

    # Create nodes
    nodes = values.map { |val| Node.new(val) }

    # Connect nodes
    nodes.each_with_index do |node, i|
      node.next = nodes[i + 1] if i < nodes.length - 1
      nodes[i + 1].prev = node if i < nodes.length - 1

      # Add child if specified
      if children[i]
        node.child = create_linked_list(children[i])
      end
    end

    nodes.first
  end

  def list_to_array(head)
    result = []
    current = head
    while current
      result << current.val
      current = current.next
    end
    result
  end

  it 'handles empty list' do
    expect(flatten(nil)).to be_nil
  end

  it 'handles single node' do
    head = Node.new(1)
    result = flatten(head)
    expect(list_to_array(result)).to eq([1])
  end

  it 'flattens a simple multilevel list' do
    # Create list: 1 -> 2 -> 3
    #                   |
    #                   4 -> 5
    head = create_linked_list([1, 2, 3], {
      1 => [4, 5]
    })

    result = flatten(head)
    expect(list_to_array(result)).to eq([1, 2, 4, 5, 3])
  end

  it 'flattens a complex multilevel list' do
    # Create list: 1 -> 2 -> 3 -> 4
    #                   |
    #                   5 -> 6
    #                        |
    #                        7 -> 8
    head = create_linked_list([1, 2, 3, 4], {
      1 => [5, 6],
      5 => [7, 8]
    })

    result = flatten(head)
    expect(list_to_array(result)).to eq([1, 2, 5, 6, 7, 8, 3, 4])
  end
end
