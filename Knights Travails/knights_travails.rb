require "byebug"
require '../Poly Tree Node/lib/tree_node.rb'

class KnightPathFinder
    attr_accessor :considered_positions

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
        moves.select {|pos| pos[0].between?(0,7) && pos[1].between?(0,7)} #array of possible moves given 8x8 board
    end

    def new_move_positions(pos)
        new_pos_array = KnightPathFinder.valid_moves(pos).reject {|e| @considered_positions.include?(e)} #[1,2], [2,1]
        # @considered_positions += new_pos_array
        new_pos_array
        
        # Option 1
        # new_pos.each do |child_pos| 
        #     poss_moves = KnightPathFinder.valid_moves(child_pos)
        #     poss_moves.each do |child_pos2|
        #       build_move_tree
    end

    def initialize(starting_position) #[0,0]

        @root_node = PolyTreeNode.new(starting_position)
        @considered_positions = [@root_node.value]
        build_move_tree(@root_node) #[0,0]

        
    end

    def build_move_tree(node) #[0,0]
        # start with queue of JUST the root node, check what are the new_move_pos available? add each of those as a child.
        # shift an element out, check it, if not, add its children to new_move_post
        if node.nil?
            return []
        else
            @considered_positions << new_move_positions(node.value)
            @considered_positions.each do |child_pos|
                child = node.add_child(PolyTreeNode.new(child_pos))
                # @considered_positions << child_pos
            end
            node.children.each {|c| build_move_tree(c)}
        end

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
p k.considered_positions