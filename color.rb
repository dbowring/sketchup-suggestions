class Sketchup::Color
    def to_i()
        # Note this is ARGB, not BGR (which is what this method currently does)
        return (red << 16) | (green << 8) | blue | (alpha << 24)
    end

    def self.from_i(color)
        return [
            (color >> 16) & 255,
            (color >> 8) & 255,
            color & 255,
            (color >> 24) & 255,
        ]
    end
    
    def dup
        # Correctly implement #dup.
        #
        # I've been burned several times where I'd forgotten / didn't know that
        # #dup and #clone returned `nil` for this class and passed the result
        # to `view.draw` commands which in turn crashed SketchUp.
        self.new(to_a)
    end
    
    def clone
        # Correctly implement #clone.
    end
end
