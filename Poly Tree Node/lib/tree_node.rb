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

    if node != nil
        node.children << self
        node.children.uniq!
    end
  end


end