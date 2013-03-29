class Sketchup::Layers
    def remove(definition_or_array_of_layers)
        # Bulk erase method. This should (if possible) be more efficient than
        # arr.each() {|d| e.erase! } (and take only one operation)
        definition_or_array_of_layers.each() {|d| d.erase! }
    end
end

class Sketchup::Layer
    def color
        # Get layer color.
    end
    
    def color=(color_value)
        # Set layer color.
    end
    
    def erase!(replacement=false)
        # At the moment this is undefined. It should "purge" the layer from
        #    the model.
        # Should anything be using this layer, the replacement argument is
        # considered:
        #     false = raise exception if in use
        #     nil = replace with "Layer0"
        #     Sketchup::Layer instance = replace with given layer
        # This could also be aliased as purge!, although possibly removing the
        # optional argument
    end
end
