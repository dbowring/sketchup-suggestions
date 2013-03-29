class Sketchup::Materials
    def load_skm(path_or_file_like_object, force_new=false)
        # Not currently (easily) possible
        # alternative names: load, load_file
        raise NotImplementedException.new('This feature is not implemented')
    end

    def remove(definition_or_array_of_materials)
        # Already exist - but only removes one material at the time - and
        # have a severe bug where the material is only removed from the list
        # of materials - not from the entities using it.
        #
        # Bulk erase method. This should (if possible) be more efficient than
        # arr.each() {|d| e.erase! } (and take only one operation)
        definition_or_array_of_materials.each() {|d| d.erase! }
    end
end

class Sketchup::Material
    def colorized?
        # Returns the colorised property of the material.
    end
    
    def colorized=(boolean)
        # Sets the colorized property of the material.
        # Perhaps this should be #colorize(color_value)
    end
    
    def reset_color
        # Resets the colorization of he material texture back to default.
    end
    
    def save_skm(path_or_file_like_object)
        # Not currently (easily) possible
        # alternative names: save, save_file
        raise NotImplementedException.new('This feature is not implemented')
    end

    def erase!(replacement=false)
        # At the moment this is undefined. It should "purge" the material from
        # the model.
        # Should anything be using this material, the replacement argument is
        # considered:
        #     false = raise exception if in use
        #     nil = replace with default material
        #     Sketchup::Material instance = replace with given material
        # This could also be aliased as purge!, although possibly removing the
        # optional argument
        raise NotImplementedException.new('This feature is not implemented')
    end
end
