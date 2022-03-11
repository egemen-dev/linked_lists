class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  #size returns the total number of nodes in the list.
  def size
    i = 1
    current = head
    while !current.next.nil?
      current = current.next
      i += 1
    end
    i
  end

  #tail returns the last node in the list.
  def tail
    i = 1
    current = head
    while !current.next.nil?
      current = current.next
      i += 1
    end
    tail = current
  end

  #append(value) adds a new node containing value to the end of the list.
  def append(value)
    tail.next = Node.new(value)
  end

  #prepend(value) adds a new node containing value to the start of the list.
  def prepend(value)
    old_head = head
    new_head = Node.new(value)
    @head = new_head
    new_head.next = old_head
  end

  #at(index) returns the node at the given index.
  def at(index)
    i = 0
    current = head
    while i < index && current = current.next
      i += 1
    end
    current
  end

  #pop removes the last element from the list.
  def pop
    penultimate = size - 2 
    new_tail = at(penultimate)
    new_tail.next = nil
  end

  #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current = head
    return true if value == current.value
    while !current.next.nil? && current = current.next
      return true if value == current.value
    end
    false
  end

  #find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    index = 0
    current = head
    return index if value == current.value
    while !current.next.nil? && current = current.next
      index += 1
      return index if value == current.value
    end
    nil
  end

  def node(current)
    node = "( #{current.value} ) -> "
  end

  def to_s
    current = head
    list = node(current)
    end_nil = "nil"
    while !current.next.nil? && current = current.next
      list += node(current)
    end
    list + end_nil
  end
end

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value
    @next = nil
  end
end

head = Node.new(6)
nodeB = head.next = Node.new(3)
nodeC = nodeB.next = Node.new(4)


list = LinkedList.new(head)
puts "size"
p list.size
puts "head"
p list.head.value
puts "tail"
p list.tail.value
list.append(17)
puts "new tail"
p list.tail.value
list.prepend(1)
puts "new head"
p list.head.value
puts "new size"
p list.size
list.pop
puts "new tail?"
p list.tail.value
puts "size after pop"
p list.size
p list.contains?(17)
p list.find(17)
p list.to_s
