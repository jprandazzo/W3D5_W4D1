require 'byebug'
class PolyTreeNode
    attr_reader :value, :parent, :children
    attr_writer :children

  def initialize(value) #N2
    @parent = nil
    @children = []
    @value = value #N2
  end

  def parent=(node) #self = N2, #node = N1, N1(parent) > N2(child)
    self.parent.children.delete(self) if self.parent != nil #N3
    
    @parent = node

    node.children.push(self).uniq! if node != nil
  end

  def add_child(child_node) #N3
    child_node.parent = self
  end

  def remove_child(child_node)  
    raise_error 'check your argument' unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)

    return self if self.value == target_value
    self.children.each do |node|
      # debugger
      return node.dfs(target_value) if 
          node.dfs(target_value) != nil && 
          node.dfs(target_value).value == target_value
    end
    nil
  end

  def bfs(target_value)
    return self if self.value == target_value
    # debugger
    array = []
    array += self.children
    until array.empty?
      test = array.shift
      # debugger
      if test.value == target_value
        return test
      else
        array += test.children
      end
    end
    nil
  end

  # def inspect
  #   self.value
  #   self.children
  # end

end



