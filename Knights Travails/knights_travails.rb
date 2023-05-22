require './Poly Tree Node/lib/tree_node.rb'

class KnightPathFinder
    def self.valid_moves(pos)
        @considered_position = [pos]
        
    end

    def new_move_positions(move)
        KnightPathFinder.valid_moves(move) if !KnightPathFinder.considered_position.include?(move)
        KnightPathFinder.valid_moves(move) << pos
        KnightPathFinder.valid_moves(move)


    end

    def initialize(starting_position)
        KnightPathFinder.valid_moves(starting_position)


        
        @root_node = PolyTreeNode.new(starting_position)
        build_move_tree(@root_node)

        
    end

    def build_move_tree(start_pos)

    end



end

