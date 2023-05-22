require '../Poly Tree Node/lib/tree_node.rb'

class KnightPathFinder
    def self.valid_moves(pos)
        row,column = pos
        moves = [[row + 2, column + 1], 
                [row + 2, column - 1],
                [row + 1, column + 2], 
                [row + 1, column - 2],
                [row - 1, column + 2],
                [row - 1, column - 2],
                [row - 2, column - 1],
                [row - 2, column + 1]]
        moves.select {|pos| pos[0].between?(0,8) && pos[1].between?(0,8)}
    end

    def new_move_positions(pos)
        @considered_positions += KnightPathFinder.valid_moves(pos).reject {|e| @considered_positions.include?(e)}
        @considered_positions
    end

    def initialize(starting_position)

        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [starting_position] + KnightPathFinder.valid_moves(starting_position)
        build_move_tree(@root_node)

        
    end

    def build_move_tree(node)
       KnightPathFinder.valid_moves(node.value).each do |pos|
        node.add_child(PolyTreeNode.new(pos))
       end

    #    node.children.each do |child_node|
    #     new_move_positions(child_node.value)
    #     child_node.add_child(PolyTreeNode.new(child_node.value))
    #    end

    end

    def inspect
        puts "parent's value: #{@root_node.value}"
        puts "children:"
        @root_node.children.each_with_index do |child,i| 
            puts "#{i}. #{child.value}"
        end
    end

end

k = KnightPathFinder.new([0,0])
# p k.new_move_positions([2,1])
p k