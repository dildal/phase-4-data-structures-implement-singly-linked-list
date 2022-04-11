require_relative './node'
require 'pry'

class LinkedList
    attr_accessor :head
    def initialize
        @head = nil
    end

    def prepend(node)
        if head.nil?
            @head = node
            return 
        end
        old_head = @head
        @head = node
        node.next_node = old_head
    end

    def append(node)
        if head.nil?
            @head = node
            return
        end

        current = head
        while current.next_node
            current = current.next_node
        end
        current.next_node = node
    end

    def delete_head
        if head
            self.head = self.head.next_node
        end
    end

    def delete_tail
        if head
            current = head
            if !current.next_node
                @head = nil
            end
            while current.next_node
                if current.next_node.next_node
                    current = current.next_node
                else
                    current.next_node = nil
                end
            end
        end
    end

    def add_after(index, node)
        current = head
        while(index > 0 && current.next_node)
            current = current.next_node
            index -=1
        end
        node.next_node = current.next_node
        current.next_node = node
    end

    def search(value)
        current = head
        while(current.data != value)
            current = current.next_node
        end
        current
    end

end
