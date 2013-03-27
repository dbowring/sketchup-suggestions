class Sketchup::Image
    def definition()
        # Images are in reality just and instance of a ComponentDefinition. Not need to
        # hide this.
    end
    
    def transformation()
        # It is currently impossible to correctly determine the position of a flipped
        # image entity. Getting the transformation object would simplify and make things
        # consistent.
    end
    
    def glued_to
        # Currently missing.
    end
    
    def glued_to=(face, instance_in_face_context = nil)
        # Currently missing.
        #
        # Also be able to glue entities like SketchUp UI does - on a face inside a group.
        # Currently the API allow you to only glue to a face in the same context.
    end
end

class Sketchup::Group
    def definition()
        # http://www.thomthom.net/thoughts/2012/02/definitions-and-instances-in-sketchup/
        if entities.parent.instances.include?(self)
            return instance.entities.parent
        end
        return entities.model.definitions.find() {|d|
            d.instances.include?(self)
        }
    end
    
    def glued_to
        # Currently missing.
    end
    
    def glued_to=(face, instance_in_face_context = nil)
        # Currently missing.
    end
end

class Sketchup::ComponentInstance
    def entities()
        # Allow for "transparent" use of Groups/Components
        # This has a possible pitfall in that you may not wish to modify all
        # instances, in which case you can specify by calling #make_unique
        # i.e., passing this point means accepting you may be modifying
        # more than one instance
        return definition.entities
    end
    
    def to_group
        # Some times one want to convert a component instance to a group.
    end
end

class Sketchup::ComponentDefinition
    def erase!()
        # At the moment this raises an exception - this should "purge" the
        # definition from the model - unless it has any instances, in which
        # case it throws an error( RuntimeError? )
        # This could also be aliased as purge!
        trans = Geom::Transformation.new()
        saves = self.model.definitions.find_all() {|d|
            d != self && d.instances.length.zero?
        }.map() {|d|
            self.model.active_entities.add_instance(d, trans)
        }
        self.model.definitions.purge_unused
        self.model.erase_entities(saves)
    end
    
    def internal=(boolean)
        # It'd allow for creation of component assemblies and keep the
        # component browser list clean.
    end
end

class Sketchup::DefinitionList
    def remove(definition_or_array_of_definitions)
        # Bulk erase method. This should (if possible) be more efficient than
        # arr.each() {|d| e.erase! } (and take only one operation)
        definition_or_array_of_definitions.each() {|d| d.erase! }
    end
end
