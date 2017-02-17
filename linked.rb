class LinkedList

	attr_accessor :head, :tail
	def initialize
	@head = Node.new
	@tail = nil
	end

	def append node
		if @tail == nil
			@tail = node
			@head.nextnode = @tail
		else
			@tail.nextnode = node
			@tail = @tail.nextnode
		end
	end

	def prepend node
		if @head == nil
			@head = node
		else
			node.nextnode = @head
			@head = node
		end
	end

	def size
		t = @head
		i = 1
		while t.nextnode != nil
			t = t.nextnode
			i += 1
		end
		i
	end

	def at index
		t = @head
		index.times do
			break if t == nil
			t = t.nextnode
		end
		t
	end

	def pop
		@tail = at(size - 2)
		@tail.nextnode = nil
	end
 
	def contains? node
		t = @head
		while (t != nil)
			return true if t == node
			t = t.nextnode
		end
		false
	end

	def find node
		t = @head
		i = 0		
		while (t != nil)
			return i if t == node
			t = t.nextnode
			i += 1
		end
		nil
	end

	def to_s
		s = ''
		t = @head
		while t != nil
			s += "(#{t.value}) -> "
			t = t.nextnode
		end
		s + "(nil)"
	end

	def insert node, index
		return nil if index < 0 || index > size - 1
		if index == 0
			prepend node
		elsif index == size - 1
			append node
		else
			 node.nextnode = at(index)
			 at(index - 1).nextnode = node
		end
	end

	def delete index
		return nil if index < 0 || index > size - 1
		if index == 0
			@head = @head.nextnode
			t = at(0)
			t = nil 
		elsif  index == size - 1
			pop
		else
			t = at(index)
			at(index - 1).nextnode = at(index + 1)
			t = nil
		end
			
	end

end

class Node
	attr_accessor :value, :nextnode
	def initialize(value = nil, nextnode = nil)
		@value = value
		@nextnode = nextnode
	end
end

#tests..
nodeA = Node.new("A")
list = LinkedList.new
list.head = nodeA
nodeB = Node.new('B')
list.append(nodeB)
puts list.to_s
nodeC = Node.new('C')
list.append(nodeC)
nodeD = Node.new('D')
list.prepend(nodeD)
puts list.to_s
nodeE = Node.new('C')
list.insert(nodeE, 2)
puts list.to_s
list.pop
puts list.to_s
p list.contains? nodeD
p list.contains? nodeC
puts list.size
p list.find nodeA
list.delete(2)
puts list.to_s
